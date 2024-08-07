<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="dashboard" uri="http://icts.uiowa.edu/N3CDashboardTagLib"%>



<jsp:include page="../resources/dash_style.css" flush="true" />

<!-- A block is comprised of a header bar, an optional left column with KPIs and filters, and a main panel
	 that supports a set of optional sub-panels -->
	 
<div class="row stats block2 mx-auto">
					
				
				
	<div class="col-12">
	
		<!-- Alert for pre filters -------------------------- -->
		<div id="${param.block}_alert" class="row viz_info_box no_clear alert alert-primary">
			<span class="filter_info">
			</span>
			<button type="button" class="close ml-auto" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	
		
<!-- KPIs & related dashboards ----------------------------------------------------------------------------------------------------------- -->	
		<div class="row" style="margin-top: 30px;">
			<div class="col col-12 col-lg-2 side-col">
				<c:if test="${not empty param.toggle}">
					<div id="mode" class="panel-heading filter-section">
						<jsp:include page="barPieToggle_new.jsp">
							<jsp:param name="block" value="${param.block}" />
							<jsp:param name="viz_properties" value="${param.viz_properties}" />
						</jsp:include>
					</div>
				</c:if>
				
				<c:if test="${not empty param.toggle2}">
					<div id="mode" class="panel-heading filter-section">
						<jsp:include page="groupedbarpercentToggle_new.jsp">
							<jsp:param name="block" value="${param.block}" />
							<jsp:param name="viz_properties" value="${param.viz_properties}" />
						</jsp:include>
					</div>
				</c:if>
				
				<c:if test="${not empty param.toggle3}">
					<div id="mode" class="panel-heading filter-section">
						<jsp:include page="barPieToggle_new2.jsp">
							<jsp:param name="block" value="${param.block}" />
							<jsp:param name="viz_properties" value="${param.viz_properties}" />
						</jsp:include>
					</div>
				</c:if>
				
				<c:if test="${not empty param.al_opi_heat_order}">
					<div id="al_opi_heat_order" class="panel-heading filter-section">
						<h4 style="flex-fill:1;">Order</h4>
						<select id="alc_opi_order">
							<option value="name">by Name</option>
							<option value="frequency">by Frequency</option>
						</select>
					</div>
				</c:if>
				<c:if test="${not empty param.al_smo_heat_order}">
					<div id="al_smo_heat_order" class="panel-heading filter-section">
						<h4 style="flex-fill:1;">Order</h4>
						<select id="alc_smo_order">
							<option value="name">by Name</option>
							<option value="frequency">by Frequency</option>
						</select>
					</div>
				</c:if>
				<c:if test="${not empty param.opi_smo_heat_order}">
					<div id="opi_smo_heat_order" class="panel-heading filter-section">
						<h4 style="flex-fill:1;">Order</h4>
						<select id="opi_smo_order">
							<option value="name">by Name</option>
							<option value="frequency">by Frequency</option>
						</select>
					</div>
				</c:if>
				
				
				
				<c:if test="${not empty param.severity_filter || not empty param.age_filter_min || not empty param.age_filter_sec
							 || not empty param.age_filter_ideal || not empty param.age_filter5 || not empty param.age_filter6
							 || not empty param.age_filter7 || not empty param.age_filterpeds || not empty param.age_filterpeds2
							 || not empty param.race_filter || not empty param.sex_filter || not empty param.ethnicity_filter 
							 || not empty param.observation_filter || not empty param.symptom_filter || not empty param.beforeafter_filter
							 || not empty param.result_filter || not empty param.delay_filter || not empty param.diagnosis_filter
							 || not empty param.medication_filter || not empty param.medication_class_filter || not empty param.medications_filter
							 || not empty param.reinfectionbin_filter || not empty param.paxlovid_filter || not empty param.covid_filter
							 || not empty param.beforeaftermedication_filter || not empty param.metformin_filter || not empty param.long_filter
							 || not empty param.region_filter || not empty param.sotrovimabmeds_filter || not empty param.cciscore_filter
							 || not empty param.smoking_filter || not empty param.environmental_filter || not empty param.environmental_filter2
							 || not empty param.beforeaftersotrovimab_filter || not empty param.comorbidities_filter || not empty param.mortality_filter
							 || not empty param.alcohol_status_filter || not empty param.opioids_status_filter || not empty param.cannabis_status_filter
							 || not empty param.vaccinated_filter || not empty param.opioid_filter || not empty param.alcohol_filter || not empty param.anti_opioids_filter
							 || not empty param.condition_filter || not empty param.comorbidity_filter || not empty param.count_filter}">
					<div id="${param.block}filter_checks" class="panel-primary filter-section filter_checks">
						<div class="filters-label">
							<h4 style="flex-fill:1;">Filters</h4>
							<div>
								<span class="btn btn-link p-0 filters-pin" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pin/Unpin Filters Section" aria-hidden="true" onclick="${param.block}_sticky_toggle()"></span>
							</div>
						</div>
						<button id="${param.block}_btn_clear" class="btn button dash-filter-btn2 mt-0 no_clear" onclick="${param.block}_filter_clear()"><i class="fas fa-times-circle"></i> Clear Filters</button>
    					<div id="${param.block}-block-kpi" class="kpi_section">
							<!-- filters are enabled by passing in a boolean parameter -->
							
							<c:if test="${param.condition_filter}">
								<jsp:include page="filters_new/condition.jsp"/>
							</c:if>
							<c:if test="${param.cms_filter}">
								<jsp:include page="filters_new/cms.jsp"/>
							</c:if>
							<c:if test="${param.condition_filter|| param.cms_filter}">
								<p style="text-align:center; color: gray; font-size: 8px; margin-bottom: 10px;"><i class="fas fa-circle"></i>&ensp; <i class="fas fa-circle"></i>&ensp; <i class="fas fa-circle"></i></p>
							</c:if>
							
							<c:if test="${param.age_filter_min}">
								<jsp:include page="filters_new/age_min.jsp"/>
							</c:if>
							<c:if test="${param.age_filter_sec}">
								<jsp:include page="filters_new/age_sec.jsp"/>
							</c:if>
							<c:if test="${param.age_filter_ideal}">
								<jsp:include page="filters_new/age_ideal.jsp"/>
							</c:if>
							<c:if test="${param.ethnicity_filter}">
								<jsp:include page="filters_new/ethnicity.jsp"/>
							</c:if>
							<c:if test="${param.race_filter}">
								<jsp:include page="filters_new/race.jsp"/>
							</c:if>
							<c:if test="${param.sex_filter}">
								<jsp:include page="filters_new/sex.jsp"/>
							</c:if>
							
							<c:if test="${(param.age_filter_min || param.age_filter_sec || param.age_filter_ideal || param.ethnicity_filter || param.race_filter || param.sex_filter) && !param.only_demo}">
								<p style="text-align:center; color: gray; font-size: 8px; margin-bottom: 10px;"><i class="fas fa-circle"></i>&ensp; <i class="fas fa-circle"></i>&ensp; <i class="fas fa-circle"></i></p>
							</c:if>

							<c:if test="${param.alcohol_filter}">
								<jsp:include page="filters_new/alcohol.jsp"/>
							</c:if>
							<c:if test="${param.alcohol_status_filter}">
								<jsp:include page="filters_new/alcohol_status.jsp"/>
							</c:if>
							<c:if test="${param.cannabis_status_filter}">
								<jsp:include page="filters_new/cannabis_status.jsp"/>
							</c:if>
							<c:if test="${param.cciscore_filter}">
								<jsp:include page="filters_new/cciscore.jsp"/>
							</c:if>
							
							<c:if test="${param.nu_conditions_filter}">
								<jsp:include page="filters_new/condition_count.jsp"/>
							</c:if>
							<c:if test="${param.count_filter}">
								<jsp:include page="filters_new/count.jsp"/>
							</c:if>
							<c:if test="${param.conditions_filter}">
								<jsp:include page="filters_new/condition_single.jsp"/>
							</c:if>
							
							<c:if test="${param.covid_filter}">
								<jsp:include page="filters_new/covid_status.jsp"/>
							</c:if>
							<c:if test="${param.environmental_filter}">
								<jsp:include page="filters_new/environmental.jsp"/>
							</c:if>
							<c:if test="${param.environmental_filter2}">
								<jsp:include page="filters_new/environmental2.jsp"/>
							</c:if>
							<c:if test="${param.hosp_filter}">
								<jsp:include page="filters_new/hosp_status.jsp"/>
							</c:if>
							<c:if test="${param.long_filter}">
								<jsp:include page="filters_new/long_status.jsp"/>
							</c:if>
							<c:if test="${param.metformin_filter}">
								<jsp:include page="filters_new/metformin.jsp"/>
							</c:if>
							<c:if test="${param.beforeaftermedication_filter}">
								<jsp:include page="filters_new/beforeafter_medication.jsp"/>
							</c:if>
							<c:if test="${param.mortality_filter}">
								<jsp:include page="filters_new/mortality.jsp"/>
							</c:if>
							<c:if test="${param.opioids_status_filter}">
								<jsp:include page="filters_new/opioids_status.jsp"/>
							</c:if>
							<c:if test="${param.opioid_filter}">
								<jsp:include page="filters_new/opioids.jsp"/>
							</c:if>
							<c:if test="${param.severity_filter}">
								<jsp:include page="filters_new/severity.jsp"/>
							</c:if>
							<c:if test="${param.smoking_status_filter}">
								<jsp:include page="filters_new/smoking_status.jsp"/>
							</c:if>
							<c:if test="${param.vaccinated_filter}">
								<jsp:include page="filters_new/vaccinated.jsp"/>
							</c:if>
							<c:if test="${param.anti_opioids_filter}">
								<jsp:include page="filters_new/anti_opioids.jsp"/>
							</c:if>
							<c:if test="${param.comorbidity_filter}">
								<jsp:include page="filters_new/comorbidity.jsp"/>
							</c:if>
							
							
