<style>
chart {
	font: 10px sans-serif;
}

.arc path {
	stroke-width: 1px;
	stroke: #fff;
}
</style>

<script>

function localPieChart_new(data, properties) {
	var width = 325, //var width = parseInt(d3.select("${param.dom_element}").style("width"))-10,
		height = width,
		border = 10,
		full_width = 325;
	
	
	var original = d3.select(properties.domName).node();
	var newnode = original.cloneNode();
    original.parentNode.replaceChild(newnode, original);
	
	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select(properties.domName).select("svg").remove();
				//console.log('${param.dom_element} width '+newWidth);
				width = newWidth/2;
				height = newWidth/1.9;
				full_width = newWidth;
				draw_pie();
			}
		});
	});
	myObserver.observe(d3.select(properties.domName).node());

	draw_pie();

	function draw_pie() {
		
		var formatComma = d3.format(",");
		var radius = Math.min(width - border, height - border) / 2;

		var arc = d3.arc()
			.outerRadius(radius * 0.8)
			.innerRadius(radius * 0.5)
			.padAngle(0.02)
            .cornerRadius(8);
		
		var outerArc = d3.arc()
		  .innerRadius(radius * 0.85)
		  .outerRadius(radius * 0.85)

		var pie = d3.pie()
			.sort(null)
			.value(function(d) { return d.count; });
		
		var pieData = pie(data);

		var svg = d3.select(properties.domName).append("svg")
			.attr("width", full_width)
			.attr("height", height)
			.append("g")
			.attr("transform", "translate(" + full_width / 2 + "," + ((height / 1.7)) + ")");

		data.forEach(function(d) {
			d.count = +d.count;
		});

		var g = svg.selectAll(".arc")
			.data(pieData)
			.enter().append("g")
			.attr("class", "arc");
		
		var enteringLabels = svg.selectAll('.label').data(pieData).enter();
		var labelGroups = enteringLabels.append('g').attr('class', 'label');

		var lines = labelGroups.append('line')
			.attr("x1", function(d, i) {return arc.centroid(d)[0];})
			.attr("y1", function(d) {return arc.centroid(d)[1];})
			.attr("x2", function(d) {
		    	var centroid = arc.centroid(d),
		        midAngle = Math.atan2(centroid[1], centroid[0]);
		    	return Math.cos(midAngle) * (radius * 0.9);
		  	})
		  	.attr("y2", function(d) {
			    var centroid = arc.centroid(d),
			      midAngle = Math.atan2(centroid[1], centroid[0]);
			    return Math.sin(midAngle) * (radius * 0.9);
		  	})
		  	.attr("class", 'label-line')
		  	.attr("stroke", 'black');

		var textLabels = labelGroups.append('text')
			.attr("x", function(d, i) {
				var centroid = arc.centroid(d),
				midAngle = Math.atan2(centroid[1], centroid[0]),
				x = Math.cos(midAngle) * (radius * 0.9),
				sign = x > 0? 1: -1;
				return x + (5*sign);
		    })
			.attr("y", function(d, i) {
				var centroid = arc.centroid(d),
				midAngle = Math.atan2(centroid[1], centroid[0]),
				y = Math.sin(midAngle) * (radius * 0.9);
				return y;
		    })
			.attr("text-anchor", function(d, i) {
				var centroid = arc.centroid(d),
				midAngle = Math.atan2(centroid[1], centroid[0]),
				x = Math.cos(midAngle) * (radius * 0.9);
				return x > 0? 'start' : 'end';
			})
			.attr("class", 'label-text')
			.text(function(d){
				var total = d3.sum(data.map(function(d) {
					return d.count;
				}));

				var percent = Math.round(1000 * d.data.count / total) / 10;
				return d.data.abbrev + " (" + percent + "%)";
			});
		
		// relax the label!
		var alpha = 0.5,
		    spacing = 15;

		function relax() {
			var again = false;
			textLabels.each(function(d, i) {
				var a = this,
					da = d3.select(a),
					y1 = da.attr('y');
				textLabels.each(function(d, j) {
					var b = this;
					if (a === b) {
						return ;
					}
					db = d3.select(b);
					if (da.attr('text-anchor') !== db.attr('text-anchor')) {
						return ;
					}
					var y2 = db.attr('y');
					var deltaY = y1 - y2;
					if (Math.abs(deltaY) > spacing) {
						return ;
					}
					again = true;
					sign = deltaY > 0? 1: -1;
					var adjust = sign * alpha;
					da.attr('y', +y1 + adjust);
					db.attr('y', +y2 - adjust);
				});
			});
		  
			if (again) {
				var labelElements = textLabels['_groups'][0];
				lines.attr('y2', function(d, i) {
					var labelForLine = d3.select(labelElements[i]);
					return labelForLine.attr('y');
				});
				setTimeout(relax, 20);
			};
		};

		relax();
		

		var path = g.append("path")
			.attr("d", arc)
			.style("fill", function(d) { return properties.colorscale[d.data.seq-1]; })
			.on("click", function(d, i){
				d3.selectAll(".tooltip").remove(); 
				var format = {};
				format['secondary_name'] = d.data.element;
				window[properties.domName.replace(/_[^_]+_[^_]+$/i,'_').replace('#', '')+'viz_constrain'](format, properties.legend_label.replace(/\s/g, "")); 
			})
			.on("mouseout", function() {
 				 d3.selectAll(".tooltip").remove(); 
 				 d3.selectAll("path").attr("transform", "scale(1)");
			})
			.on("mouseover", function(d){
				d3.select(this).attr("transform", "scale(1.05)");
			})
			.on('mousemove', function(d, i){
				var total = d3.sum(data.map(function(d) {
	 				return d.count;
	 			}));
				var percent = Math.round(1000 * d.data.count / total) / 10;
				
 				d3.selectAll(".tooltip").remove(); 
				d3.select("body").append("div")
					.attr("class", "composite tooltip")
					.style("left", (d3.event.pageX + 5) + "px")
					.style("top", (d3.event.pageY - 28) + "px")
					.html("<strong>" + d.data.element + "</strong><br><strong>% of View: </strong>" + percent + "%<br><strong>Count: </strong>" + d.data.count.toLocaleString());
			});
	}
}

</script>