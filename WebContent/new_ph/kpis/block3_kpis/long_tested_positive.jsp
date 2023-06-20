<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

 <sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select to_char(sum(count)/1000000.0, '999.99')||'M' as patient_count
 	from (select 
			case
				when (count = '<20' or count is null) then 0
				else count::int
			end as count
			from n3c_dashboard_ph.longcov_icd10sympcounts_csd where observation = 'Tested positive') as foo
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="col-12 kpi-main-col">
		<div class="panel-primary kpi">
			<div class="kpi-inner">
				<div class="panel-body">
					<table>
						<tr>
							<td>Patients w/Symptom(s) & Tested Positive </td>
						</tr>
					</table>
				</div>
				<div class="panel-heading kpi_num"><i class="fas fa-users"></i> <span id="${param.block}_tested_positive_kpi">${row.patient_count}</span></div>
			</div>
		</div>
	</div>
</c:forEach>
