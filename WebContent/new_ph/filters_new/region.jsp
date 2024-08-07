<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<div class="accordion" id="${param.block}region_accordion">
 		<div class="card">
 			<div class="card-header" id="${param.block}region_heading">
				<h2 class="mb-0">
				<button class="filter_drop_button btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#${param.block}region_body" aria-expanded="true" aria-controls="${param.block}region_body">
  					Region
 				</button>
				</h2>
			</div>
		</div>
		<div id="${param.block}region_body" class="collapse" aria-labelledby="${param.block}region_heading" data-parent="#${param.block}region_accordion">
			<div class="card-body">
				<div id="${param.block}region_panel">
					<button class="btn btn-light btn-sm" onclick="selectall('${param.block}region_panel');">All</button>
					<button class="btn btn-light btn-sm" onclick="deselect('${param.block}region_panel');">None</button><br>
					<select id="${param.block}-region-select" multiple="multiple">
						<sql:query var="cases" dataSource="jdbc/N3CPublic">
							select distinct(division_name) as division from n3c_dashboard.state_map order by division_name;
						</sql:query>
						<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
							<option value="${row.division}">${row.division}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div>
</div>

