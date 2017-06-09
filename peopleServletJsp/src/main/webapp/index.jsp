<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/templates" %>    
<t:layout>
	<jsp:attribute name="styles">
		<!-- put your styles here -->
	</jsp:attribute>
	<jsp:attribute name="scripts">
		<script type="text/javascript">
		$.ajax({
            url: "/samplerestapp/rest/service/test",
            type: "POST",
            data: ko.toJSON({
            	messege:"hello"
            }),
            contentType: "application/json",
            success: function (data) {
                alert("udało się");
            },
            error: function (XMLHttpRequest, testStatus, errorThrown) {
               alert("nie udało się")

            }
        });
			
		</script>	
		
	</jsp:attribute>
	<jsp:body>
		Hello World
	</jsp:body>
	
</t:layout>