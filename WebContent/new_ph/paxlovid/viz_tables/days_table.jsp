<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<script>


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
    	dom: 'lr<"datatable_overflow"t>Bip',
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
    	      titleAttr: 'CSV export.',
    	      exportOptions: {
                  columns: ':visible'
              },
    	      text: 'CSV',
    	      filename: 'paxlovid_visits',
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
       	 	setTimeout(function() {jQuery('.loading').fadeOut(100); ${param.block}_refreshHistograms();}, 500);
       	  },
    	pageLength: 10,
    	lengthMenu: [ 10, 25, 50, 75, 100 ],
    	order: [[0, 'asc']],
     	columns: [
        	{ data: 'days', visible: true, orderable: true },
        	{ data: 'patient_display', visible: true, orderable: true, orderData: [2] },
        	{ data: 'patient_count', visible: false},
        	{ data: 'days_abbrev', visible: false },
        	{ data: 'days_seq', visible: false }
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
	  		${param.block}_datatable.settings().init().snapshot = snapshot;
	  		${param.block}_refreshHistograms();
			${param.block}_constrain_table();
	   		$('#${param.block}_btn_clear').removeClass("no_clear");
	   		$('#${param.block}_btn_clear').addClass("show_clear");
	  	}
	} );
});

</script>