<!------------------------------- Unsorted -->
							<c:if test="${param.symptom_filter}">
								<jsp:include page="filters_new/symptom.jsp"/>
							</c:if>
							<c:if test="${param.beforeafter_filter}">
								<jsp:include page="filters_new/beforeafter.jsp"/>
							</c:if>
							<c:if test="${param.beforeaftersotrovimab_filter}">
								<jsp:include page="filters_new/beforeafter_sotrovimab.jsp"/>
							</c:if>
							<c:if test="${param.result_filter}">
								<jsp:include page="filters_new/result.jsp"/>
							</c:if>
							<c:if test="${param.delay_filter}">
								<jsp:include page="filters_new/death_delay.jsp"/>
							</c:if>
							<c:if test="${param.diagnosis_filter}">
								<jsp:include page="filters_new/diagnosis.jsp"/>
							</c:if>
							<c:if test="${param.diagnosis_filter2}">
								<jsp:include page="filters_new/diagnosis2.jsp"/>
							</c:if>
							
							<c:if test="${param.sotrovimabmeds_filter}">
								<jsp:include page="filters_new/sotrovimab_meds.jsp"/>
							</c:if>
							<c:if test="${param.medication_filter}">
								<jsp:include page="filters_new/medication.jsp"/>
							</c:if>
							<c:if test="${param.medication_class_filter}">
								<jsp:include page="filters_new/medication_class.jsp"/>
							</c:if>
							<c:if test="${param.medications_filter}">
								<jsp:include page="filters_new/medication_ts.jsp"/>
							</c:if>
							<c:if test="${param.smoking_filter}">
								<jsp:include page="filters_new/smoking.jsp"/>
							</c:if>
							<c:if test="${param.region_filter}">
								<jsp:include page="filters_new/region.jsp"/>
							</c:if>
							<c:if test="${param.reinfectionbin_filter}">
								<jsp:include page="filters_new/reinfection_interval.jsp"/>
							</c:if>
							<c:if test="${param.paxlovid_filter}">
								<jsp:include page="filters_new/paxlovid.jsp"/>
							</c:if>
							
							
						</div>
					</div>
				</c:if>
				
				<jsp:include page="../meta/relatedDashboardsByID.jsp?did=${param.did}"/>
				
			</div>
			
			<div class="col col-12 col-lg-10">
				<c:if test="${not empty param.kpis}">
					<div class="row kpi-row">
						<div id="${param.block}-block-kpi-kpi" class="col-12">
							<div class="kpi_containter row">
								<jsp:include page="${param.kpis}?block=${param.block}&kpi_filter=${param.kpi_filter}"/>
							</div>
						</div>
					</div>
				</c:if>
	
	<!-- Panels ------------------------------------------------------------------------------------------------- -->		
				<div id="${param.block}-panel" class="col-12 col-md-12 mx-auto mb-4 panel" >
				
					<!-- Floating Legend -->
					<c:if test="${not empty param.floating_legend}">
						<div class="col-12"> 
							<div id="${param.block}legend"></div>
						</div>
					</c:if>

					<c:if test="${not empty param.simple_panel}">
						<div id="${param.block}-simple" class="" style="display: block;">
							<c:url value="${param.simple_panel}" var="url">
	  							<c:param name="panel" value="${param.simple_panel}" />
	  							<c:param name="block" value="${param.block}" />
	  							<c:param name="datatable_div" value="${param.datatable_div}" />
	  							<c:if test="${not empty param.topic_description}">
	  								<c:param name="topic_description" value="${param.topic_description}" />
	  							</c:if>
	  							<c:if test="${not empty param.topic_title}">
	  								<c:param name="topic_title" value="${param.topic_title}" />
	  							</c:if>
	  							<c:if test="${not empty param.topic_title2}">
	  								<c:param name="topic_title2" value="${param.topic_title2}" />
	  							</c:if>
	  							<c:if test="${not empty param.topic_disease}">
		  							<c:param name="topic_disease" value="${param.topic_disease}" />
		  						</c:if>
		  						<c:if test="${not empty param.labelwidth}">
		  							<c:param name="labelwidth" value="${param.labelwidth}" />
		  						</c:if>
		  						<c:if test="${not empty param.viz_height}">
		  							<c:param name="viz_height" value="${param.viz_height}" />
		  						</c:if>
							</c:url>
							<jsp:include page="${url}"/>
						</div>
					</c:if>
					
			<!-- Composite Panels ------------------------------------------------------------------------------------------------- -->
					<div class="row">
						
						<c:if test="${not empty param.heatmap_all_panel}">
							<div class="col-12 col-md-6 small-viz-panel">
								<jsp:include page="${param.heatmap_all_panel}"/>
							</div>
						</c:if>
						<c:if test="${not empty param.heatmap_covid_panel}">
							<div class="col-12 col-md-6 small-viz-panel">
								<jsp:include page="${param.heatmap_covid_panel}"/>
							</div>
						</c:if>
						<c:if test="${not empty param.age_panel}">
							<c:url value="${param.age_panel}" var="age_url">
		  						<c:param name="panel" value="${param.age_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.symptom}">
		  							<c:param name="symptom" value="${param.symptom}" />
		  						</c:if>
		  						<c:if test="${not empty param.age_labelwidth}">
		  							<c:param name="labelwidth" value="${param.age_labelwidth}" />
		  						</c:if>
		  						<c:if test="${not empty param.age_height}">
		  							<c:param name="viz_height" value="${param.age_height}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_disease}">
		  							<c:param name="topic_disease" value="${param.topic_disease}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title2}">
		  							<c:param name="topic_title2" value="${param.topic_title2}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-age" class="" src="<c:out value='${age_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.sex_panel}">
							<c:url value="${param.sex_panel}" var="sex_url">
		  						<c:param name="panel" value="${param.sex_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.symptom}">
		  							<c:param name="symptom" value="${param.symptom}" />
		  						</c:if>
		  						<c:if test="${not empty param.sex_labelwidth}">
		  							<c:param name="labelwidth" value="${param.sex_labelwidth}" />
		  						</c:if>
		  						<c:if test="${not empty param.sex_height}">
		  							<c:param name="viz_height" value="${param.sex_height}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_disease}">
		  							<c:param name="topic_disease" value="${param.topic_disease}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title2}">
		  							<c:param name="topic_title2" value="${param.topic_title2}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-sex" src="<c:out value='${sex_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.race_panel}">
							<c:url value="${param.race_panel}" var="race_url">
		  						<c:param name="panel" value="${param.race_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.symptom}">
		  							<c:param name="symptom" value="${param.symptom}" />
		  						</c:if>
		  						<c:if test="${not empty param.race_labelwidth}">
		  							<c:param name="labelwidth" value="${param.race_labelwidth}" />
		  						</c:if>
		  						<c:if test="${not empty param.race_height}">
		  							<c:param name="viz_height" value="${param.race_height}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_disease}">
		  							<c:param name="topic_disease" value="${param.topic_disease}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title2}">
		  							<c:param name="topic_title2" value="${param.topic_title2}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-race" class="" src="<c:out value='${race_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.severity_panel}">
							<c:url value="${param.severity_panel}" var="severity_url">
		 							<c:param name="panel" value="${param.severity_panel}" />
		 							<c:param name="block" value="${param.block}" />
		 							<c:param name="datatable_div" value="${param.datatable_div}" />
		 							<c:if test="${not empty param.topic_description}">
		 								<c:param name="topic_description" value="${param.topic_description}" />
		 							</c:if>
		 							<c:if test="${not empty param.topic_title}">
		 								<c:param name="topic_title" value="${param.topic_title}" />
		 							</c:if>
		 							<c:if test="${not empty param.severity_labelwidth}">
		 								<c:param name="label_width" value="${param.severity_labelwidth}" />
		 							</c:if>
		 							<c:if test="${not empty param.severity_height}">
		 								<c:param name="viz_height" value="${param.severity_height}" />
		 							</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-severity" class="" src="<c:out value='${severity_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.ethnicity_panel}">
							<c:url value="${param.ethnicity_panel}" var="ethnicity_url">
		  						<c:param name="panel" value="${param.ethnicity_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.symptom}">
		  							<c:param name="symptom" value="${param.symptom}" />
		  						</c:if>
		  						<c:if test="${not empty param.ethnicity_labelwidth}">
		  							<c:param name="labelwidth" value="${param.ethnicity_labelwidth}" />
		  						</c:if>
		  						<c:if test="${not empty param.ethnicity_height}">
		  							<c:param name="viz_height" value="${param.ethnicity_height}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_disease}">
		  							<c:param name="topic_disease" value="${param.topic_disease}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title2}">
		  							<c:param name="topic_title2" value="${param.topic_title2}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-ethnicity" src="<c:out value='${ethnicity_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.alcohol_panel}">
							<c:url value="${param.alcohol_panel}" var="alcohol_url">
		  						<c:param name="panel" value="${param.alcohol_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.symptom}">
		  							<c:param name="symptom" value="${param.symptom}" />
		  						</c:if>
		  						<c:if test="${not empty param.alcohol_labelwidth}">
		  							<c:param name="labelwidth" value="${param.alcohol_labelwidth}" />
		  						</c:if>
		  						<c:if test="${not empty param.alcohol_height}">
		  							<c:param name="viz_height" value="${param.alcohol_height}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_disease}">
		  							<c:param name="topic_disease" value="${param.topic_disease}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title2}">
		  							<c:param name="topic_title2" value="${param.topic_title2}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-alcohol" src="<c:out value='${alcohol_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.opioid_panel}">
							<c:url value="${param.opioid_panel}" var="opioid_url">
		  						<c:param name="panel" value="${param.opioid_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.symptom}">
		  							<c:param name="symptom" value="${param.symptom}" />
		  						</c:if>
		  						<c:if test="${not empty param.opioid_labelwidth}">
		  							<c:param name="labelwidth" value="${param.opioid_labelwidth}" />
		  						</c:if>
		  						<c:if test="${not empty param.opioid_height}">
		  							<c:param name="viz_height" value="${param.opioid_height}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_disease}">
		  							<c:param name="topic_disease" value="${param.topic_disease}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title2}">
		  							<c:param name="topic_title2" value="${param.topic_title2}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-opioid" src="<c:out value='${opioid_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.smoking_panel}">
							<c:url value="${param.smoking_panel}" var="smoking_url">
		  						<c:param name="panel" value="${param.smoking_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.symptom}">
		  							<c:param name="symptom" value="${param.symptom}" />
		  						</c:if>
		  						<c:if test="${not empty param.smoking_labelwidth}">
		  							<c:param name="labelwidth" value="${param.smoking_labelwidth}" />
		  						</c:if>
		  						<c:if test="${not empty param.smoking_height}">
		  							<c:param name="viz_height" value="${param.smoking_height}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_disease}">
		  							<c:param name="topic_disease" value="${param.topic_disease}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title2}">
		  							<c:param name="topic_title2" value="${param.topic_title2}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-smoking" src="<c:out value='${smoking_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.medicationoccurrence_panel}">
							<c:url value="${param.medicationoccurrence_panel}" var="medicationoccurrence_url">
		  						<c:param name="panel" value="${param.medicationoccurrence_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-medicationoccurrence" src="<c:out value='${medicationoccurrence_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.alcohol_status_panel}">
							<c:url value="${param.alcohol_status_panel}" var="alcohol_status_url">
		  						<c:param name="panel" value="${param.alcohol_status_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-alcohol_status" src="<c:out value='${alcohol_status_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.covid_status_panel}">
							<c:url value="${param.covid_status_panel}" var="covid_status_url">
		  						<c:param name="panel" value="${param.covid_status_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-covid_status" src="<c:out value='${covid_status_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.cannabis_status_panel}">
							<c:url value="${param.cannabis_status_panel}" var="cannabis_status_url">
		  						<c:param name="panel" value="${param.cannabis_status_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-cannabis_status" src="<c:out value='${cannabis_status_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.opioids_status_panel}">
							<c:url value="${param.opioids_status_panel}" var="opioids_status_url">
		  						<c:param name="panel" value="${param.opioids_status_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-opioids_status" src="<c:out value='${opioids_status_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.smoking_status_panel}">
							<c:url value="${param.smoking_status_panel}" var="smoking_status_url">
		  						<c:param name="panel" value="${param.smoking_status_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-smoking_status" src="<c:out value='${smoking_status_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.covidstatus_panel}">
							<c:url value="${param.covidstatus_panel}" var="covidstatus_url">
		  						<c:param name="panel" value="${param.covidstatus_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-covidstatus" src="<c:out value='${covidstatus_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.longstatus_panel}">
							<c:url value="${param.longstatus_panel}" var="longstatus_url">
		  						<c:param name="panel" value="${param.longstatus_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-longstatus" src="<c:out value='${longstatus_url}'/>"></div>
							</div>
						</c:if>
						
						<c:if test="${not empty param.hospstatus_panel}">
							<c:url value="${param.hospstatus_panel}" var="hospstatus_url">
		  						<c:param name="panel" value="${param.hospstatus_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-hospstatus" src="<c:out value='${hospstatus_url}'/>"></div>
							</div>
						</c:if>
						
						<c:if test="${not empty param.vaccinationstatus_panel}">
							<c:url value="${param.vaccinationstatus_panel}" var="vaccinationstatus_url">
		  						<c:param name="panel" value="${param.vaccinationstatus_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-vaccinationstatus" src="<c:out value='${vaccinationstatus_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.mortality_panel}">
							<c:url value="${param.mortality_panel}" var="mortality_url">
		  						<c:param name="panel" value="${param.mortality_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-mortality" src="<c:out value='${mortality_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.cms_panel}">
							<c:url value="${param.cms_panel}" var="cms_url">
		  						<c:param name="panel" value="${param.cms_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-cms" src="<c:out value='${cms_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.condition_panel}">
							<c:url value="${param.condition_panel}" var="condition_url">
		  						<c:param name="panel" value="${param.condition_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 small-viz-panel">
								<div id="${param.block}-condition" src="<c:out value='${condition_url}'/>"></div>
							</div>
						</c:if>
						<c:if test="${not empty param.comorbidity_panel}">
							<c:url value="${param.comorbidity_panel}" var="comorbidity_url">
		  						<c:param name="panel" value="${param.comorbidity_panel}" />
		  						<c:param name="block" value="${param.block}" />
		  						<c:param name="datatable_div" value="${param.datatable_div}" />
		  						<c:if test="${not empty param.topic_description}">
		  							<c:param name="topic_description" value="${param.topic_description}" />
		  						</c:if>
		  						<c:if test="${not empty param.topic_title}">
		  							<c:param name="topic_title" value="${param.topic_title}" />
		  						</c:if>
							</c:url>
							<div class="col-12 col-md-6 small-viz-panel">
								<div id="${param.block}-comorbidity" src="<c:out value='${comorbidity_url}'/>"></div>
							</div>
						</c:if>

					</div>
					
					
					<c:if test="${not empty param.raceethncity_panel}">
						<c:url value="${param.raceethncity_panel}" var="raceethncity_url">
	  						<c:param name="panel" value="${param.raceethncity_panel}" />
	  						<c:param name="block" value="${param.block}" />
	  						<c:param name="datatable_div" value="${param.datatable_div}" />
	  						<c:if test="${not empty param.topic_description}">
	  							<c:param name="topic_description" value="${param.topic_description}" />
	  						</c:if>
	  						<c:if test="${not empty param.topic_title}">
	  							<c:param name="topic_title" value="${param.topic_title}" />
	  						</c:if>
						</c:url>
						<div id="${param.block}-raceethnicity" style="display: block;" src="<c:out value='${raceethncity_url}'/>"></div>
					</c:if>
					
					<c:if test="${not empty param.racesex_panel}">
						<c:url value="${param.racesex_panel}" var="racesex_url">
	  						<c:param name="panel" value="${param.racesex_panel}" />
	  						<c:param name="block" value="${param.block}" />
	  						<c:param name="datatable_div" value="${param.datatable_div}" />
	  						<c:if test="${not empty param.topic_description}">
	  							<c:param name="topic_description" value="${param.topic_description}" />
	  						</c:if>
	  						<c:if test="${not empty param.topic_title}">
	  							<c:param name="topic_title" value="${param.topic_title}" />
	  						</c:if>
						</c:url>
						<div id="${param.block}-racesex" style="display: block;" src="<c:out value='${racesex_url}'/>"></div>
					</c:if>
					
					
					
					<div class="row">
						<c:if test="${not empty param.topic_description}">
							<div class="col-12" id="viz_caption">
								<jsp:include page="${param.folder}/secondary_text/${param.topic_description}.jsp"/>
							</div>
						</c:if>
					</div>
	

