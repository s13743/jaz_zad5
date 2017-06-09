<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="styles" fragment="true" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="scripts" fragment="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<link rel="stylesheet" href="content/styles/styles.css"/>
		<link rel="stylesheet" href="content/styles/jquery-ui.min.css"/>
		<link rel="stylesheet" href="content/styles/jquery-ui.structure.min.css"/>
		<link rel="stylesheet" href="content/styles/jquery-ui.theme.min.css"/>
		<link rel="stylesheet" href="content/styles/bootstrap.min.css"/>
		<jsp:invoke fragment="styles"/>
	
	</head>
	<body>
		<div id="pageheader">
			<jsp:invoke fragment="header"/>	
		</div>
		<div id="menu" class="navbar navbar-inverse navbar-fixed-top">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="addperson.jsp">Add</a></li>
				<li><a href="people.jsp">Show all</a></li>
			</ul>
		</div>
		<div id="content" class="container">
			<jsp:doBody/>
		</div>
		
		<div id="footer">
			<script type="text/javascript" src="scripts/jquery-1.11.3.min.js"></script>
			<script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
			<script type="text/javascript" src="scripts/bootstrap.min.js"></script>
			<script type="text/javascript" src="scripts/knockout-3.3.0.js"></script>
			<script type="text/javascript" src="scripts/knockout.mapping.js"></script>
			
			<jsp:invoke fragment="scripts"/>
		</div>
	</body>
</html>






