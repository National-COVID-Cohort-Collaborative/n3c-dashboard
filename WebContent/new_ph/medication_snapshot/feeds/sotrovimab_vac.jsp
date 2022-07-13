<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select vaccinated, severity_abbrev as severity, patient_display, patient_count,
				severity_abbrev, severity_seq, vaccinated_abbrev, vaccinated_seq
			from (select
					severity_type as severity,
					COALESCE (vaccinated, 'Unknown') as vaccinated,
					count as patient_display,
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count
				  from n3c_questions.sotrovimab_vax_status
		  	) as foo
		  	natural join n3c_dashboard.severity_map
		  	natural join n3c_dashboard.vaccinated_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"vaccinated", "label":"Vaccination Status"},
        {"value":"severity", "label":"Severity"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"severity_abbrev", "label":"dummy1"},
        {"value":"severity_seq", "label":"dummy2"},
        {"value":"vaccinated_abbrev", "label":"dummy3"},
        {"value":"vaccinated_seq", "label":"dummy4"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}