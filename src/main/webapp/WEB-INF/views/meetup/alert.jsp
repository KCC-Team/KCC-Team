<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PET KCC</title>
<script>
    var msg = "<c:out value='${msg}'/>";
    var url = "<c:out value='${url}'/>";
    alert(msg);
    location.href = url;
</script>

</head>
<body>

</body>
</html>