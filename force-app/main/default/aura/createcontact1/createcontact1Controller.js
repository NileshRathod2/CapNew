({
    handleClick : function(component, event, helper) {
        var firstname = component.find("fname").get("v.value");
        var lastname = component.find("lname").get("v.value");
        var phone = component.find("phone").get("v.value");
        var email = component.find("email").get("v.value");
        //alert(firstname+' '+lastname+ ' ' +phone+ ' '+email);
        var accid= component.get("v.recordId");
        //alert(component.get("v.recordId"));
        var action = component.get("c.createContact");
        
        action.setParams({ fname : firstname, lname : lastname, email: email, phone : phone, accountId:accid });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                $A.get("e.force:closeQuickAction").fire();
                
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId":  response.getReturnValue(),
                    "slideDevName": "related"
                });
                navEvt.fire();
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": "The conact has been created successfully.",
                    "type":"success",
                    "mode": "pester"
                });
                toastEvent.fire();
                $A.get('e.force:refreshView').fire();
                alert("From server: " + response.getReturnValue());
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
                else if (state === "ERROR") {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Error!",
                        "message": "please correct the error.",
                        "type":"error",
                        "mode": "sticky"
                    });
                    toastEvent.fire();
                }
        });   
        $A.enqueueAction(action);
    }
})