<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin - Start Bootstrap Template</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  
  <!-- scripts -->
  <script src="/assets/script/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="/assets/script/canvasjs.min.js" type="text/javascript"></script>

  <!-- Styles -->
	<style>
	#chartdiv {
	  width: 100%;
	  height: 500px;
	}
	</style>

<!-- Resources -->
	<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/serial.js"></script>
	<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>
	var chart = AmCharts.makeChart("chartdiv", {
	    "type": "serial",
	    "theme": "light",
	    "legend": {
	        "equalWidths": false,
	        "useGraphSettings": true,
	        "valueAlign": "left",
	        "valueWidth": 120
	    },
	    "dataProvider": [{
	        "date": "2012-01-01",
	        "distance": 227,
	        "townName": "New York",
	        "townName2": "New York",
	        "townSize": 25,
	        "latitude": 40.71,
	        "duration": 408
	    }, {
	        "date": "2012-01-02",
	        "distance": 371,
	        "townName": "Washington",
	        "townSize": 14,
	        "latitude": 38.89,
	        "duration": 482
	    }, {
	        "date": "2012-01-03",
	        "distance": 433,
	        "townName": "Wilmington",
	        "townSize": 6,
	        "latitude": 34.22,
	        "duration": 562
	    }, {
	        "date": "2012-01-04",
	        "distance": 345,
	        "townName": "Jacksonville",
	        "townSize": 7,
	        "latitude": 30.35,
	        "duration": 379
	    }, {
	        "date": "2012-01-05",
	        "distance": 480,
	        "townName": "Miami",
	        "townName2": "Miami",
	        "townSize": 10,
	        "latitude": 25.83,
	        "duration": 501
	    }, {
	        "date": "2012-01-06",
	        "distance": 386,
	        "townName": "Tallahassee",
	        "townSize": 7,
	        "latitude": 30.46,
	        "duration": 443
	    }, {
	        "date": "2012-01-07",
	        "distance": 348,
	        "townName": "New Orleans",
	        "townSize": 10,
	        "latitude": 29.94,
	        "duration": 405
	    }, {
	        "date": "2012-01-08",
	        "distance": 238,
	        "townName": "Houston",
	        "townName2": "Houston",
	        "townSize": 16,
	        "latitude": 29.76,
	        "duration": 309
	    }, {
	        "date": "2012-01-09",
	        "distance": 218,
	        "townName": "Dalas",
	        "townSize": 17,
	        "latitude": 32.8,
	        "duration": 287
	    }, {
	        "date": "2012-01-10",
	        "distance": 349,
	        "townName": "Oklahoma City",
	        "townSize": 11,
	        "latitude": 35.49,
	        "duration": 485
	    }, {
	        "date": "2012-01-11",
	        "distance": 603,
	        "townName": "Kansas City",
	        "townSize": 10,
	        "latitude": 39.1,
	        "duration": 890
	    }, {
	        "date": "2012-01-12",
	        "distance": 534,
	        "townName": "Denver",
	        "townName2": "Denver",
	        "townSize": 18,
	        "latitude": 39.74,
	        "duration": 810
	    }, {
	        "date": "2012-01-13",
	        "townName": "Salt Lake City",
	        "townSize": 12,
	        "distance": 425,
	        "duration": 670,
	        "latitude": 40.75,
	        "dashLength": 8,
	        "alpha": 0.4
	    }, {
	        "date": "2012-01-14",
	        "latitude": 36.1,
	        "duration": 470,
	        "townName": "Las Vegas",
	        "townName2": "Las Vegas"
	    }, {
	        "date": "2012-01-15"
	    }, {
	        "date": "2012-01-16"
	    }, {
	        "date": "2012-01-17"
	    }, {
	        "date": "2012-01-18"
	    }, {
	        "date": "2012-01-19"
	    }],
	    "valueAxes": [{
	        "id": "distanceAxis",
	        "axisAlpha": 0,
	        "gridAlpha": 0,
	        "position": "left",
	        "title": "distance"
	    }, {
	        "id": "latitudeAxis",
	        "axisAlpha": 0,
	        "gridAlpha": 0,
	        "labelsEnabled": false,
	        "position": "right"
	    }, {
	        "id": "durationAxis",
	        "duration": "mm",
	        "durationUnits": {
	            "hh": "h ",
	            "mm": "min"
	        },
	        "axisAlpha": 0,
	        "gridAlpha": 0,
	        "inside": true,
	        "position": "right",
	        "title": "duration"
	    }],
	    "graphs": [{
	        "alphaField": "alpha",
	        "balloonText": "[[value]] miles",
	        "dashLengthField": "dashLength",
	        "fillAlphas": 0.7,
	        "legendPeriodValueText": "total: [[value.sum]] mi",
	        "legendValueText": "[[value]] mi",
	        "title": "distance",
	        "type": "column",
	        "valueField": "distance",
	        "valueAxis": "distanceAxis"
	    }, {
	        "balloonText": "latitude:[[value]]",
	        "bullet": "round",
	        "bulletBorderAlpha": 1,
	        "useLineColorForBulletBorder": true,
	        "bulletColor": "#FFFFFF",
	        "bulletSizeField": "townSize",
	        "dashLengthField": "dashLength",
	        "descriptionField": "townName",
	        "labelPosition": "right",
	        "labelText": "[[townName2]]",
	        "legendValueText": "[[value]]/[[description]]",
	        "title": "latitude/city",
	        "fillAlphas": 0,
	        "valueField": "latitude",
	        "valueAxis": "latitudeAxis"
	    }, {
	        "bullet": "square",
	        "bulletBorderAlpha": 1,
	        "bulletBorderThickness": 1,
	        "dashLengthField": "dashLength",
	        "legendValueText": "[[value]]",
	        "title": "duration",
	        "fillAlphas": 0,
	        "valueField": "duration",
	        "valueAxis": "durationAxis"
	    }],
	    "chartCursor": {
	        "categoryBalloonDateFormat": "DD",
	        "cursorAlpha": 0.1,
	        "cursorColor":"#000000",
	         "fullWidth":true,
	        "valueBalloonsEnabled": false,
	        "zoomable": false
	    },
	    "dataDateFormat": "YYYY-MM-DD",
	    "categoryField": "date",
	    "categoryAxis": {
	        "dateFormats": [{
	            "period": "DD",
	            "format": "DD"
	        }, {
	            "period": "WW",
	            "format": "MMM DD"
	        }, {
	            "period": "MM",
	            "format": "MMM"
	        }, {
	            "period": "YYYY",
	            "format": "YYYY"
	        }],
	        "parseDates": true,
	        "autoGridCount": false,
	        "axisColor": "#555555",
	        "gridAlpha": 0.1,
	        "gridColor": "#FFFFFF",
	        "gridCount": 50
	    },
	    "export": {
	    	"enabled": true
	     }
	});
