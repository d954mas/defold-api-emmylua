import models.ElementModel;
import models.InfoModel;
import models.ParameterModel;

import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class LuaBuilder {
    private InfoModel infoModel;
    private Set<ElementModel> vars = new TreeSet<>();
    private Set<ElementModel> funs = new TreeSet<>();

    public String build(){
        StringBuilder builder = new StringBuilder();
        builder.append("--[[").append(infoModel.getBrief()).append("--]]").append("\n");
        builder.append("local ").append(infoModel.getNameSpace()).append(" = {}\n");
        for(ElementModel var:vars){
            builder.append("    ").append(var.getName()).append(" = nil").append("\n");
        }
        for(ElementModel fun:funs){
            builder.append("    ").append("function ").append(fun.getName()).append(" (");
            for(ParameterModel parameterModel: fun.getParameters()){
                if(parameterModel.getName().endsWith("...]")){
                    builder.append("...");
                }else{
                    builder.append(parameterModel.getName());
                }
                builder.append(", ");
            }
            builder.setLength(builder.length()-2);
            builder.append(") end\n");
        }
        builder.append("return ").append(infoModel.getNameSpace());
        return builder.toString();
    }

    public void addVar(ElementModel parameterModel){
        vars.add(parameterModel);
    }

    public void addFun(ElementModel parameterModel){
        funs.add(parameterModel);
    }

    public void setInfoModel(InfoModel infoModel) {
        this.infoModel = infoModel;
    }
}
