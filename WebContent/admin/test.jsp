<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>


<a href="/test-war/testservlet2">Kategorien laden</a> 
<form action="/test-war/testservlet3" method="get" enctype="multipart/form-data">
<select name="alleKategorienLaden">
    <c:forEach items="${alleKategorien}" var="kategorien">
   		 <option value="${kategorien.kategorie_id}">
   		 <c:out value="${kategorien.kategoriebezeichnung}"/>,
   		 <c:out value="${kategorien.geschlecht}" />
   		 </option>
   		 </c:forEach>
</select>
<button type="submit" name="speichern">speichern</button>
</form>
    
    

</body>
</html>