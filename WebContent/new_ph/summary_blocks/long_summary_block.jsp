<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
#questions li{
	font-size: 1.3rem;
}

.feature_viz_section{
/* 	padding-bottom: 30px;  */
/* 	border-bottom: 6px dashed lightgray; */
}

.feature_sub_heading{
	font-weight: 400;
	color: #3f3f3f;
}

.summary .viz_footer{
	color: #616161;
	font-size: 0.8rem;
}

.summary_heading{
/* 	border-bottom: 3px solid #C9D3E8;  */
/* 	border-top: 3px solid #C9D3E8;  */
	padding-bottom: 10px; 
	padding-top: 10px; 
	display: inline-block;
}

.color_header2{
/* 	color: #007bff; */
/* 	font-style: italic; */
	font-weight: 600;
	font-size: 1.2rem;
}

.limitation_link{
/* 	color: inherit; */
    text-decoration: underline;
}

.summary_description{
/* 	border-top: 3px solid #C9D3E8;  */
/* 	border-bottom: 3px solid #C9D3E8;  */
	padding: 20px;
}
</style>


<div class="row stats block2 mx-auto summary">
	<div class="col-12">
		<div class="row mt-4">
			<div class="col-12 col-lg-6 text-center my-auto" >
				<div class="summary_description">
					<h3 class="" style="font-size: 1.7rem">
						<span class="summary_heading">What <strong style="color: #3F50B0">You</strong> Can Do With the Long COVID Dashboard</span>
					</h3>
					<p style="text-align: left;">Use these visualizations to gain an overview and learn what you can 
					explore within the Long COVID Dashboard. Within each visualization, click on any bar/tile to 
					navigate to its associated view.</p>
				</div>
			</div>
			<div class="col-12 col-lg-6">
<!-- 				<h4 class="text-center mb-2 mt-5 viz_color_header color_header2">1. Explore the Demographics Associated with Long COVID</h4> -->
				<h4 class="text-center mb-2 color_header2">1. Explore the Demographics Associated with Long COVID</h4>
				<div class="row feature_viz_section">
					<div class="col-12 mx-auto" id="indicator">
						<h5 class="text-center mb-2 feature_sub_heading">By Long COVID Diagnosis</h5>
						<div id="indicator_viz"></div>
						<jsp:include page="long_summary_block_vizs/long_bar.jsp">
							<jsp:param name="graph_element" value="indicator_viz" />
							<jsp:param name="container" value="indicator" />
							<jsp:param name="feed" value="long_bar_feed.jsp" />
							<jsp:param name="color_left" value="#33298D" />
							<jsp:param name="color_right" value="#3F50B0" />
							<jsp:param name="min_height" value="150" />
						</jsp:include>
						<p class="viz_footer">Number of Patients Captured by Each Long COVID Diagnosis Method.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-12 mt-3">
		<h4 class="text-center mt-2 color_header2">2. Explore Symptoms Commonly Associated with Long COVID</h4>
		<div class="row mb-4">
			<div class="col-12 col-lg-6" id="diagnosis">
				<h5 class="text-center mb-2 feature_sub_heading">By Symptom Experience Relative to COVID Diagnosis</h5>
				<div id="diagnosis_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="diagnosis_viz" />
					<jsp:param name="container" value="diagnosis" />
					<jsp:param name="feed" value="long_bar_feed3.jsp" />
					<jsp:param name="color_left" value="#33298D" />
					<jsp:param name="color_right" value="#3F50B0" />
					<jsp:param name="min_height" value="150" />
					<jsp:param name="min_height" value="150" />
				</jsp:include>
				<p class="viz_footer">Counts of Patients that Experienced Symptoms Before and After COVID Diagnosis. Both bars navigate to the same view.</p>
			</div>
			<div class="col-12 col-lg-6" id="individual_symptom">
				<h5 class="text-center mb-2 feature_sub_heading">By Individual Symptom</h5>
				<div id="individual_symptom_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_tree.jsp">
					<jsp:param name="graph_element" value="individual_symptom_viz" />
					<jsp:param name="container" value="individual_symptom" />
					<jsp:param name="feed" value="long_tree_feed.jsp" />
					<jsp:param name="color_start" value="#007bff" />
					<jsp:param name="color_end" value="#4833B2" />
				</jsp:include>
				<p class="viz_footer">Counts of Patients that Experienced Symptom.</p>
			</div>
		</div>
		
		<div class="row feature_viz_section">
			<div class="col-12 col-lg-6" id="status">
				<h5 class="text-center mb-2 feature_sub_heading">By COVID Status</h5>
				<div id="status_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="status_viz" />
					<jsp:param name="container" value="status" />
					<jsp:param name="feed" value="long_bar_feed4.jsp" />
					<jsp:param name="color_left" value="#33298D" />
					<jsp:param name="color_right" value="#3F50B0" />
					<jsp:param name="min_height" value="150" />
				</jsp:include>
				<p class="viz_footer">Counts of Patients that Experienced Symptoms by COVID Status.</p>
			</div>
			<div class="col-12 col-lg-6" id="symptom_group">
				<h5 class="text-center mb-2 feature_sub_heading">By Symptom Grouping</h5>
				<div id="symptom_group_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="symptom_group_viz" />
					<jsp:param name="container" value="symptom_group" />
					<jsp:param name="feed" value="long_bar_feed2.jsp" />
					<jsp:param name="color_left" value="#33298D" />
					<jsp:param name="color_right" value="#3F50B0" />
					<jsp:param name="min_height" value="150" />
				</jsp:include>
				<p class="viz_footer">Number of Distinct Symptom Values by Symptom Grouping.</p>
			</div>
		</div>
		
	</div>
</div>			

<script>


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


