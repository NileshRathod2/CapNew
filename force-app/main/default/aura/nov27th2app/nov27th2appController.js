({
	handleClick : function(component, event, helper) {
		var firstname = component.find("fname").get("v.value");
        var lastname = component.find("lname").get("v.value");
        var phone = component.find("phone").get("v.value");
        var email = component.find("email").get("v.value");
        alert(firstname+" "+lastname+ " " +phone+ " "+email);
	}
})