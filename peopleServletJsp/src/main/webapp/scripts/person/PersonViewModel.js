
function PersonViewModel(model,parent){
	var p = parent;
	var listOfPeople='listOfPeople';
	ko.mapping.fromJS(model,{},this);
	var self = this;

	self.show = function(){
		alert(ko.mapping.toJSON(self));
	};
	self.deleteMe = function(){
		$.ajax({
            url: "/samplerestapp/rest/people/"+self.id(),
            type: "DELETE",
            contentType: "application/json",
            success: function (data) {
                alert("udało się");
                p.getData();
            },
            error: function (XMLHttpRequest, testStatus, errorThrown) {
               alert("nie udało się")

            }
        });
	};
	self.updateMe = function(){
		$.ajax({
            url: "/samplerestapp/rest/people/"+self.id(),
            type: "PUT",
            data: ko.mapping.toJSON(self),
            contentType: "application/json",
            success: function (data) {
                alert("udało się");
                p.getData();
            },
            error: function (XMLHttpRequest, testStatus, errorThrown) {
               alert("nie udało się")

            }
        });
	};
	self.add = function(){
		$.ajax({
            url: "/samplerestapp/rest/people",
            type: "POST",
            data: ko.mapping.toJSON(self),
            contentType: "application/json",
            success: function (data) {
                alert("udało się");
            },
            error: function (XMLHttpRequest, testStatus, errorThrown) {
               alert("nie udało się")

            }
        });
	}
}