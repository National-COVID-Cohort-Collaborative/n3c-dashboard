<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="row">
	<div class="col-12 viz-header-section">
		<div style="display:flex; flex-wrap: nowrap;">
			<h2 id="${param.block}condition-title" class="viz-title"></h2>
			<div>
				<button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-download"></i>
				</button>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" onclick="save_viz_pass_condition('.jpg');">Save as JPG</a>
					<a class="dropdown-item" onclick="save_viz_pass_condition('.png');">Save as PNG</a>
					<a class="dropdown-item" onclick="save_viz_pass_condition('.svg');">Save as SVG</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12">
		<div class="loading">
			<img src="<util:applicationRoot/>/images/loader.gif" alt="load">
		</div>
		<div id="${param.block}_condition_viz" class="dash_viz"></div>
	</div>
</div>


<script>
//this is to change the title of the download based on which visualization mode is selected
function save_viz_pass_condition(extension){
	var id = $("#${param.block}-mode").find('.text-primary').attr('id');
	var strings = id.split('-');
	var mode = strings[strings.length-1];
	
	var text = '';
	if (mode =='pie'){		
		text = "Condition Percentages of ${param.topic_title}" + extension;
	} else if (mode == 'bar'){
		text = "Counts of ${param.topic_title} by Condition" + extension;
	} else {
		text = "Condition Percentages of ${param.topic_title}" + extension;
	};
	
	saveVisualization('${param.block}_condition_viz', text);
};

// set inital title based on load mode
var title_id = $("#${param.block}-mode").find('.text-primary').attr('id');
var title_strings = title_id.split('-');
var title_mode = title_strings[title_strings.length-1];

if (title_mode =='pie'){		
	var title = "Condition Percentages of ${param.topic_title}";
	$("#${param.block}condition-title").text(title);
} else if (title_mode == 'bar'){
	var title = "Counts of ${param.topic_title} by Condition";
	$("#${param.block}condition-title").text(title);
} else {
	var title = "Condition Percentages of ${param.topic_title}";
	$("#${param.block}condition-title").text(title);
};

//this is to change the title of the graphic based on which visualization mode is selected
$('#${param.block}-mode-barpercent').on('mouseup', function() {
	var title = "Condition Percentages of ${param.topic_title}";
	$("#${param.block}condition-title").text(title);
});
$('#${param.block}-mode-bar').on('mouseup', function() {
	var title = "Counts of ${param.topic_title} by Condition";
	$("#${param.block}condition-title").text(title);
});
$('#${param.block}-mode-pie').on('mouseup', function() {
	var title = "Condition Percentages of ${param.topic_title}";
	$("#${param.block}condition-title").text(title);
});

function ${param.block}_condition_refresh() {
	var properties = {
			domName: '#${param.block}_condition_viz',
			barLabelWidth: 370,
			min_height: 300,
			ordered: 0,
			colorscale: categorical2,
			legend_label: 'Condition',
			legend_data: condition_legend,
			donutRatio: 0.5
		}

	var id = $("#${param.block}-mode").find('.text-primary').attr('id');
	var strings = id.split('-');
	var mode = strings[strings.length-1];
	
	d3.select("#${param.block}_condition_viz").select("svg").remove();
	
	if (mode =='pie'){		
		localPieChart_new(${param.block}_ConditionArray, properties);
	} else if (mode == 'bar'){
		localHorizontalBarChart_new(${param.block}_ConditionArray, properties);
	} else {
		localPercentageBarChart_new(${param.block}_ConditionArray, properties);
	};
	
}

</script>