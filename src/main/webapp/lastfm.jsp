<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Restful Music Search</title>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript">
	//<![CDATA[
    function lastFmRequest() {
		if ($( "#query" ).val().length == 0) {
			alert("You should enter the artist");
		}
		var vkAPI = "/restful-music/lastfm/tracks/"+$( "#query" ).val();
		console.log(vkAPI);
		$.ajax({
			type: 'get',
			url: vkAPI,
			dataType: 'json',
			success: function (data) {
                var arrayList = data['toptracks']['track'];
                var result = '<br/><ul>';
                for(var element in arrayList) {
                	console.log(element);
                	result += '<li><a href="'+arrayList[element]['url']+'">'+arrayList[element]['artist']['name'];
                	result +=' - '+ arrayList[element]['name'] + '</a></li>';
                }
               	result += '</ul>';
                console.log(result);
                $("#output").html(result);
            },
			})
			.fail(function( jqXHR, textStatus, errorThrown ) {
				console.log(jqXHR);
				console.log(textStatus);
				console.log(errorThrown);
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
			<td><input type="submit" value="Search on last.fm" onclick="lastFmRequest()" /></td>
		</tr>
		<tr><td colspan="2"><div id="output" /></td></tr>
	</table>
	
	
</body>
</html>