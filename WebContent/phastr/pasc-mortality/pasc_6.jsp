<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="analysis2-shap" />
	<jsp:param name="block_header" value="Analysis 2 SHAP" />

	<jsp:param name="did" value="929" />
	
	<jsp:param name="viz_panel" value="analysis2-shap-viz" />
	
	<jsp:param name="simple_panel" value="pasc-mortality/tables/analysis2_shap.jsp" />
</jsp:include>

<script>

function analysis2_shap_refresh() {
	var properties = {
			domName: 'analysis2-shap-viz',
			block: '${param.block}',
			primary: 'variable',
			secondary: 'cohort',
			estimate: 'shap_abs',
			xaxis_label: 'SHAP Value',
			bandLabelWidth: 375,
			barHeight: 15,
			barPadding: 3,
			minX: -0.2,
			maxX: 0.3,
			mode: "hazard",
			symbolSize: 4,
			legend_label: status_legend,
			colorscale: categorical,
			label1: 'Term',
			label2: 'Cohort',
			offset: 70,
			array: 'status',
			legendid: '${param.block}legend'
	};
   	d3.select("#analysis2-shap_plot").select("svg").remove();
	fetch('feeds/analysis2_shap.jsp')
	  .then(response => response.json())
	  .then(data => localHorizontalGroupedBarChart(data.rows, properties));
}

analysis2_shap_refresh();

</script>
