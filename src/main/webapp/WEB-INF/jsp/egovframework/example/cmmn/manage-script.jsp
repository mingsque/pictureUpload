<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- Javascript files -->
		<!-- jQuery -->
		<script src="/js/jquery.js"></script>
		<!-- Bootstrap JS -->
		<script src="/js/bootstrap.min.js"></script>
		<!-- jQuery UI -->
		<script src="/js/jquery-ui.min.js"></script> 
		<!-- jQuery Flot -->
		<script src="/js/excanvas.min.js"></script>
		<script src="/js/jquery.flot.js"></script>
		<script src="/js/jquery.flot.resize.js"></script>
		<script src="/js/jquery.flot.pie.js"></script>
		<script src="/js/jquery.flot.stack.js"></script>
		<!-- Sparklines -->
		<script src="/js/sparklines.js"></script> 
		<!-- jQuery Gritter -->
		<script src="/js/jquery.gritter.min.js"></script>
		<!-- Respond JS for IE8 -->
		<script src="/js/respond.min.js"></script>
		<!-- HTML5 Support for IE -->
		<script src="/js/html5shiv.js"></script>
		<!-- Custom JS -->
		<script src="/js/custom.js"></script>
		
		<!-- Script for this page -->
		<script src="/js/sparkline-index.js"></script>
		
		<!-- Full Google Calendar - Calendar -->
		<script src="/js/moment.min.js"></script>
		<script src="/js/fullcalendar.min.js"></script> 
		
		<!-- RateIt - Star rating -->
		<script src="/js/jquery.rateit.min.js"></script>

		<!-- Date picker -->
		<script src="/js/bootstrap-datetimepicker.min.js"></script> 
		<!-- Bootstrap Toggle -->
		<script src="/js/bootstrap-switch.min.js"></script> 
		
		
	<link href="/summernote/summernote.css" rel="stylesheet">
	<script src="/summernote/summernote.js"></script>
	<!-- summer note korean language pack -->
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
		<script type="text/javascript">
		  $(function() {
		    $('.summernote').summernote({
		      height: 300,          // 기본 높이값
		      minHeight: null,      // 최소 높이값(null은 제한 없음)
		      maxHeight: null,      // 최대 높이값(null은 제한 없음)
		      focus: true,          // 페이지가 열릴때 포커스를 지정함
		      lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
		    });
		  });
		</script>
		<script type="text/javascript">
		if($("#bar-chart").length > 0){
			$(function () {
			
				/* Bar Chart starts */
	
				var d1 = [];
				for (var i = 0; i <= 30; i += 1)
					d1.push([i, parseInt(Math.random() * 30)]);
	
				var d2 = [];
				for (var i = 0; i <= 30; i += 1)
					d2.push([i, parseInt(Math.random() * 30)]);
	
	
				var stack = 0, bars = true, lines = false, steps = false;
				
				function plotWithOptions() {
					$.plot($("#bar-chart"), [ d1, d2 ], {
						series: {
							stack: stack,
							lines: { show: lines, fill: true, steps: steps },
							bars: { show: bars, barWidth: 0.8 }
						},
						grid: {
							borderWidth: 0, hoverable: true, color: "#777"
						},
						colors: ["#52b9e9", "#0aa4eb"],
						bars: {
							  show: true,
							  lineWidth: 0,
							  fill: true,
							  fillColor: { colors: [ { opacity: 0.9 }, { opacity: 0.8 } ] }
						}
					});
				}
	
				plotWithOptions();
				
				$(".stackControls input").click(function (e) {
					e.preventDefault();
					stack = $(this).val() == "With stacking" ? true : null;
					plotWithOptions();
				});
				$(".graphControls input").click(function (e) {
					e.preventDefault();
					bars = $(this).val().indexOf("Bars") != -1;
					lines = $(this).val().indexOf("Lines") != -1;
					steps = $(this).val().indexOf("steps") != -1;
					plotWithOptions();
				});
	
				/* Bar chart ends */
	
			});
	
	
			/* Curve chart starts */
	
			$(function () {
				var sin = [], cos = [];
				for (var i = 0; i < 14; i += 0.5) {
					sin.push([i, Math.sin(i)]);
					cos.push([i, Math.cos(i)]);
				}
	
				var plot = $.plot($("#curve-chart"),
					   [ { data: sin, label: "sin(x)"}, { data: cos, label: "cos(x)" } ], {
						   series: {
							   lines: { show: true, 
										fill: true,
										fillColor: {
										  colors: [{
											opacity: 0.05
										  }, {
											opacity: 0.01
										  }]
									  }
							  },
							   points: { show: true }
						   },
						   grid: { hoverable: true, clickable: true, borderWidth:0 },
						   yaxis: { min: -1.2, max: 1.2 },
						   colors: ["#fa3031", "#43c83c"]
						 });
	
	
				function showTooltip(x, y, contents) {
					$('<div id="tooltip">' + contents + '</div>').css( {
						position: 'absolute',
						display: 'none',
						top: y + 5,
						width: 100,
						left: x + 5,
						border: '1px solid #000',
						padding: '2px 8px',
						color: '#ccc',
						'background-color': '#000',
						opacity: 0.9
					}).appendTo("body").fadeIn(200);
				}
	
				var previousPoint = null;
				$("#curve-chart").bind("plothover", function (event, pos, item) {
					$("#x").text(pos.x.toFixed(2));
					$("#y").text(pos.y.toFixed(2));
	
						if (item) {
							if (previousPoint != item.dataIndex) {
								previousPoint = item.dataIndex;
								
								$("#tooltip").remove();
								var x = item.datapoint[0].toFixed(2),
									y = item.datapoint[1].toFixed(2);
								
								showTooltip(item.pageX, item.pageY, item.series.label + " of " + x + " = " + y);
							}
						}
						else {
							$("#tooltip").remove();
							previousPoint = null;            
						}
				}); 
	
				$("#curve-chart").bind("plotclick", function (event, pos, item) {
					if (item) {
						$("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
						plot.highlight(item.series, item.datapoint);
					}
				});
	
			});
		}
		/* Curve chart ends */
		</script>
		<script>
			/* Calendar */
			$(document).ready(function() {
			  
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				
				$('#calendar').fullCalendar({
				  header: {
					left: 'prev',
					center: 'title',
					right: 'month,agendaWeek,agendaDay,next'
				  },
				  editable: true,
				  events: [
					{
					  title: 'All Day Event',
					  start: new Date(y, m, 1)
					},
					{
					  title: 'Long Event',
					  start: new Date(y, m, d-5),
					  end: new Date(y, m, d-2)
					},
					{
					  id: 999,
					  title: 'Repeating Event',
					  start: new Date(y, m, d-3, 16, 0),
					  allDay: false
					},
					{
					  id: 999,
					  title: 'Repeating Event',
					  start: new Date(y, m, d+4, 16, 0),
					  allDay: false
					},
					{
					  title: 'Meeting',
					  start: new Date(y, m, d, 10, 30),
					  allDay: false
					},
					{
					  title: 'Lunch',
					  start: new Date(y, m, d, 12, 0),
					  end: new Date(y, m, d, 14, 0),
					  allDay: false
					},
					{
					  title: 'Birthday Party',
					  start: new Date(y, m, d+1, 19, 0),
					  end: new Date(y, m, d+1, 22, 30),
					  allDay: false
					},
					{
					  title: 'Click for Google',
					  start: new Date(y, m, 28),
					  end: new Date(y, m, 29),
					  url: 'http://google.com/'
					}
				  ]
				});
			});
			

			/* Realtime chart starts */
			if($("#live-chart").length > 0){
			$(function () {
			    // we use an inline data source in the example, usually data would
			    // be fetched from a server
			    var data = [], totalPoints = 300;
			    function getRandomData() {
			        if (data.length > 0)
			            data = data.slice(1);

			        // do a random walk
			        while (data.length < totalPoints) {
			            var prev = data.length > 0 ? data[data.length - 1] : 50;
			            var y = prev + Math.random() * 10 - 5;
			            if (y < 10)
			                y = 10;
			            if (y > 70)
			                y = 70;
			            data.push(y);
			        }

			        // zip the generated y values with the x values
			        var res = [];
			        for (var i = 0; i < data.length; ++i)
			            res.push([i, data[i]])
			        return res;
			    }

			    // setup control widget
			    var updateInterval = 300;
			    $("#updateInterval").val(updateInterval).change(function () {
			        var v = $(this).val();
			        if (v && !isNaN(+v)) {
			            updateInterval = +v;
			            if (updateInterval < 1)
			                updateInterval = 1;
			            if (updateInterval > 2000)
			                updateInterval = 2000;
			            $(this).val("" + updateInterval);
			        }
			    });

			    // setup plot
			    var options = {
			        series: { shadowSize: 0 }, // drawing is faster without shadows
			        lines: {fill: true},
			        grid: {borderWidth:0 },
			        yaxis: { min: 0, max: 100 },
			        colors: ["#ff2424"]
			    };
			    var plot = $.plot($("#live-chart"), [ getRandomData() ], options);

			    function update() {
			        plot.setData([ getRandomData() ]);
			        // since the axes don't change, we don't need to call plot.setupGrid()
			        plot.draw();
			        
			        setTimeout(update, updateInterval);
			    }

			    update();
			});
			}
			/* Realtime charts ends */

			/* Pie chart starts */
			if($("#pie-chart").length > 0){
			$(function () {

			    var data = [];
			    var series = Math.floor(Math.random()*10)+1;
			    for( var i = 0; i<series; i++)
			    {
			        data[i] = { label: "Series"+(i+1), data: Math.floor(Math.random()*100)+1 }
			    }

			    $.plot($("#pie-chart"), data,
			    {
			        series: {
			            pie: {
			                show: true,
			                radius: 1,
			                label: {
			                    show: true,
			                    radius: 3/4,
			                    formatter: function(label, series){
			                        return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'+label+'<br/>'+Math.round(series.percent)+'%</div>';
			                    },
			                    background: { opacity: 0 }
			                }
			            }
			        },
			        grid: {hoverable: true},
			        legend: {
			            show: false
			        }
			    }); 

			    $.plot($("#pie-chart2"), data,
			    {
			        series: {
			            pie: {
			                show: true
			            }
			        },
			        grid: {hoverable: true}
			    });


			    $.plot($("#pie-chart3"), data,
			    {
			        series: {
			            pie: {
			                show: true
			            }
			        },
			        grid: {hoverable: true},
			        legend: {
			            show: false
			        }
			    });   

			/* Pie chart ends */

			});

			}
			
			/* Bootstrap Switch */
			$(".make-switch input").bootstrapSwitch();
			
			/* *************************************** */
			
			/* Date picker */
			$(function() {
				$('#datetimepicker1').datetimepicker({
				  pickTime: false
				});
			});
			$(function() {
				$('#datetimepicker2').datetimepicker({
				  pickDate: false
				});
			});
			
			/* *************************************** */
			
			/* jQuery Notification (Gritter) */

			$(document).ready(function(){
			  
			  /* On click notification. Refer ui.html file */

			  /* Regulat notification */
			  $(".notify").click(function(e){

						e.preventDefault();
						var unique_id = $.gritter.add({
							// (string | mandatory) the heading of the notification
							title: 'Howdy! User',
							// (string | mandatory) the text inside the notification
							text: 'Today you got some messages and new members. Please check it out!',
							// (string | optional) the image to display on the left
							image: './img/user.jpg',
							// (bool | optional) if you want it to fade out on its own or just sit there
							sticky: false,
							// (int | optional) the time you want it to be alive for before fading out
							time: '',
							// (string | optional) the class name you want to apply to that specific message
							class_name: 'gritter-custom'
						});

						// You can have it return a unique id, this can be used to manually remove it later using
						setTimeout(function () {
							$.gritter.remove(unique_id, {
								fade: true,
								speed: 'slow'
							});
						}, 6000);

			  });

			  /* Sticky notification */
			  $(".notify-sticky").click(function(e){

						e.preventDefault();
						var unique_id = $.gritter.add({
							// (string | mandatory) the heading of the notification
							title: 'Howdy! User',
							// (string | mandatory) the text inside the notification
							text: 'Today you got some messages and new members. Please check it out!',
							// (string | optional) the image to display on the left
							image: './img/user.jpg',
							// (bool | optional) if you want it to fade out on its own or just sit there
							sticky: false,
							// (int | optional) the time you want it to be alive for before fading out
							time: '',
							// (string | optional) the class name you want to apply to that specific message
							class_name: 'gritter-custom'
						});

			  });

			  /* Without image notification */
			  $(".notify-without-image").click(function(e){

						e.preventDefault();
						var unique_id = $.gritter.add({
							// (string | mandatory) the heading of the notification
							title: 'Howdy! User',
							// (string | mandatory) the text inside the notification
							text: 'Today you got some messages and new members. Please check it out!',
							// (bool | optional) if you want it to fade out on its own or just sit there
							sticky: false,
							// (int | optional) the time you want it to be alive for before fading out
							time: '',
							// (string | optional) the class name you want to apply to that specific message
							class_name: 'gritter-custom'
						});

			  });

			/* Remove notification */

				$(".notify-remove").click(function(){

				  $.gritter.removeAll();
				  return false;

				});


			});
			
			/* *************************************** */
			
			/* Horizontal and Vertical Slider */

			$(function() {
				// Horizontal slider
				$( "#master1, #master2" ).slider({
					value: 60,
					orientation: "horizontal",
					range: "min",
					animate: true
				});

				$( "#master4, #master3" ).slider({
					value: 80,
					orientation: "horizontal",
					range: "min",
					animate: true
				});        

				$("#master5, #master6").slider({
					range: true,
					min: 0,
					max: 400,
					values: [ 75, 200 ],
					slide: function( event, ui ) {
						$( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
					}
				});


				// Vertical slider 
				$( "#eq > span" ).each(function() {
					// read initial values from markup and remove that
					var value = parseInt( $( this ).text(), 10 );
					$( this ).empty().slider({
						value: value,
						range: "min",
						animate: true,
						orientation: "vertical"
					});
				});
			});


		</script>
		<script>
		var pageName = "${param.pageName}";
		
		//alert(pageName); 
		$(document).ready(function(){
			if(pageName === ""){
				pageName = "main";
			}
			$(".navi > li").each(function(){
				if($(this).html().indexOf("frmSubmit('"+pageName+"')") >0 ){
					$(this).addClass("current open");
				}
			});
			//alert($(".navi > li").size());
			
		});
		</script>
		<form id="frmSubmit" name="frmSubmit" method="post">
	<input type="hidden" name="pageName">
</form>
<script>
function frmSubmit(pageName){
	$("input[name=pageName]").val(pageName);
	$("#frmSubmit").attr("action",pageName+".do");
	$("#frmSubmit").submit();
}
</script>