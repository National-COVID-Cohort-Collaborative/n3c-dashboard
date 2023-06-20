<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select age, sex, race, ethnicity, observation, symptom, patient_display, patient_count,
			age_abbrev, age_seq, race_abbrev, race_seq, ethnicity_abbrev, ethnicity_seq, sex_abbrev, sex_seq, observation_seq, symptom_seq
			from (select
					coalesce(age, 'Unknown') as age,
					sex,
					race,
					ethnicity,
					observation,
					symptom,
					patient_count as patient_display,
					case
						when (patient_count = '<20' or patient_count is null) then 0
						else patient_count::int
					end as patient_count
				  from n3c_dashboard_ph.longcov_icd10symptom_csd
				  where observation != 'Does not have U09.9 in Record'
				<c:if test="${not empty param.symptom}">and symptom = '${param.symptom}'</c:if>
		  	) as foo
		  	natural left join n3c_dashboard.age_map_min
		  	natural left join n3c_dashboard.sex_map
		  	natural left join n3c_dashboard.race_map
		  	natural left join n3c_dashboard.eth_map
		  	natural left join n3c_dashboard.observation_map
		  	natural left join n3c_dashboard.symptom_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"age", "label":"Age"},
        {"value":"sex", "label":"Sex"},
        {"value":"race", "label":"Race"},
        {"value":"ethnicity", "label":"Ethnicity"},
        {"value":"observation", "label":"Observation"},
        {"value":"symptom", "label":"Symptom"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"race_abbrev", "label":"dummy3"},
        {"value":"race_seq", "label":"dummy4"},
        {"value":"ethnicity_abbrev", "label":"dummy5"},
        {"value":"ethnicity_seq", "label":"dummy6"},
        {"value":"sex_abbrev", "label":"dummy7"},
        {"value":"sex_seq", "label":"dummy8"},
        {"value":"observation_seq", "label":"dummy9"},
        {"value":"symptom_seq", "label":"dummy10"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
