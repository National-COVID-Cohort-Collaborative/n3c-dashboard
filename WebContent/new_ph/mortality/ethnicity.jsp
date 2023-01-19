<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<jsp:include page="../barPieToggle.jsp">
	<jsp:param name="block" value="${param.block}" />
	<jsp:param name="dimension" value="ethnicity" />
	<jsp:param name="dimension_name" value="Ethnicity" />
	<jsp:param name="dimension_range" value="ethnicity_range" />
	<jsp:param name="dimension_legend" value="ethnicity_legend" />
	<jsp:param name="dimension_minheight" value="300" />
</jsp:include>

<div class="row">
	<div class="col-12 viz-header-section">
		<h2 id="ethnicity-title" class="viz-title"></h2>
		<div class="btn-group float-right">
			<button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-download"></i>
			</button>
			<div class="dropdown-menu dropdown-menu-right">
				<a class="dropdown-item" onclick="save_viz_pass('.jpg');">Save as JPG</a>
				<a class="dropdown-item" onclick="save_viz_pass('.png');">Save as PNG</a>
				<a class="dropdown-item" onclick="save_viz_pass('.svg');">Save as SVG</a>
			</div>
		</div>
	</div>
	<div class="col-12">
		<div id="${param.block}_ethnicity_viz" class="dash_viz"></div>
	</div>
</div>



<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../mortality/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<script>
//this is to change the title of the download based on which visualization mode is selected
function save_viz_pass(extension){
	var id = $("#${param.block}-ethnicity-mode").find('.text-primary').attr('id');
	var strings = id.split('-');
	var mode = strings[strings.length-1];
	
	var text = '';
	if (mode =='pie'){		
		text = "Ethnicity Percentages of ${param.topic_title}" + extension;
	} else if (mode == 'bar'){
		text = "Counts of ${param.topic_title} by Ethnicity" + extension;
	} else {
		text = "Ethnicity Percentages of ${param.topic_title}" + extension;
	};
	
	saveVisualization('${param.block}_ethnicity_viz', text);
};

// set inital title based on load mode
var title_id = $("#${param.block}-ethnicity-mode").find('.text-primary').attr('id');
var title_strings = title_id.split('-');
var title_mode = title_strings[title_strings.length-1];

if (title_mode =='pie'){		
	var title = "Ethnicity Percentages of ${param.topic_title}";
	$("#ethnicity-title").text(title);
} else if (title_mode == 'bar'){
	var title = "Counts of ${param.topic_title} by Ethnicity";
	$("#ethnicity-title").text(title);
} else {
	var title = "Ethnicity Percentages of ${param.topic_title}";
	$("#ethnicity-title").text(title);
};

//this is to change the title of the graphic based on which visualization mode is selected
$('#${param.block}-ethnicity-mode-barpercent').on('mouseup', function() {
	var title = "Ethnicity Percentages of ${param.topic_title}";
	$("#ethnicity-title").text(title);
});
$('#${param.block}-ethnicity-mode-bar').on('mouseup', function() {
	var title = "Counts of ${param.topic_title} by Ethnicity";
	$("#ethnicity-title").text(title);
});
$('#${param.block}-ethnicity-mode-pie').on('mouseup', function() {
	var title = "Ethnicity Percentages of ${param.topic_title}";
	$("#ethnicity-title").text(title);
});



function ${param.block}_ethnicity_refresh() {
	var properties = {
			domName: '#${param.block}_ethnicity_viz',
			barLabelWidth: 150,
			min_height: 300,
			ordered: 0,
			colorscale: ethnicity_range,
			legend_label: 'Ethnicity',
			legend_data: ethnicity_legend,
			donutRatio: 0.5
		}

	var id = $("#${param.block}-ethnicity-mode").find('.text-primary').attr('id');
	var strings = id.split('-');
	var mode = strings[strings.length-1];
	
	d3.select("#${param.block}_ethnicity_viz").select("svg").remove();
	
	if (mode =='pie'){		
		localPieChart(${param.block}_EthnicityArray, properties);
	} else if (mode == 'bar'){
		localHorizontalBarChart_legend(${param.block}_EthnicityArray, properties);
	} else {
		localPercentageBarChart(${param.block}_EthnicityArray, properties);
	};

	
}

${param.block}_ethnicity_refresh();

</script>
