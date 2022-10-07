({
	handleClicks : function(component, event, helper) {
		var options =component.find("dropDown").get("v.value");
        component.set("v.selectOption",options);
	}
})