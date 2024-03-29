<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
.block_header{
	text-align:center; 
	color:#fff; 
	background: #454F82;
	font-family: Arial, Helvetica, sans-serif;
	font-size:18px; 
	padding: 3px; 
	margin-top:20px;
}

</style>

<!-- A block is comprised of a header bar, an optional left column with KPIs and filters, and a main panel
	 that supports a set of optional sub-panels -->

<div class="row stats border">
	<div class="col-12 col-lg-12">
		<div class="block_header border">
			${param.block_header }
		</div>
	
		<div class="row">
		
			<!-- left column for KPIs and filters -->
	
			<div id="${param.block}-block-kpi" class="col-12 col-md-2 border pr-0">
				<c:if test="${not empty param.kpis}">
					<div class="kpi_containter">
						<jsp:include page="${param.kpis}?block=${param.block}&symptom=${param.kpi_filter}"/>
					</div>
				</c:if>
				<div class="panel-body border dash_filter_header">
					<p>Available Filters</p>
					<p class="dash-small-txt">click a category below to show/hide options<p>
				</div>

				<!-- filters are enabled by passing in a boolean parameter -->
				
				<c:if test="${param.severity_filter}">
					<jsp:include page="filters/severity.jsp"/>
				</c:if>
				<c:if test="${param.age_filter}">
					<jsp:include page="filters/age.jsp"/>
				</c:if>
				<c:if test="${param.age_filter4}">
					<jsp:include page="filters/age_4.jsp"/>
				</c:if>
				<c:if test="${param.race_filter}">
					<jsp:include page="filters/race.jsp"/>
				</c:if>
				<c:if test="${param.sex_filter}">
					<jsp:include page="filters/sex.jsp"/>
				</c:if>
				<c:if test="${param.ethnicity_filter}">
					<jsp:include page="filters/ethnicity.jsp"/>
				</c:if>
				<c:if test="${param.observation_filter}">
					<jsp:include page="filters/observation.jsp"/>
				</c:if>

				<button id="${param.block}_btn" class="btn button dash-filter-btn" onclick="${param.block}_filter_clear()"><i class="fa fa-filter" aria-hidden="true"></i> Clear all selections</button>
			</div>
			
			<!-- the main panel has a strip of optional selection buttons across the top, controlling the visibility of the matched sub-panel -->
			
			
			<div id="${param.block}-panel" class="col-12 col-md-10 border" >
				<div style="text-align:center; font-size: 1.2rem;">
					<c:if test="${not empty param.severity_panel || not empty param.age_panel || not empty param.sex_panel || not empty param.ethnicity_panel}">
					<span>Explore Topic By </span>
					<select id="${param.block}toggle_viz_select">
						<c:if test="${not empty param.severity_panel}">
							<option value="severity">Severity</option>
						</c:if>
						<c:if test="${not empty param.age_panel}">
							<option value="age">Age</option>
						</c:if>
						<c:if test="${not empty param.race_panel}">
							<option value="race">Race</option>
						</c:if>
						<c:if test="${not empty param.sex_panel}">
							<option value="sex">Sex</option>
						</c:if>
						<c:if test="${not empty param.ethnicity_panel}">
							<option value="ethnicity">Ethnicity</option>
						</c:if>
					</select>
					</c:if>
				</div>
				
