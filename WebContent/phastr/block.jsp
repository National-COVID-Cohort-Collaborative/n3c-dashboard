<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="dashboard" uri="http://icts.uiowa.edu/N3CDashboardTagLib"%>

<jsp:include page="../resources/dash_style.css" flush="true" />

<style>

#frame .datatable_overflow{
	width: 100%;
	overflow:scroll;
}

@media (max-width: 1200px){
	.container-large {
    	max-width: 100% !important;
	}
}

@media (min-width: 1200px){
	.container-large {
    	max-width: 100%;
	}
}

.block_header{
	text-align:center; 
	color:#fff; 
	background: #454F82;
	font-family: Arial, Helvetica, sans-serif;
	font-size:18px; 
	padding: 3px; 
	margin-top:20px;
}

.kpi tr {
	width: auto;
}

.block_header{
	background:none;
}

.kpi_ind{
	text-align:center;
}

.kpi_section .dropdown-item{
	white-space: unset;
}

#${param.block}_btn_hide{
	position: absolute;
    left: 0px;
    top: 0px;
    transform: rotate(-90deg) translate(-20px, -77px);
    border-radius: 0;
}


#${param.block}_btn_show {
    /* position: absolute; */
    left: 0px;
    top: 0px;
    transform: rotate(-90deg) translate(-24px, 54px);
    border-radius: 0;
}

.drop_filter{
	right: 0;
	left: auto;
	width: max-content;
}

.dash_filter_header{
	margin-right: 30px;
    margin-left: 30px;
}

.show_clear{
	display: inline-block;
}

.no_clear{
	display:none;
}

.show_filt:after{
	border-top: 0.3em solid;
    border-right: 0.3em solid transparent;
    border-bottom: 0;
    border-left: 0.3em solid transparent;
}

.hide_filt:after{
	border-top: 0;
    border-right: 0.3em solid transparent;
    border-bottom: 0.3em solid;
    border-left: 0.3em solid transparent;
}

.viz_options_dropdown{
	text-align: left; 
	font-size: 1.2rem;
}


@media (max-width: 768px) {
  .viz_options_dropdown, 
  .filter_button_container{
    text-align: center;
  }
}

.select2-container--default .select2-results__option--disabled{
	display:none;
}

.dash_viz{
	text-align:center;
}

.kpi_border_right{
	border-right: 2px solid #d0e3f6;
    border-radius: 0;
}

.data-as-of {
    margin-top: 0px;
    font-size: 14px;
    font-weight: 300;
    text-align: center;
    margin-bottom: 0px;
}

@media only screen and (max-width: 991px) {
  #related_dashboards {
    display: none; 
  }
}



/* change in dashboard style when all done */
.multiselect-container .multiselect-all:focus, .multiselect-container .multiselect-all:hover, .multiselect-container .multiselect-group:focus, .multiselect-container .multiselect-group:hover, .multiselect-container .multiselect-option:focus, .multiselect-container .multiselect-option:hover {
    background-color: #edf6ff!important;
}

.multiselect-container .multiselect-all.active:not(.multiselect-active-item-fallback), .multiselect-container .multiselect-all:not(.multiselect-active-item-fallback):active, .multiselect-container .multiselect-group.active:not(.multiselect-active-item-fallback), .multiselect-container .multiselect-group:not(.multiselect-active-item-fallback):active, .multiselect-container .multiselect-option.active:not(.multiselect-active-item-fallback), .multiselect-container .multiselect-option:not(.multiselect-active-item-fallback):active {
    background-color: #edf6ff;
    color: #000;
}

.table-hover tbody tr:hover {
    color: #212529;
    background-color: #edf6ff;
}

.viz-header-section {
    margin-top: 0px;
    margin-bottom: 10px;
}


.panel{
	margin-top: 30px;
}

#d3viz .kpi_section {
    text-align: left;
}

.small-viz-panel{
	padding: 10px;
}

/* filter stuff */
#filter_checks .custom-select{
	height: auto;
}

#filter_checks .btn-group{
	width: 100%;
}

#filter_checks .multiselect{
	overflow: visible;
	white-space: normal;
	word-wrap: break-word;
}

#filter_checks .multiselect-container.dropdown-menu.show{
	width: 100%;
}

#related_dashboards .card{
	cursor: pointer;
}


/* from demographics overview dash */
.filter-section {
    margin-top: 20px;
}


/* test of multiselect to list style */

.multiselect-native-select{
	width: 100%
}
.checkbox-list-container .checkbox-list > li > a {
	display: block;
	padding: 3px 0;
}

.checkbox-list-container .checkbox-list > .multiselect-option.active,
.checkbox-list-container .checkbox-list > .multiselect-option.active:hover,
.checkbox-list-container .checkbox-list > .multiselect-option.active:focus {
	color: #333;
}

.checkbox-list-container .checkbox-list > .multiselect-option.disabled,
.checkbox-list-container .checkbox-list > .multiselect-option.disabled:hover,
.checkbox-list-container .checkbox-list > .multiselect-option.disabled:focus {
	color: #777;
}

