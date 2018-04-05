import models.DocModel;
import models.ElementModel;
import models.InfoModel;
import models.ParameterModel;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LuaBuilder {
    private InfoModel infoModel;
    private Map<String, ClassBuilder> classMap = new LinkedHashMap<>();

    public String build(DocModel docModel) {
        StringBuilder sb = new StringBuilder();
        HtmlToPlainText f = new HtmlToPlainText();
        sb.append("---").append(f.getPlainText(docModel.getInfoModel().getBrief())).append("\n");
        sb.append("---").append(f.getPlainText(docModel.getInfoModel().getDescription())).append("\n");
        sb.append("---@class ").append(docModel.getInfoModel().getNameSpace()).append("\n");
        sb.append("local ").append(docModel.getInfoModel().getNameSpace()).append(" = {}").append("\n");
        for (ElementModel em : docModel.getElements()) {
            if (em.getType().equals("FUNCTION")) {
                String funDesc = f.getPlainText(em.getDescription());
                if (!funDesc.equals("")) {
                    sb.append("---").append(f.getPlainText(em.getDescription())).append("\n");
                }
                if (em.getParameters().size() != 0) {
                    for (ParameterModel pm : em.getParameters()) {
                        Element spanElement = Jsoup.parseBodyFragment(pm.getDoc()).body().select("span").first();
                        String types = "";
                        String desc = "";
                        if (spanElement != null) {
                            types = spanElement.text();
                            desc = spanElement.nextSibling().toString();
                        } else {
                            types = pm.getFormatName();
                            desc = f.getPlainText(pm.getDoc());
                        }
                        sb.append("---@param ").append(pm.getFormatName()).append(" ").append(types).append(desc)
                                .append("\n");
                    }
                }
                if (em.getReturnvalues().size() != 0) {
                    for (ParameterModel pm : em.getReturnvalues()) {
                        Element spanElement = Jsoup.parseBodyFragment(pm.getDoc()).body().select("span").first();
                        String types = "";
                        String desc = "";
                        if (spanElement != null) {
                            types = spanElement.text();
                            desc = spanElement.nextSibling().toString();
                        } else {
                            types = pm.getName();
                            desc = f.getPlainText(pm.getDoc());
                        }
                        sb.append("---@return ").append(pm.getName()).append(" ").append(types).append(desc)
                                .append("\n");
                    }
                }
                sb.append("function ").append(em.getName()).append("(");
                for (ParameterModel pm : em.getParameters()) {
                    sb.append(pm.getFormatName()).append(", ");
                }
                if (em.getParameters().size() != 0) {
                    sb.setLength(sb.length() - 2);
                }
                sb.append(") end\n");
            } else if (em.getType().equals("VARIABLE")) {
                String brief = f.getPlainText(em.getBrief());
                if (!brief.equals("")) {
                    sb.append("---").append(brief).append("\n");
                }
                sb.append(em.getName()).append(" = nil").append("\n");
            } else if (em.getType().equals("MESSAGE")) {

            }
        }
        sb.append("\n").append("return ").append(docModel.getInfoModel().getNameSpace());
        return sb.toString();
    }

    private static String REPLACE_ALL_TAGS = "</?(p|span|div|code|ui|li).*?/?>";

    public String build() {
        StringBuilder builder = new StringBuilder();
        for (ClassBuilder classBuilder : classMap.values()) {
            classBuilder.build(builder);
        }

        if (classMap.size() > 0) {
            builder.append("return ").append(classMap.values().iterator().next().getName());
        }

        return builder.toString();
    }

    private ClassBuilder getClass(ElementModel em) {
        ClassBuilder cb = classMap.get(em.getClassName());
        if (cb == null) {
            cb = new ClassBuilder();
            cb.name = em.getClassName();
            classMap.put(cb.name, cb);
        }
        return cb;
    }


    public void addVar(ElementModel em) {
        getClass(em).addVar(em);
    }

    public void addFun(ElementModel em) {
        getClass(em).addFun(em);
    }

    public void setInfoModel(InfoModel infoModel) {
        this.infoModel = infoModel;
    }

    private class ClassBuilder {
        private String name;
        private Set<ElementModel> vars = new TreeSet<>();
        private Set<ElementModel> funs = new TreeSet<>();
        Pattern spanParam = Pattern.compile("<span class=\"type\">([^<&]+)</span>");
        Pattern commentParam = Pattern.compile("<p>([^<&]+)</p>");

        public String getName() {
            return name;
        }

        private String getParamString(ParameterModel parameterModel) {
            StringBuilder builder = new StringBuilder();
            builder.append("---@param ");
            builder.append(parameterModel.getFormatName()).append(" ");
            Matcher m = spanParam.matcher(parameterModel.getDoc());
            while (m.find()) {
                builder.append(m.group(1));
                builder.append("|");
            }
            builder.setLength(builder.length() - 1);
            String comment = parameterModel.getDoc().replaceAll("<span class=\"type\">([^<&]+)</span>", "")
                    .replaceAll(REPLACE_ALL_TAGS, "").replaceAll("\n", " ");
            builder.append(comment);
            return builder.toString();
        }

        private String getReturnString(ParameterModel parameterModel) {
            StringBuilder builder = new StringBuilder();
            builder.append("---@return ");
            Matcher m = spanParam.matcher(parameterModel.getDoc());
            while (m.find()) {
                builder.append(m.group(1));
                builder.append("|");
            }
            builder.setLength(builder.length() - 1);
            String comment = parameterModel.getDoc().replaceAll("<span class=\"type\">([^<&]+)</span>", "")
                    .replaceAll(REPLACE_ALL_TAGS, "").replaceAll("\n", " ");
            builder.append(comment);
            return builder.toString();
        }


        public void addVar(ElementModel parameterModel) {
            vars.add(parameterModel);
        }

        public void addFun(ElementModel parameterModel) {
            funs.add(parameterModel);
        }

        public void build(StringBuilder builder) {
            builder.append("---@class ").append(name).append("\n");
            builder.append("local ").append(name).append(" = {}\n");
            for (ElementModel var : vars) {
                builder.append("    ").append(var.getName()).append(" = nil").append("\n");
            }
            for (ElementModel fun : funs) {
                if (!fun.getDescription().equals("")) {
                    builder.append("---").append(formatString(fun.getDescription()).replaceAll("--", "---"))
                            .append("\n");
                }
                if (fun.getParameters().size() > 0) {
                    for (ParameterModel parameterModel : fun.getParameters()) {
                        builder.append(getParamString(parameterModel)).append("\n");
                    }
                    for (ParameterModel parameterModel : fun.getReturnvalues()) {
                        builder.append(getReturnString(parameterModel)).append("\n");
                    }
                }


                builder.append("    ").append("function ").append(fun.getName()).append("(");
                if (fun.getParameters().size() > 0) {
                    for (ParameterModel parameterModel : fun.getParameters()) {
                        if (parameterModel.getName().endsWith("...]")) {
                            builder.append("...");
                        } else {
                            builder.append(parameterModel.getName().replaceAll("\\[|\\]", ""));
                        }
                        builder.append(", ");
                    }
                    builder.setLength(builder.length() - 2);
                }
                builder.append(") end\n");
            }
        }
    }

    public static String formatString(String s) {
        s = s.replaceAll(REPLACE_ALL_TAGS, "")
                .replaceAll("&quot;", "\"")
                .replaceAll("\\n", "\n--");
        if (s.endsWith("--")) {
            s = s.substring(0, s.length() - 2);
        }
        if (s.endsWith("\n")) {
            s = s.substring(0, s.length() - 1);
        }
        return s;
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
            return result.replaceFirst("\\n---", "");
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
                }else if(name.equals("thead")){
                    for(int i=0;i<TABLE_WIDTH*2;i++){
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
                    for(int i=0;i<TABLE_WIDTH*2;i++){
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
