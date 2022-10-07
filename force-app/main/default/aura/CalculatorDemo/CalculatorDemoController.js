({
    Calculate : function(component, event, helper) {
        var num1=parseInt(component.find("firstnum").get("v.value"));
        var num2=parseInt(component.find("secondnum").get("v.value"));
       // alert(num1 + num2);
       // component.set('v.output', parseInt(num1) + parseInt(num2));
       // 
       var result = 0;
        var buttonName = event.getSource().get("v.label");
        if(buttonName =='Addition'){
            result= num1 + num2;
            alert(result);
        }else if(buttonName =='Substraction'){
            result= num1-num2;
            alert(result);
        } else if(buttonName =='Multiplication'){
            result= num1*num2;
            alert(result);
            
        }else{
                result=num1 /num2;
                alert(result);
            }
     },
     
})