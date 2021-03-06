<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_paxlovid_viz" class="col-12 dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../paxlovid/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>
				
<div id="${param.block}_severity_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_paxlovid_viz', '${param.block}_paxlovid.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_paxlovid_viz', '${param.block}_paxlovid.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_paxlovid_viz', '${param.block}_paxlovid.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_age_refresh() {
	var properties = {
			domName: '${param.block}_paxlovid_viz',
			barLabelWidth: 120,
			legend_data: result_legend2,
			secondary_range: result_range,
			legend_label: 'Test Result',
			min_height: 200,
			nofilter: 1
		}

   	d3.select("#${param.block}_paxlovid_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_AgeResultArray, properties);	
}

${param.block}_age_refresh();
</script>
