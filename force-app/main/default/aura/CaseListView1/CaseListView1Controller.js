({
	doInit : function(component, event, helper) {
		var serverQuery = component.get("c.getRelatedCases");
        serverQuery.setParams({"recordId" : component.get("v.recordId")});
        
		// Server response handling
        serverQuery.setCallback(this, function(response) {
            var state = response.getState();

            if (component.isValid() && state == "SUCCESS") {
                var resp = JSON.parse(response.getReturnValue());
                if (resp != null) {
                    var bindedList = resp['bindedList'];
                    if(bindedList.length > 0) component.set("v.BindedRelatedCases", bindedList);	
                    else component.set("v.NoOpenCases", true);	
                } else {
                    console.log("ERROR : CaseListView1Ctrl.doInit : Server returned null.");
                }
            } else {
                // Log error in console
                console.log("ERROR : CaseListView1Ctrl.doInit : " + state + response.getError() + response.getMessage());
            }
        });
        
		// Send action to server for execution
		$A.enqueueAction(serverQuery);
	},
    navigateToRecord: function (component, event, helper) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": event.target.id
        });
        navEvt.fire();
    }
})