<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

 <sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select to_char(sum(num_patients)/1000.0, '999.99')||'k' as patient_count
 	from (select 
			case
				when (num_patients = '<20' or num_patients is null) then 0
				else num_patients::int
			end as num_patients
			from n3c_questions.long_covid_icd_agg_censored) as foo
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">

	<div class="col-12 kpi-main-col">
		<div class="panel-primary kpi">
			<div class="kpi-inner">
				<div class="panel-body">
					<table>
						<tr>
<!-- 							<td><i class="fas fa-users"></i> Patients w/U09.9 in Record</td> -->
							<td>Patients ICD</td>
						</tr>
					</table>
				</div>
				<div class="panel-heading kpi_num"><i class="fas fa-users"></i> <span id="${param.block}_patient_count_kpi">${row.patient_count}</span></div>
			</div>
		</div>
	</div>

</c:forEach>
