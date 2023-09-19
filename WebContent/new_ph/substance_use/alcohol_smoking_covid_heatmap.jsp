<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="substance_use5_covid">
	<div class="row">
		<div class="col-12 viz-header-section">
			<h2 class="viz-title">Alcohol and Smoking Use - COVID+ Patients</h2>
			<div class="btn-group float-right">
				<button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-download"></i>
				</button>
				
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" onclick="save_${param.block}_heatmap_covid_viz_pass('.jpg');">Save as JPG</a>
					<a class="dropdown-item" onclick="save_${param.block}_heatmap_covid_viz_pass('.png');">Save as PNG</a>
					<a class="dropdown-item" onclick="save_${param.block}_heatmap_covid_viz_pass('.svg');">Save as SVG</a>
				</div>
			</div>
		</div>
		<div class="col-12">
			<div class="loading">
				<img src="<util:applicationRoot/>/images/loader.gif" alt="load">
			</div>
			<div id="${param.block}_heatmap_covid_viz" class="col-12 dash_viz"></div>
		</div>
	</div>
</div>

<jsp:include page="../../graph_support/heatMap_local.jsp">
	<jsp:param name="basename" value="alc_smo"/>
	<jsp:param name="namespace" value="alc_smo_covid"/>
</jsp:include>

<script>

function save_${param.block}_heatmap_covid_viz_pass(extension){
	var date = $( "#current_date" ).text();
	var text = "Alcohol and Smoking Use - COVID+ Patients in " + date + extension;
	saveVisualization('${param.block}_heatmap_covid_viz', text);
};


function ${param.block}_alcohol_smoking_covid_refresh() {
	var properties = {
			domName: "${param.block}_heatmap_covid_viz",
			feed_url: "<util:applicationRoot/>/new_ph/substance_use/feeds/heatmap_clustered_alc_smo.jsp?covid_count=true",
			cell_size: 15,
			margin: { top: 100, right: 0, bottom: 10, left: 200 },
			source_label: "alcohol",
			target_label: "smoking",
			source_tooltip_label: "Alcohol Condition",
			target_tooltip_label: "Smoking Status",
			sub20hack: 1
		}
   	d3.select("#${param.block}_heatmap_covid_viz").select("svg").remove();
	alc_smo_covid_localHeatMap(${param.block}_AlcoholSmokingCovidArray, properties);	
}
</script>
