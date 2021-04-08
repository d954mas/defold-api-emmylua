import models.DocModel;
import models.ElementModel;
import models.ParameterModel;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.Elements;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;

import java.util.Comparator;

public class LuaBuilder {


    private void buildParameterModel(ParameterModel pm, StringBuilder sb, HtmlToPlainText f) {
        for(int i=0;i<pm.getTypes().size();i++){
            sb.append(pm.getTypes().get(i));
            if(i!= pm.getTypes().size()-1){
                sb.append("|");
            }
        }
        String doc = pm.getDoc();
        if(doc.contains("<ul>")){
            doc = doc.substring(0,doc.indexOf("<ul>"));
        }
        if(doc.contains("<dl>")){
            doc = doc.substring(0,doc.indexOf("<dl>"));
        }
        sb.append(" ").append(f.getPlainText(doc).replaceAll("\n---" , " "));
        while (sb.charAt(sb.length()-1) == '\n'){sb.deleteCharAt(sb.length()-1);}
        sb.append("\n");
    }


    public String build(DocModel docModel) {
        //do not add global builtins table
        boolean isBuiltins = docModel.getInfoModel().getNamespace().equals("builtins");
        StringBuilder sb = new StringBuilder();
        StringBuilder inlineTables = new StringBuilder().append("\n");
        HtmlToPlainText f = new HtmlToPlainText();
        sb.append("---").append(f.getPlainText(docModel.getInfoModel().getBrief())).append("\n");
        sb.append("---").append(f.getPlainText(docModel.getInfoModel().getDescription())).append("\n");
        if(!isBuiltins){
            sb.append("---@class ").append(docModel.getInfoModel().getNamespace()).append("\n");
            sb.append("").append(docModel.getInfoModel().getNamespace()).append(" = {}").append("\n");
        }else{
            sb.append("\n");
        }

        docModel.getElements().sort(Comparator.naturalOrder());
        for (ElementModel em : docModel.getElements()) {
            if (em.getType().equals("FUNCTION")) {
                String funDesc = f.getPlainText(em.getDescription());
                if (!funDesc.equals("")) {
                    sb.append("---").append(f.getPlainText(em.getDescription()));
                    while (sb.charAt(sb.length()-1) == '\n'){sb.deleteCharAt(sb.length()-1);}
                    sb.append("\n");
                }
                if (em.getParameters().size() != 0) {
                    for (ParameterModel pm : em.getParameters()) {
                        //do not add annotation for ...
                        if(!pm.getFormatName().equals("...")){
                            sb.append("---@param ");
                        }else{
                            sb.append("--- ");
                        }
                        sb.append(pm.getFormatName()).append(" ");
                        buildParameterModel(pm, sb, f);

                    }
                }
                if (em.getReturnvalues().size() != 0) {
                    for (ParameterModel pm : em.getReturnvalues()) {
                        sb.append("---@return ");
                        buildParameterModel(pm, sb, f);
                    }
                }

                sb.append("function ").append(em.getName()).append("(");
                for (ParameterModel pm : em.getParameters()) {
                    sb.append(pm.getFormatName()).append(", ");
                }
                if (em.getParameters().size() != 0) {
                    sb.setLength(sb.length() - 2);
                }
                sb.append(") end\n\n");
            } else if (em.getType().equals("VARIABLE")) {
                String brief = f.getPlainText(em.getBrief());
                if (!brief.equals("")) {
                    sb.append("---").append(brief).append("\n");
                }
                sb.append(em.getName()).append(" = nil").append("\n");
            } else if (em.getType().equals("MESSAGE")) {

            }
        }

        sb.append(inlineTables.toString()).append("\n");
        if(!isBuiltins){
            sb.append("\n").append("return ").append(docModel.getInfoModel().getNamespace());
        }
        return sb.toString();
    }

    private static class HtmlToPlainText {
        /**
         * Format an Element to plain-text
         *
         * @param element the root element to format
         * @return formatted text
         */
        public String getPlainText(Element element) {
            FormattingVisitor formatter = new FormattingVisitor();
            NodeTraversor.traverse(formatter, element); // walk the DOM, and call .head() and .tail() for each node
            String result = formatter.toString();
            if (result.endsWith("---")) {
                result = result.substring(0, result.length() - 3);
            }
            return result;
        }

