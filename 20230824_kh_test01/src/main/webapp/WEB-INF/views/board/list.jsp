<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list</title>
</head>
<body>
<h2>Board List</h2>
<script>
	var msg = '${msg}';
	if(msg) {
		alert(msg);
	}
	var msg = '${msg2}'
	if(msg){
		alert(msg)
	}
</script>
[[
${boardList}
]]

</body>
</html>