<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="long_covid_11" />
	<jsp:param name="block_header" value="Long COVID: Shortness of Breath" />
	<jsp:param name="topic_description" value="secondary_11" />
	<jsp:param name="topic_title" value="Counts of Patients Who Have Experienced Shortness of Breath By COVID & Long COVID Status" />

	<jsp:param name="kpis" value="long_covid/kpis2.jsp" />
	<jsp:param name="kpi_filter" value="Shortness of breath" />

	<jsp:param name="age_filter4" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />
	
	<jsp:param name="symptom" value="Shortness%20of%20breath" />

	<jsp:param name="age_panel" value="long_covid/observationAge.jsp" />
	<jsp:param name="race_panel" value="long_covid/observationRace.jsp" />
	<jsp:param name="gender_panel" value="long_covid/observationGender.jsp" />
	<jsp:param name="ethnicity_panel" value="long_covid/observationEthnicity.jsp" />
	<jsp:param name="ethnicity_labelwidth" value="210" />
	<jsp:param name="gender_labelwidth" value="210" />
	<jsp:param name="race_labelwidth" value="210" />
	<jsp:param name="age_labelwidth" value="210" />

	<jsp:param name="datatable" value="long_covid/symptom_breath_table.jsp" />
	<jsp:param name="datatable_div" value="long_covid_symptom_breath" />
	<jsp:param name="datatable_feed" value="long_covid/feeds/symptom_ungrouped.jsp?symptom=Shortness+of+breath" />
	<jsp:param name="datatable_filtered_kpis" value="observation|Tested positive|tested_positive|patient_count,observation|Has U09.9 in Record|in_record|patient_count" />
	<jsp:param name="datatable_kpis2" value="long_individual" />
</jsp:include>
<script>
	long_covid_11_toggle("age");
</script>
