<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="${param.block}_diabetes_t2_viz" class="col-lg-10 dash_viz"></div>
<p>Sample text.</p>
<script>

function ${param.block}_refresh() {
	console.log("diabetes graph", "${param.block}_diabetes_t2_viz", ${param.block}_DiabetesArray)
   	d3.select("#${param.block}_diabetes_t2_viz").select("svg").remove();
	localHorizontalGroupedStackedBarChart(${param.block}_GenderAgeArray,"${param.block}_diabetes_t2_viz", "observation", "gender", "patient_count", "age_bin", "Age", age_legend_4, age_range, "Observation", "Gender");	
}

</script>
