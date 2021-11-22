<%--
  Created by IntelliJ IDEA.
  User: QyZhong
  Date: 2021/11/11
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</head>
<body>

<jsp:forward page="/emps"></jsp:forward>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
