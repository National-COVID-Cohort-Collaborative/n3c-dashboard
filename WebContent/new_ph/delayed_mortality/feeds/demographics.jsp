<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select *
			from (select
					age_bin,
					gender_concept_name as gender,
					race,
					ethnicity,
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count
				  from n3c_questions.icd10_mortality_demo_grouped
		  	) as foo
		  	natural join n3c_dashboard.age_map4
		  	natural join n3c_dashboard.race_map
		  	natural join n3c_dashboard.ethnicity_map
		  	natural join n3c_dashboard.gender_map2
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"race", "label":"Race"},
        {"value":"age_bin", "label":"Age"},
        {"value":"ethnicity", "label":"Ethnicity"},
        {"value":"gender", "label":"Gender"},
        {"value":"patient_count", "label":"Mortality Count"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"race_abbrev", "label":"dummy3"},
        {"value":"race_seq", "label":"dummy4"},
        {"value":"ethnicity_abbrev", "label":"dummy5"},
        {"value":"ethnicity_seq", "label":"dummy6"},
        {"value":"gender_abbrev", "label":"dummy7"},
        {"value":"gender_seq", "label":"dummy8"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}