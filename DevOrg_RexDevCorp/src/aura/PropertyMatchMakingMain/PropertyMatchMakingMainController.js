({
	toggleDropDown : function(component, event, helper) {
        if(component.get("v.toggleDropdown") == 'slds-is-close'){
            component.set("v.toggleDropdown", 'slds-is-open');
        }
        else{
            component.set("v.toggleDropdown", 'slds-is-close');
        }
	}
})