<!-- other panel logic	--------------------------------->
					<c:if test="${not empty param.sotrovimab_panel1}">
						<c:url value="${param.sotrovimab_panel1}" var="sotrovimab1_url">
	  						<c:param name="panel" value="${param.sotrovimab_panel1}" />
	  						<c:param name="block" value="${param.block}" />
	  						<c:param name="datatable_div" value="${param.datatable_div}" />
	  						<c:if test="${not empty param.topic_description}">
	  							<c:param name="topic_description" value="${param.topic_description}" />
	  						</c:if>
	  						<c:if test="${not empty param.topic_title}">
	  							<c:param name="topic_title" value="${param.topic_title}" />
	  						</c:if>
						</c:url>
						<div id="${param.block}-sotrovimab1" style="display: none;" src="<c:out value='${sotrovimab1_url}'/>"></div>
					</c:if>
					
					<c:if test="${not empty param.sotrovimab_panel2}">
						<c:url value="${param.sotrovimab_panel2}" var="sotrovimab2_url">
	  						<c:param name="panel" value="${param.sotrovimab_panel2}" />
	  						<c:param name="block" value="${param.block}" />
	  						<c:param name="datatable_div" value="${param.datatable_div}" />
	  						<c:if test="${not empty param.topic_description}">
	  							<c:param name="topic_description" value="${param.topic_description}" />
	  						</c:if>
	  						<c:if test="${not empty param.topic_title}">
	  							<c:param name="topic_title" value="${param.topic_title}" />
	  						</c:if>
						</c:url>
						<div id="${param.block}-sotrovimab2" style="display: none;" src="<c:out value='${sotrovimab2_url}'/>"></div>
					</c:if>
					
					
					
				</div>
			
		<!-- DataTable --------------------------------------------------------------------------------------- -->	
				<div class="row">
					<c:if test="${not empty param.datatable}">
							<div class="col-12 ">
								<div class="block_header"></div>
								<div class="row">
									<div class="col-12 dash-dt-section" id="${param.datatable_div}"></div>
									<jsp:include page="${param.datatable}">
										<jsp:param name="feed" value="${param.datatable_feed}"/>
										<jsp:param name="target_div" value="${param.datatable_div}"/>
										<jsp:param name="target_kpis" value="${param.datatable_kpis}"/>
										<jsp:param name="target_kpis2" value="${param.datatable_kpis2}"/>
										<jsp:param name="target_filtered_kpis" value="${param.datatable_filtered_kpis}"/>
										<jsp:param name="block" value="${param.block}"/>
									</jsp:include>
								</div>
							</div>
						</c:if>
				</div>
				
				<c:if test="${not empty param.did}">
					<div class="row" id="question-limits">
						<sql:query var="questions" dataSource="jdbc/N3CPublic">
							select limitations from n3c_dashboard.dashboard where did = ?::INTEGER
							 <sql:param>${param.did}</sql:param>
	 					</sql:query>
						<c:forEach items="${questions.rows}" var="row" varStatus="rowCounter">
							<div id="${param.block}limitations-section" class="col col-12">
								<div class="accordion limitations_drop" id="${param.block}limitations_drop">
									<div class="card">
										<a Title="expand/collapse limitations section" href="" class="accordion-toggle" data-toggle="collapse" data-target="#${param.block}limitcollapseOne" aria-expanded="false" aria-controls="${param.block}collapseOne">
											<div class="card-header" id="${param.block}limitheadingOne">
												<h4 class="mb-0"><span class="accordion_text">Limitations</span>
													<span style="display:inline; float:right;" class="btn btn-link btn-block text-left collapsed icon-btn p-0 accordion-toggle"></span>
												</h4>
											</div>
										</a>
										<div id="${param.block}limitcollapseOne" class="collapse" aria-labelledby="${param.block}limitheadingOne" data-parent="#${param.block}limitations_drop">
											<div class="card-body">
												${row.limitations}
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				
				
			</div>
		</div>
	</div>
</div>			

<script>
	
// logic for the filters pin feature
$('.filters-pin').tooltip();
function ${param.block}_sticky_toggle(){
	$('#${param.block}filter_checks').toggleClass( "sticky-top" );
	$('#${param.block}filter_checks span.btn').toggleClass( "stuck" );
}
$(window).resize(function() {
	if ($(window).width() < 992) {
		$('#${param.block}filter_checks').removeClass( "sticky-top" );
		$('#${param.block}filter_checks span.btn').removeClass( "stuck" );
	}
});

function ${param.block}limitlink(){
	$('#${param.block}limitcollapseOne').collapse('show');
	$('html, body').animate({
        scrollTop: $("#${param.block}limitations-section").offset().top
    }, 500);
}

