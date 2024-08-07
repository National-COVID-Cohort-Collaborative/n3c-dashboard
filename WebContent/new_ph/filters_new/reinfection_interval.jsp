<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<div class="accordion" id="${param.block}intervalbin_accordion">
			<div class="card">
				<div class="card-header" id="${param.block}intervalbin_heading">
				<h2 class="mb-0">
				<button class="filter_drop_button btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#${param.block}intervalbin_body" aria-expanded="true" aria-controls="${param.block}intervalbin_body">
	 					Days to Reinfection
					</button>
				</h2>
			</div>
		</div>
		<div id="${param.block}intervalbin_body" class="collapse" aria-labelledby="${param.block}intervalbin_heading" data-parent="#${param.block}intervalbin_accordion">
			<div class="card-body">
				<div id="${param.block}intervalbin_panel">
					<button class="btn btn-light btn-sm" onclick="selectall('${param.block}intervalbin_panel');">All</button>
					<button class="btn btn-light btn-sm" onclick="deselect('${param.block}intervalbin_panel');">None</button><br>
					<select id="${param.block}-intervalbin-select" multiple="multiple">
						<sql:query var="cases" dataSource="jdbc/N3CPublic">
							select distinct
							((interval / 30) * 30)||' to '||((interval / 30 + 1) * 30) as interval_bin,
							interval / 30 as interval_bin_seq
					from (select
					 	distinct((subsequent_month||'/'||'01/'||subsequent_year)::date - (initial_month||'/'||'01/'||initial_year)::date) as interval
					 	from n3c_dashboard_ph.reints_alltstsmonth_csd
					) as bar order by interval_bin_seq
						</sql:query>
						<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
							<option value="${row.interval_bin}">${row.interval_bin}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div>
</div>