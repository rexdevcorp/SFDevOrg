({
	myAction : function(component, event, helper) {
        console.log('hi - ',component.get("v.contact"));
		var accountId = component.find("contactName").get("v.value");
        console.log(accountId);
	}
})