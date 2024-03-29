<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="dashboard" uri="http://icts.uiowa.edu/N3CDashboardTagLib"%>
<!DOCTYPE html>

<c:set var="path">public-health/${param.secondary_tab}</c:set>
<c:set var="did">${dashboard:dashboardDidByPath(path)}</c:set>

<html>
<dashboard:dashboard did="${did}">
	<jsp:include page="head.jsp">
		<jsp:param name="page" value="${tag_dashboard.title}"/>
	</jsp:include>
</dashboard:dashboard>
<script src="<util:applicationRoot/>/resources/auth.js"></script>

<style>
#ph_data_drop a[aria-expanded = "true"] span.btn:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f056";
  	font-weight: 900;
}

#ph_data_drop a[aria-expanded = "false"] span.btn:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f055";
	font-weight: 900;
}

#ph_data_drop .card-header{
	background-color: white;
}

.accordion_text{
	color: #212529!important;
}

#frame .datatable_overflow{
	width: 100%;
	overflow:scroll;
}

.limitations_drop a[aria-expanded = "true"] span.btn:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f056";
  	font-weight: 900;
}

.limitations_drop a[aria-expanded = "false"] span.btn:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f055";
	font-weight: 900;
}
</style>

<body>
	<jsp:include page="navbar.jsp" flush="true">
		<jsp:param name="page" value="health" />
	</jsp:include>

<!-- 	Breadcrumb logic is located in questions styled 3 and each dashboards panel -->
	<div class="container container-large content">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<util:applicationRoot/>/#dashboards">Dashboards</a></li>
			<li class="breadcrumb-item"><a id="dashboard_breadcrumb" href=""></a></li>
			<li id="topic_breadcrumb" class="breadcrumb-item active" aria-current="page"></li>
		</ol>
	</nav>

	<dashboard:dashboard did="${did}">
		<div class="row">
			<div class="col-12 mx-auto">
				<div class="row">
					<div class="col-12">
						<div id="ph-dash-top">
							<h1 id="dashboard_name" class="page-title"><dashboard:dashboardTitle/></h1>
							<div id="question-description" class="section-description heading-text text-max mx-auto"><dashboard:dashboardDescription/></div>
						</div>
					</div>
				</div>
			</div>
		</div>

			<script>
				cache_browser_history("public-health", "public-health")
			</script>

			<div class="mb-5">
				<div id="dashboard" style="display: block;">
					<div class="row">
						<div class="col-12 viz-col mx-auto">
							<div class="panel panel-primary top_panel">
								<div class="panel-body">
									<div id="question-tile">
										<div id="d3viz">
											<jsp:include page="new_ph/frame.jsp?did=${tag_dashboard.did}&tertiary_tab=${param.tertiary_tab}"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		<script>
			var titleBread = document.getElementById("dashboard_breadcrumb");
			titleBread.innerHTML = '<dashboard:dashboardTitle/>';
			titleBread.setAttribute("href", "<util:applicationRoot/>/${path}");
		</script>
	</dashboard:dashboard>
		
		
	<script>
 		// Trying to get back broswer button to load, currently only saves last broswer
		window.addEventListener('popstate', function (event) {
			location.reload();
		});
	</script>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