<%-- 				<div id="${param.block}-btns" class="btn-select border"> --%>
<%-- 					<c:if test="${not empty param.severity_panel}"> --%>
<%-- 						<button id="${param.block}-severity-btn" class="btn btn-primary active" role="button" onclick="${param.block}_toggle('severity');">Severity</button> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${not empty param.age_panel}"> --%>
<%-- 						<button id="${param.block}-age-btn" class="btn btn-primary" role="button" onclick="${param.block}_toggle('age');">Age</button> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${not empty param.race_panel}"> --%>
<%-- 						<button id="${param.block}-race-btn" class="btn btn-primary" role="button" onclick="${param.block}_toggle('race');">Race</button> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${not empty param.sex_panel}"> --%>
<%-- 						<button id="${param.block}-sex-btn" class="btn btn-primary" role="button" onclick="${param.block}_toggle('sex');">Sex</button> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${not empty param.ethnicity_panel}"> --%>
<%-- 						<button id="${param.block}-ethnicity-btn" class="btn btn-primary" role="button" onclick="${param.block}_toggle('ethnicity');">Ethnicity</button> --%>
<%-- 					</c:if> --%>
<!-- 				</div> -->
				
				<c:if test="${not empty param.simple_panel}">
					<div id="${param.block}-simple" class="border" style="display: block;">
						<jsp:include page="${param.simple_panel}?panel=${param.simple_panel}&block=${param.block}&datatable_div=${param.datatable_div}"/>
					</div>
				</c:if>
				<c:if test="${not empty param.severity_panel}">
					<div id="${param.block}-severity" class="border" style="display: none;" src="${param.severity_panel}?panel=${param.severity_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.severity_labelwidth}">&label_width=${param.severity_labelwidth}</c:if><c:if test="${not empty param.severity_height}">&viz_height=${param.severity_height}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.age_panel}">
					<div id="${param.block}-age" class="border" style="display: none;" src="${param.age_panel}?panel=${param.age_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.age_labelwidth}">&label_width=${param.age_labelwidth}</c:if><c:if test="${not empty param.age_height}">&viz_height=${param.age_height}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.race_panel}">
					<div id="${param.block}-race" class="border" style="display: none;" src="${param.race_panel}?panel=${param.race_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.race_labelwidth}">&label_width=${param.race_labelwidth}</c:if><c:if test="${not empty param.race_height}">&viz_height=${param.race_height}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.sex_panel}">
					<div id="${param.block}-sex" class="border" style="display: none;" src="${param.sex_panel}?panel=${param.sex_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.sex_labelwidth}">&label_width=${param.sex_labelwidth}</c:if><c:if test="${not empty param.sex_height}">&viz_height=${param.sex_height}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.ethnicity_panel}">
					<div id="${param.block}-ethnicity" class="border" style="display: none;" src="${param.ethnicity_panel}?panel=${param.ethnicity_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.ethnicity_labelwidth}">&label_width=${param.ethnicity_labelwidth}</c:if><c:if test="${not empty param.ethnicity_height}">&viz_height=${param.ethnicity_height}</c:if>">
					</div>
				</c:if>

				<c:if test="${not empty param.datatable}">
					<div class="col-12 col-lg-12">
						<div class="block_header"></div>
						<div class="row">
							<div class="col-12 dash-dt-section" id="${param.datatable_div}"></div>
							<jsp:include page="${param.datatable}">
								<jsp:param name="feed" value="${param.datatable_feed}"/>
								<jsp:param name="target_div" value="${param.datatable_div}"/>
								<jsp:param name="target_kpis" value="${param.datatable_kpis}"/>
								<jsp:param name="target_filtered_kpis" value="${param.datatable_filtered_kpis}"/>
								<jsp:param name="block" value="${param.block}"/>
							</jsp:include>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>			

