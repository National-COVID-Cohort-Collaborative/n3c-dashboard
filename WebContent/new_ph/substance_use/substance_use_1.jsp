<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block3.jsp">
	<jsp:param name="block" value="substance_use_1" />
	<jsp:param name="block_header" value="Substance Use: Alcohol" />
	<jsp:param name="folder" value="substance_use" />
	<jsp:param name="topic_description" value="secondary_1" />
	<jsp:param name="did" value="${param.did}" />
	<jsp:param name="topic_title" value="Patients w/an Alcohol-Related Condition" />

	<jsp:param name="kpis" value="substance_use/kpis.jsp" />
	
	<jsp:param name="age_filter_ideal" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="sex_filter" value="true" />
	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="mortality_filter" value="true" />
	<jsp:param name="alcohol_filter" value="true" />
	
	<jsp:param name="toggle" value="true" />
	
	<jsp:param name="viz_properties" value="{'age' : [{
			dimension: 'age',
			domName: '#substance_use_1_age_viz',
			barLabelWidth: 100,
			min_height: 300,
			ordered: 0,
			colorscale: age_range_all,
			legend_label: 'Age',
			legend_data: age_legend_ideal,
			donutRatio: 0.5
		}], 'race' : [{
			dimension: 'race',
			domName: '#substance_use_1_race_viz',
			barLabelWidth: 100,
			min_height: 300,
			ordered: 0,
			colorscale: race_range,
			legend_label: 'Race',
			legend_data: race_legend,
			donutRatio: 0.5
		}], 'sex' : [{
			dimension: 'sex',
			domName: '#substance_use_1_sex_viz',
			barLabelWidth: 100,
			min_height: 300,
			ordered: 0,
			colorscale: sex_range,
			legend_label: 'Sex',
			legend_data: sex_legend,
			donutRatio: 0.5
		}], 'severity' : [{
			dimension: 'severity',
			domName: '#substance_use_1_severity_viz',
			barLabelWidth: 100,
			min_height: 300,
			ordered: 0,
			colorscale: severity_range,
			legend_label: 'Severity',
			legend_data: severity_legend,
			donutRatio: 0.5
		}], 'mortality' : [{
			dimension: 'mortality',
			domName: '#substance_use_1_mortality_viz',
			barLabelWidth: 100,
			min_height: 300,
			ordered: 0,
			colorscale: mortality_range,
			legend_label: 'Mortality',
			legend_data: mortality_legend,
			donutRatio: 0.5
		}], 'alcohol' : [{
			dimension: 'condition',
			domName: '#substance_use_1_alcohol_viz',
			barLabelWidth: 320,
			min_height: 300,
			ordered: 0,
			colorscale: categorical2,
			legend_label: 'Alcohol',
			legend_data: alcohol_condition_legend,
			donutRatio: 0.5
		}]
	}"/>
	
	<jsp:param name="age_panel" value="substance_use/age.jsp" />
	<jsp:param name="race_panel" value="substance_use/race.jsp" />
	<jsp:param name="sex_panel" value="substance_use/sex.jsp" />
	<jsp:param name="severity_panel" value="substance_use/severity.jsp" />
	<jsp:param name="mortality_panel" value="substance_use/mortality.jsp" />
	<jsp:param name="alcohol_panel" value="substance_use/alcohol.jsp" />

	<jsp:param name="datatable" value="substance_use/tables/alcohol_demographics.jsp" />
	<jsp:param name="datatable_div" value="substance_alcohol_demo" />
	<jsp:param name="datatable_feed" value="substance_use/feeds/alcohol_demographics.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
	
	<jsp:param name="AgeArray" value="true" />
	<jsp:param name="RaceArray" value="true" />
	<jsp:param name="SexArray" value="true" />
	<jsp:param name="SeverityArray" value="true" />
	<jsp:param name="MortalityArray" value="true" />
	<jsp:param name="AlcoholArray" value="true" />

</jsp:include>

<script>
	var panels = ["age", "race", "sex", "severity", "mortality", "alcohol"];
	substance_use_1_panel(panels);
</script>
