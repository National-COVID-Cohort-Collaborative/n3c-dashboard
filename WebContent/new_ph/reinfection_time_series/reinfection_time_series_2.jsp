<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- positive_cases_by_day_cumsum_censored (2022-03-31 05:01) -->

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="reinfection_ts_2" />
	<jsp:param name="block_header" value="Reinfection Time Series" />

	<jsp:param name="kpis" value="reinfection_time_series/kpis_2.jsp" />

	<jsp:param name="simple_panel" value="reinfection_time_series/interval.jsp" />

	<jsp:param name="datatable" value="reinfection_time_series/interval_table.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-interval" />
	<jsp:param name="datatable_feed" value="reinfection_time_series/feeds/interval.jsp" />
</jsp:include>
