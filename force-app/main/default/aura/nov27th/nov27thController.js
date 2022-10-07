({
	clickme : function(component, event, helper) {
		var firstname= component.find("fname").get("v.value");
        var city= component.find("lname").get("v.value");
        var phone= component.find("phone").get("v.value");
        
        alert(firstname+" "+city+ " " +phone);
        
        
        var action = component.get("c.createAccount");
        action.setParams({ fname : firstname , lname:city ,phone:phone });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert("Server Apex Call Successfull")
                alert("From server: " + response.getReturnValue());
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") { 
            }
        });
        $A.enqueueAction(action);
   
        
	}
})