<script>

	function ${param.block}_constrain(filter, selection) {
		//// console.log("selection", selection)
		var selected = selection;
		if (selected != undefined && selected.length > 0)
			selected = "^" + selected + "$";
		else
			selected = '';
		${param.block}_constrain_table(filter, selected);
	}

	$('#${param.block}-severity-select').change(function() {
		${param.block}_constrain("severity", $(this).val().join('|'));
	    ${param.block}_refreshHistograms();
  	});

	$('#${param.block}-age-select').change(function() {
		${param.block}_constrain("age", $(this).val().join('|'));
	    ${param.block}_refreshHistograms();
  	});

	$('#${param.block}-race-select').change(function() {
		${param.block}_constrain("race", $(this).val().join('|'));
	    ${param.block}_refreshHistograms();
  	});

	$('#${param.block}-sex-select').change(function() {
		${param.block}_constrain("sex", $(this).val().join('|'));
	    ${param.block}_refreshHistograms();
  	});

	$('#${param.block}-ethnicity-select').change(function() {
		${param.block}_constrain("ethnicity", $(this).val().join('|'));
	    ${param.block}_refreshHistograms();
  	});

	$(document).ready(function() {       
		$('#${param.block}-severity-select').multiselect({		
		});
		$('#${param.block}-age-select').multiselect({		
		});
		$('#${param.block}-race-select').multiselect({		
		});
		$('#${param.block}-sex-select').multiselect({		
		});
		$('#${param.block}-ethnicity-select').multiselect({		
		});
	});

	function ${param.block}_filter_clear() {
		$('#${param.block}-severity-select').multiselect('deselectAll');
		$('#${param.block}-age-select').multiselect('deselectAll');
		$('#${param.block}-race-select').multiselect('deselectAll');
		$('#${param.block}-sex-select').multiselect('deselectAll');
		$('#${param.block}-ethnicity-select').multiselect('deselectAll');
		
		$("#${param.datatable_div}-table").DataTable().columns().search('').draw();
	    ${param.block}_refreshHistograms();
	}
	
	var ${param.block}_AgeArray = new Array();
	var ${param.block}_RaceArray = new Array();
	var ${param.block}_EthnicityArray = new Array();
	var ${param.block}_SexArray = new Array();
	var ${param.block}_SeverityArray = new Array();
	
	var ${param.block}_BeforeAfterArray = new Array();

	var ${param.block}_SexSeverityArray = new Array();
	var ${param.block}_SeveritySexArray = new Array();
	
	var ${param.block}_ObservationAgeArray = new Array();
	var ${param.block}_ObservationSexArray = new Array();
	var ${param.block}_ObservationRaceArray = new Array();
	var ${param.block}_IbservationEthnicityArray = new Array();
	
	var ${param.block}_SymptomAgeArray = new Array();
	var ${param.block}_SymptomSexArray = new Array();
	var ${param.block}_SymptomRaceArray = new Array();
	var ${param.block}_SymptomEthnicityArray = new Array();
	var ${param.block}_SymptomObservationArray = new Array();

	var ${param.block}_MedicationArray = new Array();
	var ${param.block}_DiabetesArray = new Array();

	function ${param.block}_refreshHistograms() {
	    var data = $("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().toArray();
	    // console.log(data);
	    var data2 = $("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data();
	    
	    
	    
	    //// console.log('${param.block}', "table data", data)
	    ${param.block}_refreshAgeArray(data);
	    ${param.block}_refreshRaceArray(data);
	    ${param.block}_refreshEthnicityArray(data);
	    ${param.block}_refreshSexArray(data);
	    ${param.block}_refreshSeverityArray(data);
	    
	    ${param.block}_refreshBeforeAfterArray(data);
	    
	    ${param.block}_refreshSexSeverityArray(data);
	    ${param.block}_refreshSeveritySexArray(data);
	    ${param.block}_refreshObservationAgeArray(data);
	    ${param.block}_refreshObservationSexArray(data);
	    ${param.block}_refreshObservationRaceArray(data);
	    ${param.block}_refreshObservationEthnicityArray(data);

	    ${param.block}_refreshSymptomAgeArray(data);
	    ${param.block}_refreshSymptomSexArray(data);
	    ${param.block}_refreshSymptomRaceArray(data);
	    ${param.block}_refreshSymptomEthnicityArray(data);
	    ${param.block}_refreshSymptomObservationArray(data);
	    
	    ${param.block}_refreshMedicationArray(data2);
	    ${param.block}_refreshDiabetesArray(data);
	    
	    if ('${param.block}' === 'long_covid_6') {
	    	${param.block}_before_refresh();
	    }

	    if (${param.block}_loaded("severity")) {
	    	${param.block}_severity_refresh();
	    }
	    if (${param.block}_loaded("age")) {
	    	${param.block}_age_refresh();
	    }
	    if (${param.block}_loaded("race")) {
	    	${param.block}_race_refresh();
	    }
	    if (${param.block}_loaded("sex")) {
	    	${param.block}_sex_refresh();
	    }
	    if (${param.block}_loaded("ethnicity")) {
	    	${param.block}_ethnicity_refresh();
	    }
	    if (${param.block}_loaded("medication")) {
	    	${param.block}_medication_refresh();
	    	${param.block}_class_refresh();
	    }
	  }
	
	function ${param.block}_toggle(selection) {
		if (selection == "severity") {
			$("#${param.block}-severity").css('display', 'block');
			$("#${param.block}-severity-btn").addClass("active");
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-age-btn").removeClass("active");
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-race-btn").removeClass("active");
			$("#${param.block}-sex").css('display', 'none');
			$("#${param.block}-sex-btn").removeClass("active");
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-ethnicity-btn").removeClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "age") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-severity-btn").removeClass("active");
			$("#${param.block}-age").css('display', 'block');
			$("#${param.block}-age-btn").addClass("active");
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-race-btn").removeClass("active");
			$("#${param.block}-sex").css('display', 'none');
			$("#${param.block}-sex-btn").removeClass("active");
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-ethnicity-btn").removeClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "race") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-severity-btn").removeClass("active");
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-age-btn").removeClass("active");
			$("#${param.block}-race").css('display', 'block');
			$("#${param.block}-race-btn").addClass("active");
			$("#${param.block}-sex").css('display', 'none');
			$("#${param.block}-sex-btn").removeClass("active");
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-ethnicity-btn").removeClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "sex") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-severity-btn").removeClass("active");
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-age-btn").removeClass("active");
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-race-btn").removeClass("active");
			$("#${param.block}-sex").css('display', 'block');
			$("#${param.block}-sex-btn").addClass("active");
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-ethnicity-btn").removeClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "ethnicity") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-severity-btn").removeClass("active");
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-age-btn").removeClass("active");
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-race-btn").removeClass("active");
			$("#${param.block}-sex").css('display', 'none');
			$("#${param.block}-sex-btn").removeClass("active");
			$("#${param.block}-ethnicity").css('display', 'block');
			$("#${param.block}-ethnicity-btn").addClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		
		${param.block}_load(selection);
	}

	$(document).ready(function () {
		  $('#${param.block}toggle_viz_select').change(function () {
			${param.block}_toggle($(this).val());
		  })
	});
	
	// manage incremental loading of panels on inner nav bar clicks
	//
	var ${param.block}_crumbs = '';
	
	function ${param.block}_load(selection) {
		var $this = $("#${param.block}-"+selection);
		var which = $this.attr('src');

		//// console.log("in main click", "${param.block}-"+selection, "which", which)
		if (!${param.block}_crumbs.includes(selection)) {
			$this.load("<util:applicationRoot/>/new_ph/"+which);
			${param.block}_crumbs = ${param.block}_crumbs + selection;
			//// console.log({
			//	which : which
			//});
		}
	};
	
	function ${param.block}_loaded(selection) {
		return ${param.block}_crumbs.includes(selection);
	}
