<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="cumulative_2" />
	<jsp:param name="block_header" value="Enclave Cumulative Participat Demographics" />
	<jsp:param name="topic_description" value="secondary_2" />

	<jsp:param name="kpis" value="cumulative/kpis.jsp" />

	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />
	
	<jsp:param name="raceethncity_panel" value="cumulative/raceEthnicity.jsp" />
	<jsp:param name="racegender_panel" value="cumulative/raceGender.jsp" />

	<jsp:param name="datatable" value="cumulative/tables/demographics_table.jsp" />
	<jsp:param name="datatable_div" value="cumulative_demographics" />
	<jsp:param name="datatable_feed" value="cumulative/feeds/demographics.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />	
</jsp:include>

<script>
	cumulative_2_toggle("raceethnicity");
</script>