<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block3.jsp">
	<jsp:param name="block" value="med_snap_5" />
	<jsp:param name="block_header" value="Sotrovimab Treated Patients: Vaccinations" />
	<jsp:param name="topic_description" value="secondary_5" />
	<jsp:param name="topic_title" value="Counts of Patients Who Have Been Prescribed Sotrovimab by Severity and Vaccination Status" />
	<jsp:param name="folder" value="medication_snapshot" />

	<jsp:param name="kpis" value="medication_snapshot/kpis.jsp" />
	
	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="vaccinated_filter" value="true" />
	
	<jsp:param name="did" value="${param.did}" />

	<jsp:param name="simple_panel" value="medication_snapshot/severity_vac.jsp" />

	<jsp:param name="datatable" value="medication_snapshot/tables/vac_table.jsp" />
	<jsp:param name="datatable_div" value="sotrovimab_vax" />
	<jsp:param name="datatable_feed" value="medication_snapshot/feeds/sotrovimab_vac.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
	
	<jsp:param name="vaccinatedSeverityArray" value="true" />
</jsp:include>



