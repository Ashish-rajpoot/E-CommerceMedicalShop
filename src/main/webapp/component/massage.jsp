<%
String success = (String) session.getAttribute("successMsg");

if (success != null) {
%>
<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<%=success%>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
session.removeAttribute("successMsg");
}
%>
<%
String error = (String) session.getAttribute("errorMsg");

if (error != null) {
%>
<div class="alert alert-warning alert-dismissible fade show"
	role="alert">
	<%=error%>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
session.removeAttribute("errorMsg");
}
%>