</script>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="AgeArray"/>
	<jsp:param name="primary" value="age"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="RaceArray"/>
	<jsp:param name="primary" value="race"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SexArray"/>
	<jsp:param name="primary" value="sex"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="EthnicityArray"/>
	<jsp:param name="primary" value="ethnicity"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SeverityArray"/>
	<jsp:param name="primary" value="severity"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="BeforeAfterArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="condition_after_covid_positive"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SexSeverityArray"/>
	<jsp:param name="primary" value="sex"/>
	<jsp:param name="primary_abbrev" value="sex_abbrev"/>
	<jsp:param name="secondary" value="severity"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SeveritySexArray"/>
	<jsp:param name="primary" value="severity"/>
	<jsp:param name="primary_abbrev" value="severity_abbrev"/>
	<jsp:param name="secondary" value="sex"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="ObservationAgeArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="age"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="ObservationSexArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="sex"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="ObservationRaceArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="race"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="ObservationEthnicityArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="ethnicity"/>
</jsp:include>


<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomAgeArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="age"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomSexArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="sex"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomRaceArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="race"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomEthnicityArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="ethnicity"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomObservationArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="observation"/>
</jsp:include>

<jsp:include page="tripleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="MedicationArray"/>
	<jsp:param name="wrap" value="no"/>
	<jsp:param name="primary" value="drug_domain"/>
	<jsp:param name="secondary" value="concept_set_name"/>
	<jsp:param name="tertiary" value="age"/>
</jsp:include>

<jsp:include page="tripleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="DiabetesArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="sex"/>
	<jsp:param name="tertiary" value="age"/>
</jsp:include>
