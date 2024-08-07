<jsp:include page="../block3.jsp">
	<jsp:param name="block" value="timeline_2" />
	<jsp:param name="block_header" value="COVID+ Patients: Cumulative and 7-Day Rolling Average Counts" />
	<jsp:param name="topic_title" value="Cumulative and 7-Day Rolling Average Counts of COVID+ Patients" />
	<jsp:param name="topic_description" value="secondary_2" />
	<jsp:param name="folder" value="timeline" />


	<jsp:param name="kpis" value="timeline/kpis.jsp" />

	<jsp:param name="did" value="${param.did}" />
	
	<jsp:param name="simple_panel" value="timeline/cumulative.jsp" />

	<jsp:param name="datatable" value="timeline/positive_cases_by_date.jsp" />
	<jsp:param name="datatable_div" value="positives-by-date2" />
</jsp:include>


	

	
