<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

 <sql:query var="totals" dataSource="jdbc/N3CPublic">
  	select 
  	to_char(
  		sum(
			case
				when (patient_count = '<20') then 0
				else patient_count::int
			end
		)/1000.0, '999.99')||'k'
	as count
  	from n3c_dashboard_ph.rein_30days_csd
  	where test_date_diff_range not in ('0-15','15-30');
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="col-12 kpi-main-col">
		<div class="panel-primary kpi">
			<div class="kpi-inner">
				<div class="panel-body">
					<table>
						<tr>
							<td>Number of Patients</td>
						</tr>
					</table>
				</div>
				<div class="panel-heading kpi_num"><i class="fas fa-users"></i> <span id="${param.block}_reinfected_kpi">${row.count}</span></div>
			</div>
		</div>
	</div>
</c:forEach>
