({
    ClickHere : function(component, event, helper) {
               
        var Name = component.find("EName").get("v.value");
        var date =component.find("ExpenseDate").get("v.value");
        var TransportMode = component.find("Transport").get("v.value");
        var TeaExpenses = component.find("TeaExp").get("v.value");
        //var OtherExpenses = component.find("OtherExp").get("v.value");
        var comments = component.find("ExpComments").get("v.value");
        
        alert(Name+"  "+TransportMode+"  "+TeaExpenses+" "+comments+" "+date);
        var action = component.get("c.createExpenses");
        action.setParams({ EName:Name,Transport:TransportMode,ExpenseDate:date,TeaExp:TeaExpenses,
                          ExpComments: comments});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert("Apex call succesfull");
                alert("From server: " + response.getReturnValue());  
            }
            else if (state === "INCOMPLETE") {     
            }
                else if (state === "ERROR") {
                                  }
        });
        $A.enqueueAction(action);
    },
     handleChange: function (cmp, event) {
        // This will contain an array of the "value" attribute of the selected options
        var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue);
    }
    
    

})