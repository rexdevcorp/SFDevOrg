({
	fireApplicationEvent : function(component, event, helper) {
		var appEvent = $A.get("e.c:ApplicationEvent");
		appEvent.setParams({
            "message" : component.get("v.MyMessage")});
        appEvent.fire();
	}
})