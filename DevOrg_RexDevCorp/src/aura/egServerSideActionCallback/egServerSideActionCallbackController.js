({
	doInit : function(component, event, helper) {
		console.log('init4s');
		//var searchString = component.get("v.searchString");
        helper.doTheInit(component, event);
	},

	search : function(component, event, helper) {
		//var searchString = component.get("v.searchString");
       helper.search(component);
	},
    
    searchCallback : function(component, event, helper) {
       helper.handleSearchAccountCallback(component, event.getParam('arguments').response);        
	}   
})