</script>

<!-- HTML -->
<div id="chartdiv">



</div>

  
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index">Start Bootstrap</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="index">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
<!--         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="charts">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Charts</span>
          </a> -->
          
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseCharts" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Charts</span>
          </a> 
          <ul class="sidenav-second-level collapse" id="collapseCharts">
	      
	      
	      <!-- 2018-08-02 /chart types -->    
	          <li data-toggle="collapse" href="#chart-types" aria-expanded="false" aria-controls="chart-types">
	          	<a href="#"><i class="fa fa-area-chart" aria-hidden="true"></i><span>CHART TYPES</span></a>
	          </li>
			  <li>
				<ul id="chart-types" class="sub-menu collapse ">
					<li><a href="/chart-types/column">Column Chart</a></li>
					<li><a href="/chart-types/line">Line Chart</a></li>
					<li><a href="/chart-types/step-line">Step Line Chart</a></li>
					<li><a href="/chart-types/spline">Spline Chart</a></li>
					<li><a href="/chart-types/step-area">Step Area Chart</a></li>
					<li><a href="/chart-types/area">Area Chart</a></li>
					<li><a href="/chart-types/spline-area">Spline Area Chart</a></li>
					<li><a href="/chart-types/bar">Bar Chart</a></li>
					<li><a href="/chart-types/pie">Pie Chart</a></li>
					<li><a href="/chart-types/database">Database Chart</a></li>
					<li><a href="/chart-types/doughnut">Doughnut Chart</a></li>
					<li><a href="/chart-types/bubble">Bubble Chart</a></li>
					<li><a href="/chart-types/scatter">Scatter Chart</a></li>
					<li><a href="/chart-types/stacked-column">Stacked Column Chart</a></li>
					<li><a href="/chart-types/stacked-column100">Stacked Column 100% Chart</a></li>
					<li><a href="/chart-types/stacked-area">Stacked Area Chart</a></li>
					<li><a href="/chart-types/stacked-area100">Stacked Area 100% Chart</a></li>
					<li><a href="/chart-types/stacked-bar">Stacked Bar Chart</a></li>
					<li><a href="/chart-types/stacked-bar100">Stacked Bar 100% Chart</a></li>
				</ul>
			</li>	
			<li role="separator" class="divider"></li>
			<!--  features -->
			<li data-toggle="collapse" href="#features" aria-expanded="false"
				aria-controls="features"><a href="#"> <i class="fa fa-flask"
					aria-hidden="true"></i> <span>FEATURES</span>
			</a></li>
			<li>
				<ul id="features" class="sub-menu collapse ">
					<li><a href="/features/zooming-panning">Zooming &amp; Panning</a></li>
					<li><a href="/features/export-chart">Export Chart as Image</a></li>
					<li><a href="/features/events-handling">Event Handling</a></li>
					<li><a href="/features/log-axis">Logarithmic Axis</a></li>
					<li><a href="/features/date-time">Date-Time Axis</a></li>
					<li><a href="/features/reverse-axis">Reverse Axis</a></li>
					<li><a href="/features/striplines">StripLines</a></li>
					<li><a href="/features/multiple-y-axis">Multiple Y Axis</a></li>
					<li><a href="/features/multi-series-chart">Multiseries Charts</a></li>
				</ul>
			</li>
			<!--  /features -->
			<li role="separator" class="divider"></li>
			<!--  how to  -->
			<li data-toggle="collapse" href="#how-to" aria-expanded="false"
				aria-controls="how-to"><a href="#"> <i class="fa fa-wrench"
					aria-hidden="true"></i> <span>HOW TO</span>
			</a></li>
			<li>
				<ul id="how-to" class="sub-menu collapse ">
					<li><a href="/how-to/enable-disable-ds">Hide / Show DataSeries</a></li>
	                <li><a href="/how-to/live-chart">Dynamic / Live Chart</a></li>
	                <li><a href="/how-to/sync-multiple-charts">Sync Multiple Charts</a></li>
	                <li><a href="/how-to/datapoints-from-user-input">Add Data Points From User Input</a></li>
	                <li><a href="/how-to/multiple-charts-in-a-page">Multiple Charts in a Page</a></li>
	                <li><a href="/how-to/play-stop-live-chart">Play / Stop Live Chart</a></li>
	                <li><a href="/how-to/create-chart-from-json">Charts using JSON &amp; AJAX</a></li>
	                <li><a href="/how-to/create-chart-from-xml">Charts using XML &amp; AJAX</a></li>
	                <li><a href="/how-to/create-chart-from-csv">Charts using CSV &amp; AJAX</a></li>
	                <li><a href="/how-to/data-from-database">Render Data From Database</a></li>
				</ul>
			</li>
        </ul>  
       
          
          
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Boards">
          <a class="nav-link" href="board/list">
            <i class="fa fa-list-alt" aria-hidden="true"></i>
            <span class="nav-link-text">Boards</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">Components</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseComponents">
            <li>
              <a href="navbar">Navbar</a>
            </li>
            <li>
              <a href="cards">Cards</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Personal">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapsePersonal" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-file"></i>
            <span class="nav-link-text">Personal settings</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapsePersonal">
            <li>
              <c:if test="${admin}">
			  	 <a href="/admin/board">Admin Page</a>
			  </c:if>          
            </li>
            <li>
              <a href="modify">Register Modify an Page</a>
            </li>
            <li>
              <a href="forgot-password">Forgot Password Page</a>
            </li>
            <li>
              <a href="blank">Blank Page</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-sitemap"></i>
            <span class="nav-link-text">Menu Levels</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMulti">
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2">Third Level</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti2">
                <li>
                  <a href="#">Third Level Item</a>
                </li>
                <li>
                  <a href="#">Third Level Item</a>
                </li>
                <li>
                  <a href="#">Third Level Item</a>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="#">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Link</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>Jane Smith</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>John Doe</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all messages</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">New Alerts:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search for...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  
  
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Charts</li>
      </ol>
      <!-- Area Chart Example-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-area-chart"></i> Area Chart Example</div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="30">
          	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
			<script src="/assets/script/canvasjs.min.js"></script>
          
          </canvas>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
      <div class="row">
        <div class="col-lg-8">
          <!-- Example Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i> Bar Chart Example</div>
            <div class="card-body">
              <canvas id="myBarChart" width="100" height="50"></canvas>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
        </div>
        <div class="col-lg-4">
          <!-- Example Pie Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-pie-chart"></i> Pie Chart Example</div>
            <div class="card-body">
              <canvas id="myPieChart" width="100%" height="100"></canvas>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
        </div>
      </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Lee, Sang-bong 2018</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-charts.min.js"></script>
  </div>
</body>

</html>
