<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<script>

function ${param.block}_constrain_table(filter, constraint) {
	var table = $('#${param.target_div}-table').DataTable();
	
	switch (filter) {
	case 'age':
	    table.column(1).search(constraint, true, false, true).draw();	
		break;
	case 'sex':
	    table.column(2).search(constraint, true, false, true).draw();	
		break;
	}
	
	var kpis = '${param.target_kpis}'.split(',');
	for (var a in kpis) {
		${param.block}_updateKPI(table, kpis[a])
	}
	
	var kpis2 = '${param.target_kpis2}'.split(',');
	for (var a in kpis2) {
		${param.block}_updateKPI2(table, kpis2[a])
	}
	
	
}

function ${param.block}_updateKPI(table, column) {
	var sum_string = '';
	var data_total = table.rows({search:'applied'}).data();
	var filtered = data_total.filter(function (el) {
		  return el.observation == "Has Disease";
		});
	
	var sum = filtered.pluck(column).sum();
	
	if (sum < 1000) {
		sumString = sum+'';
	} else if (sum < 1000000) {
		sum = sum / 1000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "k"
	} else {
		sum = sum / 1000000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "M"
		
	}
	document.getElementById('${param.block}'+'_'+column+'_kpi').innerHTML = sumString
}

function ${param.block}_updateKPI2(table, column) {
	var sum_string = '';
	var data_total = table.rows({search:'applied'}).data();
	var filtered = data_total.filter(function (el) {
		  return el.observation == "Has Disease";
		});
	
	var peds = filtered.filter(function (el) {
		  return el.age == "<18";
		});
	
	var sum = peds.pluck('patient_count').sum();
	
	if (sum < 1000) {
		sumString = sum+'';
	} else if (sum < 1000000) {
		sum = sum / 1000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "k"
	} else {
		sum = sum / 1000000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "M"
		
	}
	// console.log('${param.block}'+'_'+column+'_kpi');
	document.getElementById('${param.block}'+'_'+column+'_kpi').innerHTML = sumString
}



jQuery.fn.dataTable.Api.register( 'sum()', function ( ) {
	return this.flatten().reduce( function ( a, b ) {
		if ( typeof a === 'string' ) {
			a = a.replace(/[^\d.-]/g, '') * 1;
		}
		if ( typeof b === 'string' ) {
			b = b.replace(/[^\d.-]/g, '') * 1;
		}

		return a + b;
	}, 0 );
} );

var ${param.block}_datatable = null;

$.getJSON("<util:applicationRoot/>/new_ph/${param.feed}", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover compact site-wrapper';
	table.style.width = '100%';
	table.id="${param.target_div}-table";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:14px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("${param.target_div}");
	divContainer.appendChild(table);

	var data = json['rows'];

	${param.block}_datatable = $('#${param.target_div}-table').DataTable( {
    	data: data,
    	dom: 'lfr<"datatable_overflow"t>Bip',
    	buttons: {
    	    dom: {
    	      button: {
    	        tag: 'button',
    	        className: ''
    	      }
    	    },
    	    buttons: [{
    	      extend: 'csv',
    	      className: 'btn btn-sm btn-light',
    	      exportOptions: {
                  columns: ':visible'
              },
    	      titleAttr: 'CSV export.',
    	      text: 'CSV',
    	      filename: 'diseases',
    	      extension: '.csv'
    	    }, {
    	      extend: 'copy',
    	      className: 'btn btn-sm btn-light',
    	      exportOptions: {
                  columns: ':visible'
              },
    	      titleAttr: 'Copy table data.',
    	      text: 'Copy'
    	    }]
    	},

       	paging: true,
       	snapshot: null,
    	initComplete: function( settings, json ) {
       	 	settings.oInit.snapshot = $('#${param.target_div}-table').DataTable().rows({order: 'index'}).data().toArray().toString();
       	 	setTimeout(function() {jQuery('.loading').fadeOut(100); ${param.block}_refreshHistograms(); }, 500);
       	  },
    	pageLength: 10,
    	lengthMenu: [ 10, 25, 50, 75, 100 ],
    	order: [[9, 'asc']],
     	columns: [
        	{ data: 'observation', visible: true, orderable: true },
        	{ data: 'age', visible: true, orderable: true },
        	{ data: 'sex', visible: true, orderable: true },
        	{ data: 'patient_display', visible: true, orderable: true, orderData: [3] },
        	{ data: 'patient_count', visible: false },
        	{ data: 'age_abbrev', visible: false },
        	{ data: 'age_seq', visible: false },
        	{ data: 'sex_abbrev', visible: false },
        	{ data: 'sex_seq', visible: false },
        	{ data: 'observation_abbrev', visible: false },
        	{ data: 'observation_seq', visible: false }
    	]
	} );

	// table search logic that distinguishes sort/filter 
	${param.block}_datatable.on( 'search.dt', function () {
		var snapshot = ${param.block}_datatable
	     .rows({ search: 'applied', order: 'index'})
	     .data()
	     .toArray()
	     .toString();

	  	var currentSnapshot = ${param.block}_datatable.settings().init().snapshot;

	  	if (currentSnapshot != snapshot) {
	  		${param.block}_refreshHistograms();
			${param.block}_constrain_table();
	  		${param.block}_datatable.settings().init().snapshot = snapshot;
	   		$('#${param.block}_btn_clear').removeClass("no_clear");
	   		$('#${param.block}_btn_clear').addClass("show_clear");
	  	}
	} );
	
});

</script>
