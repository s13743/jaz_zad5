function PersonListViewModel(){
	var self = this;
	self.people = ko.observableArray([new PersonViewModel({
		id:1,
		age:0,
			birthday
			:
			"06/28/2016",
			email
			:
			"a@wp.pl",
			firstName
			:
			"jan",
			gender
			:
			"Male",
			lastName
			:
			"kowalski"},self),new PersonViewModel({
				id:1,
				age:0,
					birthday
					:
					"06/28/2016",
					email
					:
					"a@wp.pl",
					firstName
					:
					"jan",
					gender
					:
					"Male",
					lastName
					:
					"kowalski"},self),new PersonViewModel({
						id:1,
						age:0,
							birthday
							:
							"06/28/2016",
							email
							:
							"a@wp.pl",
							firstName
							:
							"jan",
							gender
							:
							"Male",
							lastName
							:
							"kowalski"},self)]);
	self.page=ko.observable(1);
	self.next = function(){
		self.page(self.page()+1);
		self.getData();
	};
	self.prev = function(){
		self.page(self.page()-1);
		self.getData();
	};
	self.getData = function(){
		$.ajax({
            url: "/samplerestapp/rest/people?page=" + self.page(),
            type: "GET",
            contentType: "application/json",
            success: function (data) {
            	self.people([]);
            	var tmp = [];
            	for(var i=0; i<data.length;i=i+1){
            		tmp.push(new PersonViewModel(data[i], self));
            	}
            	self.people(tmp);
                $('.js-bday').datepicker();
            },
            error: function (XMLHttpRequest, testStatus, errorThrown) {
               alert("nie udało się")
               console.log(testStatus);
               console.log(errorThrown);
               console.log(XMLHttpRequest);
            }
        });
	}
	
}