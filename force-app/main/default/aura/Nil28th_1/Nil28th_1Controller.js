({
	handleClick : function(component, event, helper) {
		var bName= event.getSource().get("v.label"); //know to which buuton is clicked
          var BCEvent = component.getEvent("cmpEvent"); //instannce creation
        BCEvent.setParams({
            "ButtonName" :bName});  //set parameters which you want to send
        //use same attribute jo event main use kiya hai
        BCEvent.fire();
	}
})