<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<div class="accordion" id="${param.block}smokingstatus_accordion">
 		<div class="card">
 			<div class="card-header" id="${param.block}smokingstatus_heading">
				<h2 class="mb-0">
				<button class="filter_drop_button btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#${param.block}smokingstatus_body" aria-expanded="true" aria-controls="${param.block}smokingstatus_body">
  					Smoking Status
 				</button>
				</h2>
			</div>
		</div>
		<div id="${param.block}smokingstatus_body" class="collapse" aria-labelledby="${param.block}smokingstatus_heading" data-parent="#${param.block}smokingstatus_accordion">
			<div class="card-body">
				<div id="${param.block}smokingstatus_panel">
					<button class="btn btn-light btn-sm" onclick="selectall('${param.block}smokingstatus_panel');">All</button>
					<button class="btn btn-light btn-sm" onclick="deselect('${param.block}smokingstatus_panel');">None</button><br>
					<select id="${param.block}-smokingstatus-select" multiple="multiple">
						<option value="Positive">Positive</option>
						<option value="Unknown">Unknown</option>
					</select>
				</div>
			</div>
		</div>
	</div>
</div>
