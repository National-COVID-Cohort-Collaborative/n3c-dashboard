<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../kpis/covid_positive.jsp" >
	<jsp:param name="block" value="${param.block}"/>
</jsp:include>
<div class="panel-body border kpi-limit dash-small-txt">">
	* (see limitations below)
</div>
