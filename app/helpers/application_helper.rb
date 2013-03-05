module ApplicationHelper
  def hidden_div_if(condition,attributes={},&block)
    if condition
      attributes["style"] = "display:none" 
    end    
    content_tag("div",attributes,&block) # x新生成一个div，属性由attributes指定（来源参数和方法内指定），内容是block中的内容
  end
end
