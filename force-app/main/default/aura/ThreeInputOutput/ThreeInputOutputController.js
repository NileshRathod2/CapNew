({
	handleClick : function(component, event, helper) {
        var buttonName = event.getSource().get("v.label");
        if(buttonName == 'first Leacture'){
            component.set("v.first",true);
            component.set("v.Second",false);
            component.set("v.first",false);
        }
        else if(buttonName == 'Second Leacture'){
             component.set("v.first",false);
             component.set("v.Second",true);
             component.set("v.first",false);
        }
            else {
            component.set("v.first",false);
            component.set("v.Second",false);
            component.set("v.first",true);
        }
	}
})