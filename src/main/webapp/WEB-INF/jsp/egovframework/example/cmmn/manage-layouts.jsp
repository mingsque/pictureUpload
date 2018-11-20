<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head> 
  		<tiles:insertAttribute name="header"/>
  	</head>
  	<body>
  		<tiles:insertAttribute name="nav"/>
  		<div class="content">
  			<tiles:insertAttribute name="left"/>
  			<tiles:insertAttribute name="content"/>
  		</div>
  		<tiles:insertAttribute name="slide"/>
  	</body>
  	<tiles:insertAttribute name="script"/>
</html>