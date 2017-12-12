({
	getAccountRec : function(component, event, helper) {
		var action = component.get("c.getAccount");
        action.setParams({
            "accId": component.get("v.recordId")
        });
        
        action.setCallback(this, function(response){
            console.log(response);
            var account = response.getReturnValue();
            component.set("v.accountRec", account);
        })
        
        $A.enqueueAction(action);
	},
    
    itsHover : function(component, event, helper) {
		console.log('itsHover');
        var toggle = (component.get("v.truthy") == true) ? component.set("v.truthy",false):component.set("v.truthy",true);
	},
})