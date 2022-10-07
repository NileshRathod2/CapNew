({
    handleComponentEvent : function(component, event, helper) {
         var ButtonSelected = event.getParam("ButtonName");

        //alert("This is parent and button clicked is: "+ButtonSelected);
        component.set("v.selectedButton", ButtonSelected); //for printing result
    }
})