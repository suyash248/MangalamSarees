<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><tiles:insertAttribute name="title" ignore="true" /></title>
	<jsp:include page="/WEB-INF/jsp/cssIncludes.jsp"/>	
	
</head>
<jsp:include page="/WEB-INF/jsp/jsIncludes.jsp"/>

<body bgcolor="#f8f8f8">
		
		<div id="navbarheader" class="col-sm-12 fg-toolbar ui-toolbar ui-widget-header ui-helper-clearfix ui-corner-tl ui-corner-tr" style="height:10%">
			<a class="col-sm-2" href="<c:url value='/home'/>">
				<img title="Home" height="60px" src="<c:url value='/resources/images/mangalam_logo1.gif'/>">
			</a>  <!-- <i class="fa fa-home fa-3x"></i> -->
			<!-- <p class="col-sm-5" style="margin-top:1%; color:grey; font: 50px arial, sans-serif;"></p> -->
			<a class="btn btn-default navbar-text navbar-right col-sm-1" style="margin-right:5px" href="<c:url value='/logout'/>">Logout <span class="badge"> <i class="fa fa-power-off"></i></span></a>
		</div>
		
		<div id="leftmenu" class="col-sm-3" style="padding:10px">
			<tiles:insertAttribute name="left" />
		</div>
		
		<div id="right" class="col-sm-9" style="padding:10px;">
			<div id="msgDiv" class="alert alert-success" style="display:none" role="alert"></div>
			<div id="errDiv" class="alert alert-danger" style="display:none" role="alert"></div>
			<div id="rightbody"><tiles:insertAttribute name="body" /></div>
		</div>
</body>
</html>
