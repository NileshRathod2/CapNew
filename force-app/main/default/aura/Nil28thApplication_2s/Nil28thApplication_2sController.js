({
	handleComponentEvent : function(component, event, helper) {
		var retrivebutton = event.getParam("ButtonName1");
      // alert("This is parent and button clicked is: "+retrivebutton);
        component.set("v.abc", retrivebutton); //for printing result
	}
})