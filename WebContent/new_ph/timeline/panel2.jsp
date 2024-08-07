<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
#d3viz .dataTables_filter{
    display: none;
}
</style>
<div class="topic_dropdown" style="text-align:center; font-size: 1.3rem;">
	<h4 class="viz_color_header">Select a Topic to Explore:</h4>
	<select id="selectMe">
		<option value="timeline_1">Daily Patient Count & 7-day Rolling Avg.</option>
		<option value="timeline_2">Cumulative Patient Count & 7-day Rolling Avg.</option>
	</select>
</div>
<div id="frame">
	<div id="timeline_1" class="group"></div>
	<div id="timeline_2" class="group"></div>
</div>

<script>

function url_map(selection) {
	return selection.substring(selection.lastIndexOf("_")+1);
}

function url_unmap(selector) {
	return 'timeline_'+selector;
}

var frame_crumbs = '';

<c:choose>
	<c:when test="${empty param.tertiary_tab || param.tertiary_tab == 'undefined'}">
		frame_load('timeline_1');
	</c:when>
	<c:otherwise>
		$('#selectMe').val(url_unmap('${param.tertiary_tab}'));
		frame_load(url_unmap('${param.tertiary_tab}'));
	</c:otherwise>
</c:choose>

function frame_load(selection) {
	var $this = $("#"+selection);

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/timeline/"+selection+".jsp?did=${param.did}");
		frame_crumbs = frame_crumbs + selection;
	}
	if (typeof embedded_mode == 'undefined' || !embedded_mode)
		cache_browser_history("public-health", "public-health/timeline/"+url_map(selection));
};

	

$(document).ready(function () {
	$('#selectMe').select2({
		minimumResultsForSearch: Infinity
    });
    
	// set breadcrumb text to panel on intial load
    $('#topic_breadcrumb').html($("#selectMe :selected").text());
    
    $('#selectMe').change(function () {
		frame_load($(this).val());
		$('.group').hide();
	    $('#'+$(this).val()).show();
	    // set breadcrumb to be the selected value
	    $('#topic_breadcrumb').html($("option:selected", $(this)).text());
	    
	    // this resets the datatable after selecting a new panel to display b/c graph resets
	    var val = $(this).val();
	    var myString = val.substr(val.indexOf("_") + 1);
	    eval(val + "_constraint_begin = null;");
	    eval(val + "_constraint_end = null;");
	    var table = $("#positives-by-date" + myString + "-table").DataTable();
	    table.draw();
    }); 
});

</script>