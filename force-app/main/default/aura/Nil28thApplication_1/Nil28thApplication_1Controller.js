({
	handleClick : function(component, event, helper) {
		var cName= event.getSource().get("v.label"); //know to which buuton is clicked	
        var DCEvent = component.getEvent("AppEvent"); //instannce creation
        DCEvent.setParams({
            "ButtonName1" : cName});
        DCEvent.fire();
	}
})