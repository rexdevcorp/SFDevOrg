({
	checkBox : function(component, event, helper) {
		var cbox = event.target.checked;
        component.set("v.isChecked", cbox);
        console.log(cbox)
	}
})