.checkbox-list-container .checkbox-list > .multiselect-option.disabled:hover,
.checkbox-list-container .checkbox-list > .multiselect-option.disabled:focus {
	text-decoration: none;
	cursor: unset;
	background-color: transparent;
	background-image: none;
	filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);
}

.checkbox-list-container .multiselect-container.checkbox-list {
	position: static;
}


.filter_drop_button{
	width: 100%;
}

.filter_drop_button:focus{
	box-shadow: none;
}

#filter_checks .filter_drop_button:after {
    content: <i class="towerIcon"></i>;
    content: '\f068';
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
    text-decoration: inherit;
    float: right;
}

#filter_checks .filter_drop_button.collapsed:after {
    content: <i class="towerIcon"></i>;
    content: '\f067';
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
    text-decoration: inherit;
    float: right;
}

#filter_checks .card-header{
	padding: 2px;
}

#filter_checks .panel-body{
	border: 2px solid #eeeeee;
    border-radius: 5px;
}

#filter_checks .card{
	border: 0px;
	background-color: unset;
}

#filter_checks .card-header{
	background-color: unset;
}

#related_dashboards .related-img{
	opacity: .7;
}

#related_dashboards .card-title{
	color: #686767;
}

#related_dashboards .card-body{
	padding: 10px;
}

#related_dashboards .card{
	border: 0px;
	box-shadow: 4px 4px 15px -2px rgb(197 222 255);
    -webkit-box-shadow: 4px 4px 15px -2px rgb(197 222 255);
    -moz-box-shadow: 4px 4px 15px -2px rgba(197,222,255,1);
}

.side-col h4{
	font-weight: 300;
}

@media only screen and (max-width: 1400px) {
	.side-col .card-body{
		padding: 0px;
	}
}

.loading{
	text-align:center;
}



</style>

<jsp:include page="../resources/dash_style.css" flush="true" />

<!-- A block is comprised of a header bar, an optional left column with KPIs and filters, and a main panel
	 that supports a set of optional sub-panels -->

<div class="row stats block2 mx-auto">
	<div class="col-12">
	
		
<!-- KPIs & related dashboards ----------------------------------------------------------------------------------------------------------- -->	
		<div class="row" style="margin-top: 30px;">
			<div class="col col-12 col-lg-2 side-col">
						
				<jsp:include page="../meta/relatedDashboardsByID.jsp?did=${param.did}"/>
				
			</div>
			
			<div class="col col-12 col-lg-10">
	
	<!-- Panels ------------------------------------------------------------------------------------------------- -->		
				<div id="${param.block}-panel" class="col-12 col-md-12 mx-auto mb-4 panel" >

					<!-- Long Title -->
					<c:if test="${not empty param.long_title}">
						<div class="col-12"> 
							<jsp:include page="${param.long_title}"/>
						</div>
					</c:if>
					
					<!-- Short Desc -->
					<c:if test="${not empty param.short_desc}">
						<div class="col-12"> 
							<jsp:include page="${param.short_desc}"/>
						</div>
					</c:if>

					<!-- Floating Legend -->
					<c:if test="${not empty param.floating_legend}">
						<div class="col-12"> 
							<div id="${param.block}legend"></div>
						</div>
					</c:if>
					
					<c:if test="${not empty param.viz_panel}">
						<div id="${param.viz_panel}" class="" style="display: block;">
						</div>
					</c:if>
					
					<c:if test="${not empty param.simple_panel}">
						<div id="${param.block}-simple" class="" style="display: block;">
							<jsp:include page="${param.simple_panel}"/>
						</div>
					</c:if>
					
					<div class="row">
						<c:if test="${not empty param.topic_description}">
							<div id="viz_caption">
								<jsp:include page="${param.folder}/secondary_text/${param.topic_description}.jsp"/>
							</div>
						</c:if>
					</div>
					

					<div class="row" id="question-limits">
						<sql:query var="questions" dataSource="jdbc/N3CPublic">
							select limitations from n3c_dashboard.dashboard where did = ${param.did}
							</sql:query>
						<c:forEach items="${questions.rows}" var="row" varStatus="rowCounter">
							<div id="limitations-section" class="col col-12">
								<div class="accordion limitations_drop" id="limitations_drop">
									<div class="card">
										<a Title="expand/collapse limitations section" href="" class="accordion-toggle" data-toggle="collapse" data-target="#limitcollapseOne" aria-expanded="false" aria-controls="collapseOne">
											<div class="card-header" id="limitheadingOne">
												<h4 class="mb-0"><span class="accordion_text">Details & Limitations</span>
													<span style="display:inline; float:right;" class="btn btn-link btn-block text-left collapsed icon-btn p-0 accordion-toggle"></span>
												</h4>
											</div>
										</a>
										<div id="limitcollapseOne" class="collapse" aria-labelledby="limitheadingOne" data-parent="#limitations_drop">
											<div class="card-body">
												${row.limitations}
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
	
				</div>
			</div>
		</div>
	</div>
</div>			

