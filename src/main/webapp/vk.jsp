<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Restful Music Search</title>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript">
	//<![CDATA[
	function vkRequest() {
		if ($("#query").val().length == 0) {
			alert("You should enter the artist");
		}
		var vkAPI = "/restful-music/vk/tracks/" + $("#query").val();
		console.log(vkAPI);
		$.ajax(
				{
					type : 'get',
					url : vkAPI,
					dataType : 'json',
					success : function(data) {
						console.log(data);
						var result = '<br/><ul>';
						for (var index = 1; index < data.length; index++) {

							result += '<li><a href="'+data[index]['url']+'">'
									+ data[index]['artist'];
							result += ' - ' + data[index]['title']
									+ '</a></li>';
						}
						result += '</ul>'
						console.log(result);
						$("#output").html(result);
					},
				}).fail(function(jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
			console.log(textStatus);
			console.log(errorThrown);
			location.href = vkAPI;
		});

		return false;
	}

	//]]>
</script>
</head>
<body>

	<table align="center">
		<tr>
			<td><a href="index.jsp">Main Page</a></td>
		</tr>
		<tr>
			<td><input type="text" id="query" /></td>
			<td><sec:authorize access="isAuthenticated()">
					<input type="submit" id="vk" value="Search on vk.com"
						onclick="vkRequest();" />
				</sec:authorize> <sec:authorize access="isAnonymous()">
					<a href="login.jsp">For search on vk.com you should be logged
						in</a>
				</sec:authorize></td>
		</tr>
		<tr>
			<td colspan="2"><div id="output" /></td>
		</tr>
	</table>
</body>
</html>