$(document).ready(function() {
	  
    setTimeout(function() {
		if ('${param.block}' === 'reinfection_ts_1') {
			update(new Date('Feb 1 2022 1:00:00 CST'));
			sliderTime.value(new Date('Feb 1 2022').valueOf());
		};
		if ('${param.block}' === 'paxlovid_4' || '${param.block}' === 'paxlovid_5' || '${param.block}' === 'environment_3' || '${param.block}' === 'metformin_5' || '${param.block}' === 'enclave_health_5') {
			if ('${param.block}' === 'environment_3') {
				$('#${param.block}-mortality-select').multiselect('select', 'Mortality', true);
				${param.block}_refreshHistograms();
				${param.block}_constrain_table();
				$("#${param.block}_alert .filter_info" ).append('<small class="search_indicator"><i class="fas fa-info-circle"></i> Mortality Status is defaulted to True. <a href="#" onclick=" ${param.block}_filter_clear(); return false;">Clear filters</a> to reset and see all patients for context.</small>');
				$('#${param.block}mortality_body').collapse('show')
			};
			if ('${param.block}' === 'metformin_5') {
				$('#${param.block}-metformin-select').multiselect('select', 'Metformin', true);
				${param.block}_refreshHistograms();
				${param.block}_constrain_table();
				$("#${param.block}_alert .filter_info" ).append('<small class="search_indicator"><i class="fas fa-info-circle"></i> Default filters are applied to only show diabetic patients prescribed Metformin. <a href="#" onclick=" ${param.block}_filter_clear(); return false;">Clear filters</a> to reset and see all diabetic patients for context.</small>');
				$('#${param.block}metformin_body').collapse('show')
			};
			if ('${param.block}' === 'paxlovid_4' || '${param.block}' === 'paxlovid_5') {
				$('#${param.block}-paxlovidstatus-select').multiselect('select', 'Paxlovid', true);
				${param.block}_refreshHistograms();
				${param.block}_constrain_table();
				$("#${param.block}_alert .filter_info" ).append('<small class="search_indicator"><i class="fas fa-info-circle"></i> Paxlovid Status is defaulted to True. <a href="#" onclick=" ${param.block}_filter_clear(); return false;">Clear filters</a> to reset and see all COVID+ patients for context.</small>');
			};
			if ('${param.block}' === 'enclave_health_5') {
				$('#${param.block}-nu_conditions-select').multiselect('select', 2, true);
				${param.block}_refreshHistograms();
				${param.block}_constrain_table();
				$("#${param.block}_alert .filter_info" ).append('<small class="search_indicator"><i class="fas fa-info-circle"></i> Default filters are applied to only show counts of two comorbid conditions. <a href="#" onclick=" ${param.block}_filter_clear(); return false;">Clear filters</a> to reset and see all combinations of comorbidities, or adjust the filter to select the number of comorbidities of interest.</small>');
				$('#${param.block}nu_conditions_body').collapse('show')
			};
			$("#${param.block}_alert").removeClass('no_clear');
			$("#${param.block}_alert .close" ).on('click', function() {
				$("#${param.block}_alert").addClass('no_clear');
			});
			
		} else{
			if ('${param.block}' === 'metformin_2'|| '${param.block}' === 'metformin_3' || '${param.block}' === 'metformin_4') {
				document.getElementById('${param.block}-mode-barpercent').click();
				$('#${param.block}-mode-barpercent').trigger('mouseup');
			}
			$("#${param.block}_alert").hide();
		};
    }, 2000);
	   
	  
	    
	    
// initiate the filters /////////////////////////////////////////
	
	$('#${param.block}-severity-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-severity-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
			${param.block}_constrain("severity",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	$('#${param.block}-age-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			console.log('change');
			var options = $('#${param.block}-age-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
			${param.block}_constrain("age",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	
	$('#${param.block}-race-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-race-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
			${param.block}_constrain("race",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	$('#${param.block}-sex-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-sex-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
			${param.block}_constrain("sex",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();

           }
	});
	$('#${param.block}-ethnicity-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-ethnicity-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
			${param.block}_constrain("ethnicity",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	$('#${param.block}-smokingstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-smokingstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("smokingstatus",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-smoking-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-smoking-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("smoking",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-alcohol-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           enableCaseInsensitiveFiltering: true,
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-alcohol-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("alcohol",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-opioid-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           enableCaseInsensitiveFiltering: true,
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-opioid-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("opioid",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-anti-opioid-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           enableCaseInsensitiveFiltering: true,
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-anti-opioid-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });

	     	${param.block}_active = selected[0];
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-condition-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           enableCaseInsensitiveFiltering: true,
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-condition-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("condition",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-conditions-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           enableCaseInsensitiveFiltering: true,
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-conditions-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain_free("conditions",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-comorbidity-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           enableCaseInsensitiveFiltering: true,
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-comorbidity-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("comorbidity",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-covidstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-covidstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("covidstatus",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-count-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-count-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("count",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-nu_conditions-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			
			var options = $('#${param.block}-nu_conditions-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("nu_conditions",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-cms-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-cms-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("cms",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	
	$('#${param.block}-alcoholstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-alcoholstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("alcoholstatus",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-cannabisstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-cannabisstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("cannabisstatus",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-opioidsstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-opioidsstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("opioidsstatus",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-longstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-longstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("longstatus",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-hospstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-hospstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("hospstatus",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-mortality-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-mortality-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
	        ${param.block}_constrain("mortality",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-environmental-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		maxHeight: 300,
		numberDisplayed: 1,
		enableCaseInsensitiveFiltering: true,
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-environmental-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("environmental_factor",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-medications-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-medications-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("medication",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-region-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-region-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("region",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-intervalbin-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		maxHeight: 300,
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-intervalbin-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("intervalbin",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-medication-class-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		maxHeight: 300,
		numberDisplayed: 1,
		enableCaseInsensitiveFiltering: true,
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-medication-class-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("drug_domain",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-medication-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		maxHeight: 300,
		numberDisplayed: 1,
		enableCaseInsensitiveFiltering: true,
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-medication-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("concept_set_name",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-delay-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		maxHeight: 300,
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-delay-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("delay",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-diagnosis-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-diagnosis-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("diagnosis_type",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-cciscore-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		maxHeight: 300,
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-cciscore-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("cciscore",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-vaccinationstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-vaccinationstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
			${param.block}_constrain("vaccinated", selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-sotrovimaboccurrence-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-sotrovimaboccurrence-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("sotrovimaboccurrence",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-othermeds-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		maxHeight: 300,
		numberDisplayed: 1,
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-othermeds-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("medications",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-symptom-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-symptom-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
			${param.block}_constrain("symptom",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	$('#${param.block}-symptomoccurrence-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-symptomoccurrence-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("beforeafter",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	$('#${param.block}-medicationoccurrence-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-medicationoccurrence-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("medicationoccurrence",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	$('#${param.block}-metformin-select').multiselect({	
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-metformin-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("metformin",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	// paxlovid new
	$('#${param.block}-paxlovidstatus-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-paxlovidstatus-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("paxlovid",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	
	// paxlovid old
	$('#${param.block}-testresult-select').multiselect({
		buttonContainer: '<div class="checkbox-list-container"></div>',
           buttonClass: '',
           templates: {
               button: '',
               popupContainer: '<div class="multiselect-container checkbox-list"></div>',
               li: '<a class="multiselect-option text-dark text-decoration-none"></a>'
           },
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-testresult-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("result",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
		
// old multiselects //////////////////////////////////////////////
	$('#${param.block}-vaccinated-select').multiselect({
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-vaccinated-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
	        
			${param.block}_constrain("vaccinated", selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
	$('#${param.block}-comorbidities-select').multiselect({	
		maxHeight: 300,
		enableCaseInsensitiveFiltering: true,
		onChange: function(option, checked, select) {
			var options = $('#${param.block}-comorbidities-select');
	        var selected = [];
	        $(options).each(function(){
	            selected.push($(this).val());
	        });
			${param.block}_constrain("comorbidities",  selected[0].join('|'));
		    ${param.block}_refreshHistograms();
           }
	});
		
		
// show/hide clear filters button //////////////////////////////////////////////
	var mut = new MutationObserver(function(mutations, mut){
		if($('#${param.block}-block-kpi').find('.dropdown-item.active').length !== 0){
			$('#${param.block}_btn_clear').removeClass("no_clear");
			$('#${param.block}_btn_clear').addClass("show_clear");
		} else if ($('#${param.datatable_div}-table').DataTable().search().length > 0){
			// leave things alone, there's an active search
			// console.log("active search box", $('#${param.datatable_div}-table').DataTable().search())
		} else {
			$('#${param.block}_btn_clear').removeClass("show_clear");
			$('#${param.block}_btn_clear').addClass("no_clear");
		}
	});
	$( "#${param.block}-block-kpi .checkbox-list button").each(function() {
		mut.observe(this,{
			'attributes': true,
			attributeFilter: ['class']
		});
	}); 

});
// end of doc ready

	
	
	
// FILTER FUNCTIONS /////////////////////////////
function deselect(checkid){
	$('#' + checkid + ' input[type="checkbox"]:checked').prop('checked',false).trigger('change');
};
	
function selectall(checkid){
	$('#' + checkid + ' input[type="checkbox"]').prop('checked',true).trigger('change');
};

function ${param.block}_viz_constrain(element, elementParent) {
	var options = $("#${param.block}-"+elementParent.toLowerCase()+"-select");
       var selected = [];
       
       $(options).each(function(){
           selected.push($(this).val());
       });
       
	if (selected[0].includes( element.secondary_name)){
		$("#${param.block}-"+elementParent.toLowerCase()+"-select").multiselect('deselect', $("#${param.block}-"+elementParent.toLowerCase()+"-select option[value='" + element.secondary_name + "']").val(), true);
	} else {
		$("#${param.block}-"+elementParent.toLowerCase()+"-select").multiselect('select', $("#${param.block}-"+elementParent.toLowerCase()+"-select option[value='" + element.secondary_name + "']").val(), true);
	}
}

function ${param.block}_constrain(filter, selection) {
	console.log("constrain", filter, selection);
	var selected = selection;
	if (selected != undefined && selected.length > 0){
		var values = selected.split("|");
		var text = "";
		for (let i = 0; i < values.length; ++i) {
			var clean_text = values[i].replace("+", "\\+");

			if (i < (values.length-1)){
	    		search = "^" + clean_text + "$|";
			} else {
				search = "^" + clean_text + "$";
			}
	    	text = text.concat(search);
		}
		selected = text;
	}else{
		selected = '';
	}
	${param.block}_constrain_table(filter, selected);
}

function ${param.block}_constrain_free(filter, selection) {
	console.log("constrain", filter, selection);
	var selected = selection;
	if (selected != undefined && selected.length > 0){
		var values = selected.split("|");
		var text = "";
		for (let i = 0; i < values.length; ++i) {
			var clean_text = values[i].replace("+", "\\+");

			if (i < (values.length-1)){
	    		search = clean_text + "|";
			} else {
				search = clean_text;
			}
	    	text = text.concat(search);
		}
		selected = text;
	}else{
		selected = '';
	}
	${param.block}_constrain_table(filter, selected);
}

function ${param.block}_filter_clear() {
	
	$('#${param.block}_btn_clear').removeClass("show_clear");
	$('#${param.block}_btn_clear').addClass("no_clear");
	$("#${param.block}_alert").addClass("no_clear");  

	<c:if test="${param.severity_filter}">
		if ($('#${param.block}-severity-select').val().length > 0) {
			$('#${param.block}-severity-select').multiselect('clearSelection');
			${param.block}_constrain("severity", '');
		}
	</c:if>
	<c:if test="${param.age_filter_min || param.age_filter_sec || param.age_filter_ideal}">
		if ($('#${param.block}-age-select').val().length > 0) {
			$('#${param.block}-age-select').multiselect('clearSelection');
			${param.block}_constrain("age", '');
		}
	</c:if>
	<c:if test="${param.race_filter}">
		if ($('#${param.block}-race-select').val().length > 0) {
			$('#${param.block}-race-select').multiselect('clearSelection');
			${param.block}_constrain("race", '');
		}
	</c:if>
	<c:if test="${param.sex_filter}">
		if ($('#${param.block}-sex-select').val().length > 0) {
			$('#${param.block}-sex-select').multiselect('clearSelection');
			${param.block}_constrain("sex", '');
		}
	</c:if>
	<c:if test="${param.ethnicity_filter}">
		if ($('#${param.block}-ethnicity-select').val().length > 0) {
			$('#${param.block}-ethnicity-select').multiselect('clearSelection');
			${param.block}_constrain("ethnicity", '');
		}
	</c:if>
	<c:if test="${param.symptom_filter}">
		if ($('#${param.block}-symptom-select').val().length > 0) {
			$('#${param.block}-symptom-select').multiselect('clearSelection');
			${param.block}_constrain("symptom", '');
		}
	</c:if>
	<c:if test="${param.vaccinated_filter}">
		if ($('#${param.block}-vaccinationstatus-select').val().length > 0) {
			$('#${param.block}-vaccinationstatus-select').multiselect('clearSelection');
			${param.block}_constrain("vaccinated", '');
		}
	</c:if>
	<c:if test="${param.comorbidities_filter}">
		if ($('#${param.block}-comorbidities-select').val().length > 0) {
			$('#${param.block}-comorbidities-select').multiselect('clearSelection');
			${param.block}_constrain("comorbidities", '');
		}
	</c:if>
	<c:if test="${param.beforeafter_filter}">
		if ($('#${param.block}-symptomoccurrence-select').val().length > 0) {
			$('#${param.block}-symptomoccurrence-select').multiselect('clearSelection');
			${param.block}_constrain("beforeafter", '');
		}
	</c:if>
	<c:if test="${param.beforeaftermedication_filter}">
		if ($('#${param.block}-medicationoccurrence-select').val().length > 0) {
			$('#${param.block}-medicationoccurrence-select').multiselect('clearSelection');
			${param.block}_constrain("medicationoccurrence", '');
		}
	</c:if>
	<c:if test="${param.metformin_filter}">
		if ($('#${param.block}-metformin-select').val().length > 0) {
			$('#${param.block}-metformin-select').multiselect('clearSelection');
			${param.block}_constrain("metformin", '');
		}
	</c:if>
	<c:if test="${param.beforeaftersotrovimab_filter}">
		if ($('#${param.block}-sotrovimaboccurrence-select').val().length > 0) {
			$('#${param.block}-sotrovimaboccurrence-select').multiselect('clearSelection');
			${param.block}_constrain("sotrovimaboccurrence", '');
		}
	</c:if>
	<c:if test="${param.result_filter}">
		if ($('#${param.block}-testresult-select').val().length > 0) {
			$('#${param.block}-testresult-select').multiselect('clearSelection');
			${param.block}_constrain("result", '');
		}
	</c:if>
	<c:if test="${param.delay_filter}">
		if ($('#${param.block}-delay-select').val().length > 0) {
			$('#${param.block}-delay-select').multiselect('clearSelection');
			${param.block}_constrain("delay", '');
		}
	</c:if>
	<c:if test="${param.diagnosis_filter}">
		if ($('#${param.block}-diagnosis-select').val().length > 0) {
			$('#${param.block}-diagnosis-select').multiselect('clearSelection');
			${param.block}_constrain("diagnosis_type", '');
		}
	</c:if>
	<c:if test="${param.diagnosis_filter2}">
		if ($('#${param.block}-diagnosis-select').val().length > 0) {
			$('#${param.block}-diagnosis-select').multiselect('clearSelection');
			${param.block}_constrain("diagnosis_type", '');
		}
	</c:if>
	<c:if test="${param.cciscore_filter}">
		if ($('#${param.block}-cciscore-select').val().length > 0) {
			$('#${param.block}-cciscore-select').multiselect('clearSelection');
			${param.block}_constrain("cciscore", '');
		}
	</c:if>
	<c:if test="${param.sotrovimabmeds_filter}">
		if ($('#${param.block}-othermeds-select').val().length > 0) {
			$('#${param.block}-othermeds-select').multiselect('clearSelection');
			${param.block}_constrain("medications", '');
		}
	</c:if>
	<c:if test="${param.medication_filter}">
		if ($('#${param.block}-medication-select').val().length > 0) {
			$('#${param.block}-medication-select').multiselect('clearSelection');
			${param.block}_constrain("concept_set_name", '');
		}
	</c:if>
	<c:if test="${param.medication_class_filter}">
		if ($('#${param.block}-medication-class-select').val().length > 0) {
			$('#${param.block}-medication-class-select').multiselect('clearSelection');
			${param.block}_constrain("drug_domain", '');
		}
	</c:if>
	<c:if test="${param.medications_filter}">
		if ($('#${param.block}-medications-select').val().length > 0) {
			$('#${param.block}-medications-select').multiselect('clearSelection');
			${param.block}_constrain("medication", '');
		}
	</c:if>
	<c:if test="${param.smoking_filter}">
		if ($('#${param.block}-smoking-select').val().length > 0) {
			$('#${param.block}-smoking-select').multiselect('clearSelection');
			${param.block}_constrain("smoking", '');
		}
	</c:if>
	<c:if test="${param.alcohol_filter}">
		if ($('#${param.block}-alcohol-select').val().length > 0) {
			$('#${param.block}-alcohol-select').multiselect('clearSelection');
			${param.block}_constrain("alcohol", '');
		}
	</c:if>
	<c:if test="${param.opioid_filter}">
		if ($('#${param.block}-opioid-select').val().length > 0) {
			$('#${param.block}-opioid-select').multiselect('clearSelection');
			${param.block}_constrain("opioid", '');
		}
	</c:if>
	<c:if test="${param.covid_filter}">
		if ($('#${param.block}-covidstatus-select').val().length > 0) {
			$('#${param.block}-covidstatus-select').multiselect('clearSelection');
			${param.block}_constrain("covidstatus", '');
		}
	</c:if>
	<c:if test="${param.count_filter}">
		if ($('#${param.block}-count-select').val().length > 0) {
			$('#${param.block}-count-select').multiselect('clearSelection');
			${param.block}_constrain("count", '');
		}
	</c:if>
	<c:if test="${param.nu_conditions_filter}">
		if ($('#${param.block}-nu_conditions-select').val().length > 0) {
			$('#${param.block}-nu_conditions-select').multiselect('clearSelection');
			${param.block}_constrain_free("nu_conditions", '');
		}
	</c:if>
	<c:if test="${param.cms_filter}">
		if ($('#${param.block}-cms-select').val().length > 0) {
			$('#${param.block}-cms-select').multiselect('clearSelection');
			${param.block}_constrain("cms", '');
		}
	</c:if>
	<c:if test="${param.long_filter}">
		if ($('#${param.block}-longstatus-select').val().length > 0) {
			$('#${param.block}-longstatus-select').multiselect('clearSelection');
			${param.block}_constrain("longstatus", '');
		}
	</c:if>
	<c:if test="${param.hosp_filter}">
		if ($('#${param.block}-hospstatus-select').val().length > 0) {
			$('#${param.block}-hospstatus-select').multiselect('clearSelection');
			${param.block}_constrain("hospstatus", '');
		}
	</c:if>
	<c:if test="${param.mortality_filter}">
		if ($('#${param.block}-mortality-select').val().length > 0) {
			$('#${param.block}-mortality-select').multiselect('clearSelection');
			${param.block}_constrain("mortality", '');
		}
	</c:if>
	<c:if test="${param.environmental_filter}">
		if ($('#${param.block}-environmental-select').val().length > 0) {
			$('#${param.block}-environmental-select').multiselect('clearSelection');
			${param.block}_constrain("environmental_factor", '');
		}
	</c:if>
	<c:if test="${param.environmental_filter2}">
		if ($('#${param.block}-environmental-select').val().length > 0) {
			$('#${param.block}-environmental-select').multiselect('clearSelection');
			${param.block}_constrain("environmental_factor", '');
		}
	</c:if>
	<c:if test="${param.region_filter}">
		if ($('#${param.block}-region-select').val().length > 0) {
			$('#${param.block}-region-select').multiselect('clearSelection');
			${param.block}_constrain("region", '');
		}
	</c:if>
	<c:if test="${param.reinfectionbin_filter}">
		if ($('#${param.block}-intervalbin-select').val().length > 0) {
			$('#${param.block}-intervalbin-select').multiselect('clearSelection');
			${param.block}_constrain("intervalbin", '');
		}
	</c:if>
	<c:if test="${param.paxlovid_filter}">
		if ($('#${param.block}-paxlovidstatus-select').val().length > 0) {
			$('#${param.block}-paxlovidstatus-select').multiselect('clearSelection');
			${param.block}_constrain("paxlovid", '');
		}
	</c:if>
	<c:if test="${param.alcohol_status_filter}">
		if ($('#${param.block}-alcoholstatus-select').val().length > 0) {
			$('#${param.block}-alcoholstatus-select').multiselect('clearSelection');
			${param.block}_constrain("alcoholstatus", '');
		}
	</c:if>
	<c:if test="${param.smoking_status_filter}">
		if ($('#${param.block}-smokingstatus-select').val().length > 0) {
			$('#${param.block}-smokingstatus-select').multiselect('clearSelection');
			${param.block}_constrain("smokingstatus", '');
		}
	</c:if>
	<c:if test="${param.opioids_status_filter}">
		if ($('#${param.block}-opioidsstatus-select').val().length > 0) {
			$('#${param.block}-opioidsstatus-select').multiselect('clearSelection');
			${param.block}_constrain("opioidsstatus", '');
		}
	</c:if>
	<c:if test="${param.cannabis_status_filter}">
		if ($('#${param.block}-cannabisstatus-select').val().length > 0) {
			$('#${param.block}-cannabisstatus-select').multiselect('clearSelection');
			${param.block}_constrain("cannabisstatus", '');
		}
	</c:if>
	<c:if test="${param.covid_status_filter}">
		if ($('#${param.block}-covidstatus-select').val().length > 0) {
			$('#${param.block}-covidstatus-select').multiselect('clearSelection');
			${param.block}_constrain("covidstatus", '');
		}
	</c:if>
	<c:if test="${param.anti_opioids_filter}">
		if ($('#${param.block}-anti-opioid-select').val().length > 0) {
			$('#${param.block}-anti-opioid-select').multiselect('clearSelection');
			${param.block}_active = [];
		}
	</c:if>
	<c:if test="${param.condition_filter}">
		if ($('#${param.block}-condition-select').val().length > 0) {
			$('#${param.block}-condition-select').multiselect('clearSelection');
			${param.block}_active = [];
		}
	</c:if>
	<c:if test="${param.conditions_filter}">
		if ($('#${param.block}-conditions-select').val().length > 0) {
			$('#${param.block}-conditions-select').multiselect('clearSelection');
			${param.block}_active = [];
		}
	</c:if>
	<c:if test="${param.comorbidity_filter}">
		if ($('#${param.block}-comorbidity-select').val().length > 0) {
			$('#${param.block}-comorbidity-select').multiselect('clearSelection');
			${param.block}_active = [];
		}
	</c:if>
	
	$("#${param.datatable_div}-table").DataTable().search('');
	$("#${param.datatable_div}-table").DataTable().columns().search('').draw();
    ${param.block}_refreshHistograms();
}
	
	
	
	


// initialize all possible data arrays
<c:if test="${param.raceEthnicityArray}">
	var ${param.block}_raceEthnicityArray = new Array();
</c:if>

<c:if test="${param.statusArray}">
	var ${param.block}_statusArray = new Array();
</c:if>

<c:if test="${param.countArray}">
	var ${param.block}_countArray = new Array();
</c:if>

<c:if test="${param.DaysArray}">
	var ${param.block}_DaysArray = new Array();
</c:if>

<c:if test="${param.AgeArray}">
	var ${param.block}_AgeArray = new Array();
</c:if>
<c:if test="${param.RaceArray}">
	var ${param.block}_RaceArray = new Array();
</c:if>
<c:if test="${param.EthnicityArray}">
	var ${param.block}_EthnicityArray = new Array();
</c:if>
<c:if test="${param.SexArray}">
	var ${param.block}_SexArray = new Array();
</c:if>
<c:if test="${param.SeverityArray}">
	var ${param.block}_SeverityArray = new Array();
</c:if>
<c:if test="${param.AlcoholArray}">
	var ${param.block}_AlcoholArray = new Array();
</c:if>
<c:if test="${param.OpioidArray}">
	var ${param.block}_OpioidArray = new Array();
</c:if>
<c:if test="${param.SmokingArray}">
	var ${param.block}_SmokingArray = new Array();
</c:if>
<c:if test="${param.DelayArray}">
	var ${param.block}_DelayArray = new Array();
</c:if>
<c:if test="${param.MedicationoccurrenceArray}">
	var ${param.block}_MedicationoccurrenceArray = new Array();
</c:if>
<c:if test="${param.MortalityArray}">
	var ${param.block}_MortalityArray = new Array();
</c:if>
<c:if test="${param.VaccinationstatusArray}">
	var ${param.block}_VaccinationstatusArray = new Array();
</c:if>
<c:if test="${param.LongstatusArray}">
	var ${param.block}_LongstatusArray = new Array();
</c:if>
<c:if test="${param.HospstatusArray}">
	var ${param.block}_HospstatusArray = new Array();
</c:if>
<c:if test="${param.CovidstatusArray}">
	var ${param.block}_CovidstatusArray = new Array();
</c:if>
<c:if test="${param.CmsArray}">
var ${param.block}_CmsArray = new Array();
</c:if>
<c:if test="${param.SeverityMetArray}">
	var ${param.block}_SeverityMetArray = new Array();
</c:if>
<c:if test="${param.SeverityNoMetArray}">
	var ${param.block}_SeverityNoMetArray = new Array();
</c:if>
<c:if test="${param.SeverityDiabMetArray}">
	var ${param.block}_SeverityDiabMetArray = new Array();
</c:if>
<c:if test="${param.SeverityDiabNoMetArray}">
	var ${param.block}_SeverityDiabNoMetArray = new Array();
</c:if>
<c:if test="${param.SeverityNoDiabMetArray}">
	var ${param.block}_SeverityNoDiabMetArray = new Array();
</c:if>
<c:if test="${param.SeverityNoDiabNoMetArray}">
	var ${param.block}_SeverityNoDiabNoMetArray = new Array();
</c:if>
<c:if test="${param.LongMetArray}">
	var ${param.block}_LongMetArray = new Array();
</c:if>
<c:if test="${param.LongNoMetArray}">
	var ${param.block}_LongNoMetArray = new Array();
</c:if>
<c:if test="${param.LongDiabMetArray}">
	var ${param.block}_LongDiabMetArray = new Array();
</c:if>
<c:if test="${param.LongDiabNoMetArray}">
	var ${param.block}_LongDiabNoMetArray = new Array();
</c:if>
<c:if test="${param.LongNoDiabMetArray}">
	var ${param.block}_LongNoDiabMetArray = new Array();
</c:if>
<c:if test="${param.LongNoDiabNoMetArray}">
	var ${param.block}_LongNoDiabNoMetArray = new Array();
</c:if>
<c:if test="${param.MortalityMetArray}">
	var ${param.block}_MortalityMetArray = new Array();
</c:if>
<c:if test="${param.MortalityNoMetArray}">
	var ${param.block}_MortalityNoMetArray = new Array();
</c:if>
<c:if test="${param.MortalityDiabMetArray}">
	var ${param.block}_MortalityDiabMetArray = new Array();
</c:if>
<c:if test="${param.MortalityDiabNoMetArray}">
	var ${param.block}_MortalityDiabNoMetArray = new Array();
</c:if>
<c:if test="${param.MortalityNoDiabMetArray}">
	var ${param.block}_MortalityNoDiabMetArray = new Array();
</c:if>
<c:if test="${param.MortalityNoDiabNoMetArray}">
	var ${param.block}_MortalityNoDiabNoMetArray = new Array();
</c:if>
<c:if test="${param.cciscoreSeverityArray}">
	var ${param.block}_cciscoreSeverityArray = new Array();
</c:if>
<c:if test="${param.vaccinatedSeverityArray}">
	var ${param.block}_vaccinatedSeverityArray = new Array();
</c:if>
<c:if test="${param.raceSexArray}">
	var ${param.block}_raceSexArray = new Array();
</c:if>
<c:if test="${param.ObservationArray}">
	var ${param.block}_ObservationArray = new Array();
</c:if>
<c:if test="${param.BeforeAfterArray}">
	var ${param.block}_BeforeAfterArray = new Array();
</c:if>
<c:if test="${param.SeverityRegionArray}">
	var ${param.block}_SeverityRegionArray = new Array();
</c:if>
<c:if test="${param.SymptomAgeArray}">
	var ${param.block}_SymptomAgeArray = new Array();
</c:if>
<c:if test="${param.SymptomSexArray}">
	var ${param.block}_SymptomSexArray = new Array();
</c:if>
<c:if test="${param.SymptomRaceArray}">
	var ${param.block}_SymptomRaceArray = new Array();
</c:if>
<c:if test="${param.SymptomEthnicityArray}">
	var ${param.block}_SymptomEthnicityArray = new Array();
</c:if>
<c:if test="${param.MedicationArray}">
	var ${param.block}_MedicationArray = new Array();
</c:if>
<c:if test="${param.StatusAgeArray}">	
	var ${param.block}_StatusAgeArray = new Array();
</c:if>
<c:if test="${param.StatusSexArray}">	
	var ${param.block}_StatusSexArray = new Array();
</c:if>
<c:if test="${param.StatusRaceArray}">
	var ${param.block}_StatusRaceArray = new Array();
</c:if>
<c:if test="${param.StatusEthnicityArray}">
	var ${param.block}_StatusEthnicityArray = new Array();
</c:if>
<c:if test="${param.EnvMortArray}">	
	var ${param.block}_EnvMortArray = new Array();
</c:if>
<c:if test="${param.MedicationAgeArray}">
	var ${param.block}_MedicationAgeArray = new Array();
</c:if>
<c:if test="${param.EnvironmentStatusArray}">
	var ${param.block}_EnvironmentStatusArray = new Array();
</c:if>
<c:if test="${param.ClassAgeArray}">
	var ${param.block}_ClassAgeArray = new Array();
</c:if>
<c:if test="${param.AgeSexArray}">	
	var ${param.block}_AgeSexArray = new Array();
</c:if>
<c:if test="${param.SexAgeArray}">	
	var ${param.block}_SexAgeArray = new Array();
</c:if>
<c:if test="${param.SeverityStatusArray}">	
	var ${param.block}_SeverityStatusArray = new Array();
</c:if>
<c:if test="${param.AgeStatusArray}">
	var ${param.block}_AgeStatusArray = new Array();
</c:if>
<c:if test="${param.RaceStatusArray}">
	var ${param.block}_RaceStatusArray = new Array();
</c:if>
<c:if test="${param.SexStatusArray}">
	var ${param.block}_SexStatusArray = new Array();
</c:if>
<c:if test="${param.CategoryResultArray}">
	var ${param.block}_CategoryResultArray = new Array();
</c:if>
<c:if test="${param.InitialCountSevenArray}">
	var ${param.block}_InitialCountSevenArray = new Array();
</c:if>
<c:if test="${param.IntervalBinArray}">
	var ${param.block}_IntervalBinArray = new Array();
</c:if>
<c:if test="${param.MedicationTSArray}">
	var ${param.block}_MedicationTSArray = new Array();
</c:if>
<c:if test="${param.MedicationOverallArray}">
	var ${param.block}_MedicationOverallArray = new Array();
</c:if>
<c:if test="${param.AlcoholOpioidAllArray}">
	var ${param.block}_AlcoholOpioidAllArray = new Array();
</c:if>
<c:if test="${param.AlcoholOpioidCovidArray}">
	var ${param.block}_AlcoholOpioidCovidArray = new Array();
</c:if>
<c:if test="${param.AlcoholSmokingAllArray}">
	var ${param.block}_AlcoholSmokingAllArray = new Array();
</c:if>
<c:if test="${param.AlcoholSmokingCovidArray}">
	var ${param.block}_AlcoholSmokingCovidArray = new Array();
</c:if>
<c:if test="${param.OpioidSmokingAllArray}">
	var ${param.block}_OpioidSmokingAllArray = new Array();
</c:if>
<c:if test="${param.OpioidSmokingCovidArray}">
	var ${param.block}_OpioidSmokingCovidArray = new Array();
</c:if>
<c:if test="${param.AlcoholStatusArray}">
	var ${param.block}_AlcoholStatusArray = new Array();
</c:if>
<c:if test="${param.CannabisStatusArray}">
	var ${param.block}_CannabisStatusArray = new Array();
</c:if>
<c:if test="${param.OpioidsStatusArray}">
	var ${param.block}_OpioidsStatusArray = new Array();
</c:if>
<c:if test="${param.SmokingStatusArray}">
	var ${param.block}_SmokingStatusArray = new Array();
</c:if>
<c:if test="${param.AntiOpioidsArray}">
	var ${param.block}_AntiOpioidsArray = new Array();
</c:if>
<c:if test="${param.ConditionArray}">
	var ${param.block}_ConditionArray = new Array();
</c:if>
<c:if test="${param.ComorbidityArray}">
	var ${param.block}_ComorbidityArray = new Array();
</c:if>
	

function ${param.block}_refreshHistograms(just_viz) {
	
    if (typeof just_viz === 'undefined'){
    	var data = $("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().toArray();
 	    var data2 = $("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data();
 	    
		
 	    
		<c:if test="${param.DaysArray}">
			${param.block}_refreshDaysArray(data);
		</c:if>
		
		<c:if test="${param.AgeArray}">
    		${param.block}_refreshAgeArray(data);
    	</c:if>
    	
    	<c:if test="${param.RaceArray}">
	    	${param.block}_refreshRaceArray(data);
	    </c:if>
	    
	    <c:if test="${param.EthnicityArray}">
	    	${param.block}_refreshEthnicityArray(data);
	    </c:if>
	    
	    <c:if test="${param.SexArray}">
	    	${param.block}_refreshSexArray(data);
	    </c:if>
	    
		<c:if test="${param.SeverityArray}">
	    	${param.block}_refreshSeverityArray(data);
		</c:if>
		
		<c:if test="${param.AlcoholArray}">
	    	${param.block}_refreshAlcoholArray(data);
	    </c:if>
	    
	    <c:if test="${param.OpioidArray}">
	    	${param.block}_refreshOpioidArray(data);
	    </c:if>
	    
	    <c:if test="${param.SmokingArray}">
	    	${param.block}_refreshSmokingArray(data);
	    </c:if>
	    
	    <c:if test="${param.DelayArray}">
	    	${param.block}_refreshDelayArray(data);
	    </c:if>
	    
	    <c:if test="${param.MedicationoccurrenceArray}">
	    	${param.block}_refreshMedicationoccurrenceArray(data);
	    </c:if>
	    
	    <c:if test="${param.MortalityArray}">
	    	${param.block}_refreshMortalityArray(data);
	    </c:if>
	    
	    <c:if test="${param.VaccinationstatusArray}">
	    	${param.block}_refreshVaccinationstatusArray(data);
		</c:if>
		
		<c:if test="${param.LongstatusArray}">
	    	${param.block}_refreshLongstatusArray(data);
	    </c:if>
	    
	    <c:if test="${param.HospstatusArray}">
	    	${param.block}_refreshHospstatusArray(data);
	    </c:if>
	    
	    <c:if test="${param.CovidstatusArray}">
	    	${param.block}_refreshCovidstatusArray(data);
	    </c:if>
	    <c:if test="${param.CmsArray}">
    		${param.block}_refreshCmsArray(data);
   		</c:if>
	   
	    	
	    <c:if test="${param.SeverityMetArray}">
	    	${param.block}_refreshSeverityMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.SeverityNoMetArray}">
	    	${param.block}_refreshSeverityNoMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.SeverityDiabMetArray}">
	    	${param.block}_refreshSeverityDiabMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.SeverityDiabNoMetArray}">
	    	${param.block}_refreshSeverityDiabNoMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.SeverityNoDiabMetArray}">
	    	${param.block}_refreshSeverityNoDiabMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.SeverityNoDiabNoMetArray}">
	    	${param.block}_refreshSeverityNoDiabNoMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.raceEthnicityArray}">
			${param.block}_refreshraceEthnicityArray(data);
		</c:if>
		
		<c:if test="${param.raceSexArray}">
			${param.block}_refreshraceSexArray(data);
		</c:if>
	    <c:if test="${param.LongMetArray}">
	    	${param.block}_refreshLongMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.LongNoMetArray}">
	    	${param.block}_refreshLongNoMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.LongDiabMetArray}">
	    	${param.block}_refreshLongDiabMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.LongDiabNoMetArray}">
	    	${param.block}_refreshLongDiabNoMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.LongNoDiabMetArray}">
	    	${param.block}_refreshLongNoDiabMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.LongNoDiabNoMetArray}">
	    	${param.block}_refreshLongNoDiabNoMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.MortalityMetArray}">
	    	${param.block}_refreshMortalityMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.MortalityNoMetArray}">
	    	${param.block}_refreshMortalityNoMetArray(data);
	    </c:if>
	    
		<c:if test="${param.MortalityDiabMetArray}">
	    	${param.block}_refreshMortalityDiabMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.MortalityDiabNoMetArray}">
	    	${param.block}_refreshMortalityDiabNoMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.MortalityNoDiabMetArray}">
	    	${param.block}_refreshMortalityNoDiabMetArray(data);
	    </c:if>
	    
	    <c:if test="${param.MortalityNoDiabNoMetArray}">
	    	${param.block}_refreshMortalityNoDiabNoMetArray(data);
	    </c:if>
	   	
	 	<c:if test="${param.cciscoreSeverityArray}">
	    	${param.block}_refreshcciscoreSeverityArray(data);
	    </c:if>
	    
		<c:if test="${param.vaccinatedSeverityArray}">
	    	${param.block}_refreshvaccinatedSeverityArray(data);
	    </c:if>
	    <c:if test="${param.ObservationArray}">
	    	${param.block}_refreshObservationArray(data);
	    </c:if>
	    

		<c:if test="${param.BeforeAfterArray}">
	    	${param.block}_refreshBeforeAfterArray(data);
	    </c:if>
	    
		<c:if test="${param.SeverityRegionArray}">
	    	${param.block}_refreshSeverityRegionArray(data);
	    </c:if>
	    
		<c:if test="${param.SymptomAgeArray}">
	    	${param.block}_refreshSymptomAgeArray(data);
	    </c:if>
	    
		<c:if test="${param.SymptomSexArray}">
	    	${param.block}_refreshSymptomSexArray(data);
	    </c:if>
		<c:if test="${param.SymptomRaceArray}">
	    	${param.block}_refreshSymptomRaceArray(data);
	    </c:if>
		<c:if test="${param.SymptomEthnicityArray}">
	    	${param.block}_refreshSymptomEthnicityArray(data);
	    </c:if>
	 	<c:if test="${param.MedicationArray}">
	    	${param.block}_refreshMedicationArray(data2);
	    </c:if>
	 	<c:if test="${param.StatusAgeArray}">
	    	${param.block}_refreshStatusAgeArray(data2);
	    </c:if>
	 	<c:if test="${param.StatusSexArray}">
	    	${param.block}_refreshStatusSexArray(data2);
	    </c:if>
		<c:if test="${param.StatusRaceArray}">
	    	${param.block}_refreshStatusRaceArray(data2);
	    </c:if>
		<c:if test="${param.StatusEthnicityArray}">
	    	${param.block}_refreshStatusEthnicityArray(data2);
	    </c:if>
	    <c:if test="${param.EnvMortArray}">
	    	${param.block}_refreshEnvMortArray(data2);
	    </c:if>
		<c:if test="${param.MedicationAgeArray}">
	    	${param.block}_refreshMedicationAgeArray(data);
		</c:if>
		<c:if test="${param.EnvironmentStatusArray}">
	    	${param.block}_refreshEnvironmentStatusArray(data);
	    </c:if>
	    <c:if test="${param.ClassAgeArray}">
	    	${param.block}_refreshClassAgeArray(data);
	    </c:if>
	    
	    <c:if test="${param.AgeSexArray}">
	    	${param.block}_refreshAgeSexArray(data2);
	    </c:if>
		<c:if test="${param.SexAgeArray}">
	    	${param.block}_refreshSexAgeArray(data2);
	    </c:if>
	    
	    <c:if test="${param.SeverityStatusArray}">
	    	${param.block}_refreshSeverityStatusArray(data);
	    </c:if>
		<c:if test="${param.statusArray}">
	    	${param.block}_refreshstatusArray(data);
	    </c:if>
	    
	    <c:if test="${param.countArray}">
    		${param.block}_refreshcountArray(data);
   		</c:if>
    
    
	    <c:if test="${param.CategoryResultArray}">
	    	${param.block}_refreshCategoryResultArray(data);
	    </c:if>
	    <c:if test="${param.InitialCountSevenArray}">
	    	${param.block}_refreshInitialCountSevenArray(data);
	    </c:if>
	    <c:if test="${param.IntervalBinArray}">
	    	${param.block}_refreshIntervalBinArray(data);
	    </c:if>
	    <c:if test="${param.MedicationTSArray}">
	    	${param.block}_refreshMedicationTSArray(data);
	    </c:if>
	    <c:if test="${param.MedicationOverallArray}">
	    	${param.block}_refreshMedicationOverallArray(data);
	    </c:if>
	    <c:if test="${param.AlcoholOpioidAllArray}">
	    	${param.block}_refreshAlcoholOpioidAllArray(data);
	    </c:if>
	    <c:if test="${param.AlcoholOpioidCovidArray}">
	    	${param.block}_refreshAlcoholOpioidCovidArray(data);
	    </c:if>
	    <c:if test="${param.AlcoholSmokingAllArray}">
	    	${param.block}_refreshAlcoholSmokingAllArray(data);
	    </c:if>
	    <c:if test="${param.AlcoholSmokingCovidArray}">
	    	${param.block}_refreshAlcoholSmokingCovidArray(data);
	    </c:if>
	    <c:if test="${param.OpioidSmokingAllArray}">
	    	${param.block}_refreshOpioidSmokingAllArray(data);
	    </c:if>
	    <c:if test="${param.OpioidSmokingCovidArray}">
	    	${param.block}_refreshOpioidSmokingCovidArray(data);
	    </c:if>
	    <c:if test="${param.AlcoholStatusArray}">
	    	${param.block}_refreshAlcoholStatusArray(data);
	    </c:if>
	    <c:if test="${param.CannabisStatusArray}">
	    	${param.block}_refreshCannabisStatusArray(data);
	    </c:if>
	    <c:if test="${param.OpioidsStatusArray}">
	    	${param.block}_refreshOpioidsStatusArray(data);
	    </c:if>
	    <c:if test="${param.SmokingStatusArray}">
	    	${param.block}_refreshSmokingStatusArray(data);
	    </c:if>
	    <c:if test="${param.AntiOpioidsArray}">
    		${param.block}_refreshAntiOpioidsArray(data);
    	</c:if>
	    <c:if test="${param.ConditionArray}">
    		${param.block}_refreshConditionArray(data);
    	</c:if>
	    <c:if test="${param.ComorbidityArray}">
    		${param.block}_refreshComorbidityArray(data);
    	</c:if>
    };
   	
    if (${param.block}_loaded("covidstatus")) {
    	${param.block}_covidstatus_refresh();
    }
    if ('${param.block}' === 'long_covid_6') {
    	${param.block}_before_refresh();
    }
    if (${param.block}_loaded("observation")) {
    	${param.block}_observation_refresh();
    }

    if (${param.block}_loaded("severity")) {
    	${param.block}_severity_refresh();
    }
    if (${param.block}_loaded("conditioncount")) {
    	${param.block}_conditioncount_refresh();
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
    if (${param.block}_loaded("cms")) {
    	${param.block}_cms_refresh();
    }
    if (${param.block}_loaded("alcohol")) {
    	${param.block}_alcohol_refresh();
    }
    if (${param.block}_loaded("opioid")) {
    	${param.block}_opioid_refresh();
    }
    if (${param.block}_loaded("smoking")) {
    	${param.block}_smoking_refresh();
    }
    if (${param.block}_loaded("ethnicity")) {
    	${param.block}_ethnicity_refresh();
    }
    if (${param.block}_loaded("medicationoccurrence")) {
    	${param.block}_medicationoccurrence_refresh();
    }
    if (${param.block}_loaded("mortality")) {
    	${param.block}_mortality_refresh();
    }
    if (${param.block}_loaded("vaccinationstatus")) {
    	${param.block}_vaccinationstatus_refresh();
    }
    if (${param.block}_loaded("longstatus")) {
    	${param.block}_longstatus_refresh();
    }
    if (${param.block}_loaded("hospstatus")) {
    	${param.block}_hospstatus_refresh();
    }
    if (${param.block}_loaded("alcohol_status")) {
    	${param.block}_alcoholstatus_refresh();
    }
    if (${param.block}_loaded("cannabis_status")) {
    	${param.block}_cannabisstatus_refresh();
    }
    if (${param.block}_loaded("opioids_status")) {
    	${param.block}_opioidsstatus_refresh();
    }
    if (${param.block}_loaded("smoking_status")) {
    	${param.block}_smokingstatus_refresh();
    }
    if ('${param.block}' === "environment_2"|| '${param.block}' === "environment_3") {
    	${param.block}_environment_refresh();
    }
    if ('${param.block}' === "metformin_2"|| '${param.block}' === "metformin_6") {
    	${param.block}_severity_refresh();
    }
    if ('${param.block}' === "metformin_3"|| '${param.block}' === "metformin_7") {
    	${param.block}_long_refresh();
    }
    if ('${param.block}' === "metformin_4"|| '${param.block}' === "metformin_8") {
    	${param.block}_mortality_refresh();
    }
    if ('${param.block}' === "medications_1") {
    	${param.block}_medication_refresh();
    }
    if ('${param.block}' === "medications_2") {
    	${param.block}_class_refresh();
    }
    if ('${param.block}' === "medications_3") {
    	${param.block}_medication_refresh();
    }
    if (${param.block}_loaded("raceseverity")) {
    	${param.block}_raceseverity_refresh();
    }
    if (${param.block}_loaded("comorbidity")) {
    	${param.block}_comorbidity_refresh();
    }  
    if (${param.block}_loaded("raceethnicity")) {
    	${param.block}_raceethnicity_refresh();
    }  
    if (${param.block}_loaded("racesex")) {
    	${param.block}_racesex_refresh();
    }  
    if (${param.block}_loaded("result")) {
    	${param.block}_result_refresh();
    }  
    if ('${param.block}' === 'paxlovid_3') {
    	${param.block}_visits_refresh();
    }
    if ('${param.block}' === 'mortality_2') {
    	${param.block}_delay_refresh();
    }
    if ('${param.block}' === 'med_snap_2') {
    	${param.block}_severitydiagnosis_refresh();
    }
    if ('${param.block}' === 'med_snap_4') {
    	${param.block}_severitycciscore_refresh();
    }
    if ('${param.block}' === 'med_snap_5') {
    	${param.block}_severityvaccinated_refresh();
    }
    if ('${param.block}' === 'med_snap_3') {
    	${param.block}_sotrovimab1_refresh();
    	${param.block}_sotrovimab2_refresh();
    }
    if ('${param.block}' === "diabetes_1" || '${param.block}' === "diabetes_2") {
    	${param.block}_refresh();
    }
    if ('${param.block}' === "severity_region_1") {
    	${param.block}_region_refresh();
    }
    if ('${param.block}'.includes('hlh')) {
    	${param.block}_age_refresh();
    	${param.block}_sex_refresh();
    }
    if (["long_covid_3", "long_covid_4", "long_covid_5", "long_covid_7", "long_covid_8", "long_covid_9", "long_covid_10", "long_covid_11"].includes('${param.block}')) {
    	${param.block}_age_refresh();
    	${param.block}_race_refresh();
    	${param.block}_sex_refresh();
    	${param.block}_ethnicity_refresh();
    }
    if ('${param.block}' === "paxlovid_4") {
    	${param.block}_age_refresh();
    	${param.block}_race_refresh();
    	${param.block}_sex_refresh();
    }
    if ('${param.block}' === "paxlovid_5") {
    	${param.block}_vaccination_refresh();
    }
    if ('${param.block}' === "paxlovid_7") {
    	${param.block}_cci_refresh();
    }
    if ('${param.block}' === "paxlovid_9") {
    	${param.block}_days_refresh();
    }
    if ('${param.block}' === "substance_use_4") {
    	${param.block}_alcohol_opioid_all_refresh();
    	${param.block}_alcohol_opioid_covid_refresh();
    }
    if ('${param.block}' === "substance_use_5") {
    	${param.block}_alcohol_smoking_all_refresh();
    	${param.block}_alcohol_smoking_covid_refresh();
    }
    if ('${param.block}' === "substance_use_6") {
    	${param.block}_opioid_smoking_all_refresh();
    	${param.block}_opioid_smoking_covid_refresh();
    }
    if ('${param.block}' === "substance_use_8") {
    	${param.block}_anti_opioids_refresh();
    }
    if ('${param.block}' === "enclave_health_2" || '${param.block}' === "enclave_health_1") {
    	${param.block}_condition_refresh();
    }
    if ('${param.block}' === "enclave_health_3") {
    	${param.block}_comorbidity_refresh();
    }
}
	
// new load function for composite views
function ${param.block}_panel(selection) {
	for (i in selection){
		${param.block}_load(selection[i]);
	}
};


// manage incremental loading of panels on inner nav bar clicks
var ${param.block}_crumbs = [];

function ${param.block}_load(selection) {
	var $this = $("#${param.block}-"+selection);
	var which = $this.attr('src');

	// console.log("in main click", "${param.block}-"+selection, "which", which)
	if (!${param.block}_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/"+which);
		${param.block}_crumbs.push(selection);
	}
};

function ${param.block}_loaded(selection) {
	return ${param.block}_crumbs.includes(selection);
}
</script>

<c:if test="${param.DaysArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="DaysArray"/>
		<jsp:param name="primary" value="days"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.AgeArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AgeArray"/>
		<jsp:param name="primary" value="age"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.RaceArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="RaceArray"/>
		<jsp:param name="primary" value="race"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.SexArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SexArray"/>
		<jsp:param name="primary" value="sex"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.EthnicityArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="EthnicityArray"/>
		<jsp:param name="primary" value="ethnicity"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.SeverityArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>


<c:if test="${param.MedicationoccurrenceArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MedicationoccurrenceArray"/>
		<jsp:param name="primary" value="medocc"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MortalityArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MortalityArray"/>
		<jsp:param name="primary" value="mortality"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.AlcoholArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AlcoholArray"/>
		<jsp:param name="primary" value="condition"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.OpioidArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="OpioidArray"/>
		<jsp:param name="primary" value="condition"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SmokingArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SmokingArray"/>
		<jsp:param name="primary" value="condition"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.VaccinationstatusArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="VaccinationstatusArray"/>
		<jsp:param name="primary" value="vaccinated"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.LongstatusArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="LongstatusArray"/>
		<jsp:param name="primary" value="long"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.HospstatusArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="HospstatusArray"/>
		<jsp:param name="primary" value="hosp"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.CovidstatusArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="CovidstatusArray"/>
		<jsp:param name="primary" value="status"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.CmsArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="CmsArray"/>
		<jsp:param name="primary" value="cms"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SeverityMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityMetArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="null"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SeverityNoMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityNoMetArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="null"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SeverityDiabMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityDiabMetArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SeverityDiabNoMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityDiabNoMetArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SeverityNoDiabMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityNoDiabMetArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="No Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SeverityNoDiabNoMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityNoDiabNoMetArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="No Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MortalityMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MortalityMetArray"/>
		<jsp:param name="primary" value="mortality"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="null"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MortalityNoMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MortalityNoMetArray"/>
		<jsp:param name="primary" value="mortality"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="null"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MortalityDiabMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MortalityDiabMetArray"/>
		<jsp:param name="primary" value="mortality"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MortalityDiabNoMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MortalityDiabNoMetArray"/>
		<jsp:param name="primary" value="mortality"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MortalityNoDiabMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MortalityNoDiabMetArray"/>
		<jsp:param name="primary" value="mortality"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="No Diabetes"/>
	</jsp:include>
</c:if>

<c:if test="${param.MortalityNoDiabNoMetArray}">	
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MortalityNoDiabNoMetArray"/>
		<jsp:param name="primary" value="mortality"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="No Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.LongMetArray}">	
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="LongMetArray"/>
		<jsp:param name="primary" value="long"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="null"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.LongNoMetArray}">	
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="LongNoMetArray"/>
		<jsp:param name="primary" value="long"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="null"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.LongDiabMetArray}">	
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="LongDiabMetArray"/>
		<jsp:param name="primary" value="long"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.LongDiabNoMetArray}">	
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="LongDiabNoMetArray"/>
		<jsp:param name="primary" value="long"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.LongNoDiabMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="LongNoDiabMetArray"/>
		<jsp:param name="primary" value="long"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="No Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.LongNoDiabNoMetArray}">
	<jsp:include page="singleHistogram_filtered.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="LongNoDiabNoMetArray"/>
		<jsp:param name="primary" value="long"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="filter_col" value="metformin"/>
		<jsp:param name="filter" value="No Metformin"/>
		<jsp:param name="filter_col2" value="diabetes"/>
		<jsp:param name="filter2" value="No Diabetes"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.DelayArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="DelayArray"/>
		<jsp:param name="primary" value="datediff_bw_death_and_hos"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.BeforeAfterArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="BeforeAfterArray"/>
		<jsp:param name="primary" value="symptom"/>
		<jsp:param name="secondary" value="condition_after_covid_positive"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.raceEthnicityArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="raceEthnicityArray"/>
		<jsp:param name="primary" value="race"/>
		<jsp:param name="secondary" value="ethnicity"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.raceSexArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="raceSexArray"/>
		<jsp:param name="primary" value="race"/>
		<jsp:param name="secondary" value="sex"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.cciscoreSeverityArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="cciscoreSeverityArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="secondary" value="comorbidity"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.vaccinatedSeverityArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="vaccinatedSeverityArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="secondary" value="vaccinated"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.ObservationArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="ObservationArray"/>
		<jsp:param name="primary" value="observation"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SeverityRegionArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityRegionArray"/>
		<jsp:param name="primary" value="region"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SymptomAgeArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SymptomAgeArray"/>
		<jsp:param name="primary" value="symptom"/>
		<jsp:param name="secondary" value="age"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SymptomSexArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SymptomSexArray"/>
		<jsp:param name="primary" value="symptom"/>
		<jsp:param name="secondary" value="sex"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SymptomRaceArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SymptomRaceArray"/>
		<jsp:param name="primary" value="symptom"/>
		<jsp:param name="secondary" value="race"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SymptomEthnicityArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SymptomEthnicityArray"/>
		<jsp:param name="primary" value="symptom"/>
		<jsp:param name="secondary" value="ethnicity"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.CategoryResultArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="CategoryResultArray"/>
		<jsp:param name="primary" value="category"/>
		<jsp:param name="secondary" value="result"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MedicationArray}">
	<jsp:include page="tripleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MedicationArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="drug_domain"/>
		<jsp:param name="secondary" value="concept_set_name"/>
		<jsp:param name="tertiary" value="age"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MedicationAgeArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MedicationAgeArray"/>
		<jsp:param name="primary" value="concept_set_name"/>
		<jsp:param name="secondary" value="age"/>
		<jsp:param name="sort_desc" value="count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.EnvironmentStatusArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="EnvironmentStatusArray"/>
		<jsp:param name="primary" value="environmental_factor"/>
		<jsp:param name="secondary" value="status"/>
		<jsp:param name="sort_desc" value="count"/>
	</jsp:include>
</c:if>

<c:if test="${param.ClassAgeArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="ClassAgeArray"/>
		<jsp:param name="primary" value="drug_domain"/>
		<jsp:param name="secondary" value="age"/>
		<jsp:param name="sort_desc" value="count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.AgeSexArray}">
	<jsp:include page="tripleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AgeSexArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="observation"/>
		<jsp:param name="secondary" value="age"/>
		<jsp:param name="tertiary" value="sex"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SexAgeArray}">
	<jsp:include page="tripleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SexAgeArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="observation"/>
		<jsp:param name="secondary" value="sex"/>
		<jsp:param name="tertiary" value="age"/>
	</jsp:include>
</c:if>

<c:if test="${param.statusArray}">
	<jsp:include page="tripleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="statusArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="observation"/>
		<jsp:param name="secondary" value="sex"/>
		<jsp:param name="tertiary" value="age"/>
	</jsp:include>
</c:if>

<c:if test="${param.countArray}">
	<jsp:include page="tripleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="countArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="list_of_conditions"/>
		<jsp:param name="secondary" value="count"/>
		<jsp:param name="tertiary" value="age"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.StatusAgeArray}">
	<jsp:include page="tripleHistogram2.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="StatusAgeArray"/>
		<jsp:param name="primary" value="status"/>
		<jsp:param name="secondary" value="long"/>
		<jsp:param name="tertiary" value="age"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.StatusRaceArray}">
	<jsp:include page="tripleHistogram2.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="StatusRaceArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="status"/>
		<jsp:param name="secondary" value="long"/>
		<jsp:param name="tertiary" value="race"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.StatusEthnicityArray}">
	<jsp:include page="tripleHistogram2.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="StatusEthnicityArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="status"/>
		<jsp:param name="secondary" value="long"/>
		<jsp:param name="tertiary" value="ethnicity"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.StatusSexArray}">
	<jsp:include page="tripleHistogram2.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="StatusSexArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="status"/>
		<jsp:param name="secondary" value="long"/>
		<jsp:param name="tertiary" value="sex"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.EnvMortArray}">
	<jsp:include page="tripleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="EnvMortArray"/>
		<jsp:param name="wrap" value="no"/>
		<jsp:param name="primary" value="environmental_factor"/>
		<jsp:param name="secondary" value="mortality"/>
		<jsp:param name="tertiary" value="status"/>
	</jsp:include>
</c:if>

<c:if test="${param.SeverityStatusArray}">
	<jsp:include page="doubleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SeverityStatusArray"/>
		<jsp:param name="primary" value="severity"/>
		<jsp:param name="secondary" value="smoking_status"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.InitialCountSevenArray}">
	<jsp:include page="timeline2Histogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="InitialCountSevenArray"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.IntervalBinArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="IntervalBinArray"/>
		<jsp:param name="primary" value="interval_bin"/>
		<jsp:param name="count" value="actual_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.MedicationTSArray}">
	<jsp:include page="timelineNHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MedicationTSArray"/>
	</jsp:include>
</c:if>

<c:if test="${param.MedicationOverallArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="MedicationOverallArray"/>
		<jsp:param name="primary" value="medication"/>
		<jsp:param name="count" value="count"/>
	</jsp:include>
</c:if>

<c:if test="${param.AlcoholOpioidAllArray}">
	<jsp:include page="heatmapHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AlcoholOpioidAllArray"/>
		<jsp:param name="primary" value="condition2"/>
		<jsp:param name="secondary" value="condition1"/>
		<jsp:param name="count" value="all_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.AlcoholOpioidCovidArray}">
	<jsp:include page="heatmapHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AlcoholOpioidCovidArray"/>
		<jsp:param name="primary" value="condition2"/>
		<jsp:param name="secondary" value="condition1"/>
		<jsp:param name="count" value="covid_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.AlcoholSmokingAllArray}">
	<jsp:include page="heatmapHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AlcoholSmokingAllArray"/>
		<jsp:param name="primary" value="condition2"/>
		<jsp:param name="secondary" value="condition1"/>
		<jsp:param name="count" value="all_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.AlcoholSmokingCovidArray}">
	<jsp:include page="heatmapHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AlcoholSmokingCovidArray"/>
		<jsp:param name="primary" value="condition2"/>
		<jsp:param name="secondary" value="condition1"/>
		<jsp:param name="count" value="covid_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.OpioidSmokingAllArray}">
	<jsp:include page="heatmapHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="OpioidSmokingAllArray"/>
		<jsp:param name="primary" value="condition2"/>
		<jsp:param name="secondary" value="condition1"/>
		<jsp:param name="count" value="all_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.OpioidSmokingCovidArray}">
	<jsp:include page="heatmapHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="OpioidSmokingCovidArray"/>
		<jsp:param name="primary" value="condition2"/>
		<jsp:param name="secondary" value="condition1"/>
		<jsp:param name="count" value="covid_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.AlcoholStatusArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AlcoholStatusArray"/>
		<jsp:param name="primary" value="alcohol"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.CannabisStatusArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="CannabisStatusArray"/>
		<jsp:param name="primary" value="cannabis"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.OpioidsStatusArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="OpioidsStatusArray"/>
		<jsp:param name="primary" value="opioids"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.SmokingStatusArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="SmokingStatusArray"/>
		<jsp:param name="primary" value="smoking"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>

<c:if test="${param.AntiOpioidsArray}">
	<jsp:include page="doubleHistogram2.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="AntiOpioidsArray"/>
		<jsp:param name="primary" value="opioids"/>
		<jsp:param name="secondary" value='["naltrexone_count","methadone_count","buprenorphine_count","naloxone_count"]'/>
		<jsp:param name="sort_desc" value="count"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.ConditionArray}">
	<jsp:include page="singleHistogram_widedata.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="ConditionArray"/>
		<jsp:param name="primary" value="condition"/>
		<jsp:param name="count" value="patient_count"/>
		<jsp:param name="column_id" value="conditionid"/>
	</jsp:include>
</c:if>
	
<c:if test="${param.ComorbidityArray}">
	<jsp:include page="singleHistogram.jsp">
		<jsp:param name="block" value="${param.block}"/>
		<jsp:param name="datatable_div" value="${param.datatable_div}"/>
		<jsp:param name="array" value="ComorbidityArray"/>
		<jsp:param name="primary" value="comorbidity"/>
		<jsp:param name="count" value="patient_count"/>
	</jsp:include>
</c:if>
	
