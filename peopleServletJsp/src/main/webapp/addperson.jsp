<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/templates" %>    
<t:layout>
	<jsp:attribute name="styles">
		<!-- put your styles here -->
	</jsp:attribute>
	<jsp:attribute name="scripts">
		<script type="text/javascript" src="scripts/person/PersonViewModel.js"></script>	
		<script type="text/javascript">
			$(function(){
				var model = {
						firstName:'',
						lastName:'',
						gender:'',
						birthday:'',
						email:'',
						age:0
				};
				var viewModel = new PersonViewModel(model);
				var data = ko.toJSON( {
	            	messege:'data from web'
	            });
				ko.applyBindings(viewModel);
				$('#bday').datepicker();
			})
		</script>
	</jsp:attribute>
	<jsp:body>
		
		<div class="form-group">
		<label>First Name <input class="form-control" type="text" data-bind="value: firstName"/></label>
		</div>
		<div class="form-group">
		<label>Last Name <input class="form-control" type="text" data-bind="value: lastName"/></label>
		</div><div class="form-group">
		<div class="form-group">
		<label>Email <input class="form-control" type="text" data-bind="value: email"/></label>
		</div><div class="form-group">
		<label>Name <select class="form-control" type="text" data-bind="value: gender">
			<option value="Male">Male</option>
			<option value="Female">Female</option>
		</select></label>
		</div>
		<div class="form-group">
		<label>Age <input class="form-control" type="text" data-bind="value: age"/></label><br/></div>
		<div class="form-group">
		<label>Birthday <input class="form-control" type="text" id="bday" data-bind="value: birthday"/></label><br/>
		</div>
		<div class="form-group">
		<button class="btn btn-primary btn-xs" data-bind="click:show">Show json</button><br/>
		</div>
		<div class="form-group"><button class="btn btn-success"  data-bind="click:add">Add</button><br/>
		</div>
		
	</jsp:body>
	
</t:layout>