<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
</head>

<body>
<div class="header">
    <div id="headerTitle"><tiles:insertAttribute name="header" /></div>
</div>
<div class="menu">
    <tiles:insertAttribute name="menu" />
</div>
<div   class="content">
    <tiles:insertAttribute name="content" />
</div>
<div class="footer">
    <tiles:insertAttribute name="footer" />
</div>
</body>
</html>
