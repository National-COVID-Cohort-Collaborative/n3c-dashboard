<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<div class="accordion" id="${param.block}symptom_accordion">
 		<div class="card">
 			<div class="card-header" id="${param.block}symptom_heading">
				<h2 class="mb-0">
				<button class="filter_drop_button btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#${param.block}symptom_body" aria-expanded="true" aria-controls="${param.block}symptom_body">
  					Symptom
 				</button>
				</h2>
			</div>
		</div>
		<div id="${param.block}symptom_body" class="collapse" aria-labelledby="${param.block}symptom_heading" data-parent="#${param.block}symptom_accordion">
			<div class="card-body">
				<div id="${param.block}symptom_panel">
					<button class="btn btn-light btn-sm" onclick="selectall('${param.block}symptom_panel');">All</button>
					<button class="btn btn-light btn-sm" onclick="deselect('${param.block}symptom_panel');">None</button><br>
					<select id="${param.block}-symptom-select" multiple="multiple">
						<sql:query var="cases" dataSource="jdbc/N3CPublic">
							select symptom from n3c_dashboard.symptom_map order by symptom_seq;
						</sql:query>
						<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
							<option value="${row.symptom}">${row.symptom}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div>
</div>
