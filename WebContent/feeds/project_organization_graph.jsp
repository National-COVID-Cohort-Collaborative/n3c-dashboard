<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<graph:graph>
    <sql:query var="projects" dataSource="jdbc/N3CPublic" >
        select uid,title,research_statement,count
        from n3c_collaboration.organization_project;
     </sql:query>
    <c:forEach items="${projects.rows}" var="row">
    	<c:set var="title" value="${row.title}"/>
    	<c:set var="pitch" value="${row.research_statement}"/>
        <graph:node uri="${row.uid}" label="${row.title}" group="0" score="${row.count}" auxString="N3C"/>
    </c:forEach>
		
    <sql:query var="persons" dataSource="jdbc/N3CPublic" >
        select
        	ror_id,
        	ror_name,
        	org_type,
        	case
        		when org_type = 'CTSA' then 1
        		when org_type = 'CTR' then 2
        		when org_type = 'GOV' then 3
        		when org_type = 'COM' then 4
        		when org_type = 'UNAFFILIATED' then 5
        		when org_type = 'REGIONAL' then 6
        	end as group,
        	investigator_count as count
        from n3c_collaboration.organization_organization;
    </sql:query>
    <c:forEach items="${persons.rows}" var="row">
        <graph:node uri="${row.ror_id}" label="${row.ror_name}" group="${row.group}" score="${row.count}" auxString="${row.org_type}"/>
    </c:forEach>

    <sql:query var="edges" dataSource="jdbc/N3CPublic">
         select ror_id,project_uid,count from n3c_collaboration.organization_edge;
    </sql:query>
    <c:forEach items="${edges.rows}" var="row" varStatus="rowCounter">
        <graph:edge source="${row.ror_id}" target="${row.project_uid}"  weight="${row.count}" />
    </c:forEach>

	{
	  "nodes":[
		<graph:foreachNode > 
			<graph:node>
			    {"url":"<graph:nodeUri/>","image_link":"<graph:nodeAuxString/>","name":"<graph:nodeLabel/>","group":"<graph:nodeAuxString/>","score":<graph:nodeScore/>}<c:if test="${ ! isLastNode }">,</c:if>
			</graph:node>
		</graph:foreachNode>
		],
	  "links":[
	  	<graph:foreachEdge>
	  		<graph:edge>
			    {"source":<graph:edgeSource/>,"target":<graph:edgeTarget/>,"value":<graph:edgeWeight/>}<c:if test="${ ! isLastEdge }">,</c:if>
	  		</graph:edge>
	  	</graph:foreachEdge>
	  ],
	  "sites":[
			{"id":"N3C", "label":"N3C Project"},
			{"id":"CTSA", "label":"CTSA"},
			{"id":"CTR", "label":"CTR"},
			{"id":"GOV", "label":"GOV"},
			{"id":"COM", "label":"COM"},
			{"id":"UNAFFILIATED", "label":"Unaffiliated"},
			{"id":"REGIONAL", "label":"Regional"}
		]
	}
	
	
</graph:graph>
