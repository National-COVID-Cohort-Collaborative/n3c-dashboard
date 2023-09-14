<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:choose>
	<c:when test="${param.block == 'substance_use_1' }">
		<div class="col col-12 col-md-3 my-auto">
			<jsp:include page="../kpis/block3_kpis/enclave_patients.jsp" >
				<jsp:param name="block" value="${param.block}"/>
			</jsp:include>
		</div>
		<div class="col col-12 col-md-3 my-auto">
			<jsp:include page="../kpis/block3_kpis/substance_alcohol_1.jsp">
				<jsp:param name="block" value="${param.block}" />
			</jsp:include>
		</div>		
	</c:when>
	<c:when test="${param.block == 'substance_use_2' }">
		<div class="col col-12 col-md-4 my-auto kpi_border_right">
			<jsp:include page="../kpis/block3_kpis/enclave_patients.jsp" >
				<jsp:param name="block" value="${param.block}"/>
			</jsp:include>
		</div>
		<div class="col col-12 col-md-3 my-auto">
			<jsp:include page="../kpis/block3_kpis/substance_opioid_1.jsp">
				<jsp:param name="block" value="${param.block}" />
			</jsp:include>
		</div>		
	</c:when>
	<c:when test="${param.block == 'substance_use_3' }">
		<div class="col col-12 col-md-4 my-auto kpi_border_right">
			<jsp:include page="../kpis/block3_kpis/enclave_patients.jsp" >
				<jsp:param name="block" value="${param.block}"/>
			</jsp:include>
		</div>
		<div class="col col-12 col-md-3 my-auto">
			<jsp:include page="../kpis/block3_kpis/substance_smoking_1.jsp">
				<jsp:param name="block" value="${param.block}" />
			</jsp:include>
		</div>		
	</c:when>
	<c:when test="${param.block == 'substance_use_7' }">
		<div class="col col-12 col-md-4 my-auto kpi_border_right">
			<jsp:include page="../kpis/block3_kpis/enclave_patients.jsp" >
				<jsp:param name="block" value="${param.block}"/>
			</jsp:include>
		</div>
		<div class="col col-12 col-md-3 my-auto">
			<jsp:include page="../kpis/block3_kpis/substance_all_7.jsp">
				<jsp:param name="block" value="${param.block}" />
			</jsp:include>
		</div>		
	</c:when>
</c:choose>