        public String getPlainText(String str) {
            Element element = Jsoup.parseBodyFragment(str).body();
            return getPlainText(element);
        }

        // the formatting rules, implemented in a breadth-first DOM traverse
        private class FormattingVisitor implements NodeVisitor {
            private static final int maxWidth = 8000;
            private static final int TABLE_WIDTH = 30;
            private boolean insideTable;
            private int td = 0;
            private int width = 0;
            private String textInsideTd = "";
            private int prevTextInsodeTdSize = 0;
            private StringBuilder accum = new StringBuilder(); // holds the accumulated text

            // hit when the node is first seen
            public void head(Node node, int depth) {
                String name = node.nodeName();
                if (node instanceof TextNode) {
                    TextNode node1 = (TextNode) node;
                    if (!insideTable) {
                        append(node1.getWholeText()
                                .replaceAll("\n", "\n---"));
                    }
                    if (insideTable && !node1.getWholeText().equals("\n")) {
                        textInsideTd += node1.getWholeText();
                    }
                } else if (name.equals("li"))
                    append("\n--- * ");
                else if (name.equals("dt"))
                    append("  ");
                else if (StringUtil.in(name, "p", "h1", "h2", "h3", "h4", "h5", "tr"))
                    append("\n---");
                else if (name.equals("table"))
                    insideTable = true;
                else if (name.equals("td") || name.equals("th")) {
                    td++;
                } else if (name.equals("thead")) {
                    for (int i = 0; i < TABLE_WIDTH * 2; i++) {
                        //  append("-");
                    }
                }
            }

            // hit when all of the node's children (if any) have been visited
            public void tail(Node node, int depth) {
                String name = node.nodeName();
                //if (StringUtil.in(name, "br", "dd", "dt", "p", "h1", "h2", "h3", "h4", "h5"))
                // append("\n");
                if (name.equals("a"))
                    append(String.format(" <%s>", node.absUrl("href")));
                if (name.equals("table")) insideTable = false;
                else if (name.equals("td") || name.equals("th")) {
                    for (int i = 1; i < td; i++) {
                        for (int j = 1; j <= TABLE_WIDTH - prevTextInsodeTdSize; j++) {
                            append(" ", true);
                        }
                    }
                    append(textInsideTd);
                    prevTextInsodeTdSize = textInsideTd.length();
                    textInsideTd = "";
                } else if (name.equals("tr")) {
                    td = 0;
                    prevTextInsodeTdSize = 0;
                    //append("\n");
                    for (int i = 0; i < TABLE_WIDTH * 2; i++) {
                        //   append("-");
                    }
                }
            }

            private void append(String text) {
                append(text, false);
            }

            // appends text to the string builder with a simple word wrap method
            private void append(String text, boolean addEmpty) {
                if (text.startsWith("\n"))
                    width = 0; // reset counter if starts with a newline. only from formats above, not in natural text
                if (!addEmpty && (text.equals(" ") &&
                        (accum.length() == 0 || StringUtil.in(accum.substring(accum.length() - 1), " ", "\n"))))
                    return; // don't accumulate long runs of empty spaces

                if (text.length() + width > maxWidth) { // won't fit, needs to wrap
                    String words[] = text.split("\\s+");
                    for (int i = 0; i < words.length; i++) {
                        String word = words[i];
                        boolean last = i == words.length - 1;
                        if (!last) // insert a space if not the last word
                            word = word + " ";
                        if (word.length() + width > maxWidth) { // wrap and reset counter
                            accum.append("\n").append(word);
                            width = word.length();
                        } else {
                            accum.append(word);
                            width += word.length();
                        }
                    }
                } else { // fits as is, without need to wrap text
                    accum.append(text);
                    width += text.length();
                }
            }

            @Override
            public String toString() {
                return accum.toString();
            }
        }
    }
}
