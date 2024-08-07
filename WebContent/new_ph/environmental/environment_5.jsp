<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block3.jsp">
	<jsp:param name="block" value="environment_5" />
	<jsp:param name="block_header" value="Number of Impacted Patients By Environmental Factor and Mortality Status" />
	<jsp:param name="folder" value="environmental" />
	<jsp:param name="topic_description" value="secondary_5" />
	<jsp:param name="did" value="${param.did}" />

	<jsp:param name="kpis" value="environmental/kpis.jsp" />
	
	<jsp:param name="simple_panel" value="environmental/compare.jsp" />
	
	<jsp:param name="datatable" value="environmental/tables/compare_table.jsp" />
	<jsp:param name="datatable_div" value="environmental_environment_5" />
	<jsp:param name="datatable_feed" value="environmental/feeds/compare.jsp" />

</jsp:include>
