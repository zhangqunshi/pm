<%
	String error = (String)request.getAttribute("error");
	if (error != null) {
		out.println("<p><font color=red>" + error + "</font></p>");
	}
%>