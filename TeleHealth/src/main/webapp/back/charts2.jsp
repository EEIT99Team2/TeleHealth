<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>SB Admin - Start Bootstrap Template</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/data.js"></script>
  <script src="https://code.highcharts.com/modules/drilldown.js"></script>
  
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="index.jsp">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="charts.jsp">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Charts</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="tables.jsp">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Tables</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">Components</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseComponents">
            <li>
              <a href="navbar.jsp">Navbar</a>
            </li>
            <li>
              <a href="cards.jsp">Cards</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-file"></i>
            <span class="nav-link-text">Example Pages</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseExamplePages">
            <li>
              <a href="login.jsp">Login Page</a>
            </li>
            <li>
              <a href="register.jsp">Registration Page</a>
            </li>
            <li>
              <a href="forgot-password.jsp">Forgot Password Page</a>
            </li>
            <li>
              <a href="blank.jsp">Blank Page</a>
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
          <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Charts</li>
      </ol>
      
      
      
          <!-- Example Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i> Bar Chart Example</div>
              
            <div class="card-body">
              <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">
              	
              </div>
            </div>
            
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
        </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    
    
    
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Your Website 2018</small>
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
            <a class="btn btn-primary" href="login.jsp">Logout</a>
          </div>
        </div>
      </div>
    </div>
    
    
    
<script>
 // Create the chart
 Highcharts.chart('container', {
     chart: {
         type: 'column'
     },
     title: {
         text: 'Browser market shares. January, 2018'
     },
     subtitle: {
         text: 'Click the columns to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
     },
     xAxis: {
         type: 'category'
     },
     yAxis: {
         title: {
             text: 'Total percent market share'
         }

     },
     legend: {
         enabled: false
     },
     plotOptions: {
         series: {
             borderWidth: 0,
             dataLabels: {
                 enabled: true,
                 format: '{point.y:.1f}%'
             }
         }
     },

     tooltip: {
         headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
         pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
     },

     "series": [
         {
             "name": "Browsers",
             "colorByPoint": true,
             "data": [
                 {
                     "name": "Chrome",
                     "y": 62.74,
                     "drilldown": "Chrome"
                 },
                 {
                     "name": "Firefox",
                     "y": 10.57,
                     "drilldown": "Firefox"
                 },
                 {
                     "name": "Internet Explorer",
                     "y": 7.23,
                     "drilldown": "Internet Explorer"
                 },
                 {
                     "name": "Safari",
                     "y": 5.58,
                     "drilldown": "Safari"
                 },
                 {
                     "name": "Edge",
                     "y": 4.02,
                     "drilldown": "Edge"
                 },
                 {
                     "name": "Opera",
                     "y": 1.92,
                     "drilldown": "Opera"
                 },
                 {
                     "name": "Other",
                     "y": 7.62,
                     "drilldown": null
                 }
             ]
         }
     ],
     "drilldown": {
         "series": [
             {
                 "name": "Chrome",
                 "id": "Chrome",
                 "data": [
                     [
                         "v65.0",
                         0.1
                     ],
                     [
                         "v64.0",
                         1.3
                     ],
                     [
                         "v63.0",
                         53.02
                     ],
                     [
                         "v62.0",
                         1.4
                     ],
                     [
                         "v61.0",
                         0.88
                     ],
                     [
                         "v60.0",
                         0.56
                     ],
                     [
                         "v59.0",
                         0.45
                     ],
                     [
                         "v58.0",
                         0.49
                     ],
                     [
                         "v57.0",
                         0.32
                     ],
                     [
                         "v56.0",
                         0.29
                     ],
                     [
                         "v55.0",
                         0.79
                     ],
                     [
                         "v54.0",
                         0.18
                     ],
                     [
                         "v51.0",
                         0.13
                     ],
                     [
                         "v49.0",
                         2.16
                     ],
                     [
                         "v48.0",
                         0.13
                     ],
                     [
                         "v47.0",
                         0.11
                     ],
                     [
                         "v43.0",
                         0.17
                     ],
                     [
                         "v29.0",
                         0.26
                     ]
                 ]
             },
             {
                 "name": "Firefox",
                 "id": "Firefox",
                 "data": [
                     [
                         "v58.0",
                         1.02
                     ],
                     [
                         "v57.0",
                         7.36
                     ],
                     [
                         "v56.0",
                         0.35
                     ],
                     [
                         "v55.0",
                         0.11
                     ],
                     [
                         "v54.0",
                         0.1
                     ],
                     [
                         "v52.0",
                         0.95
                     ],
                     [
                         "v51.0",
                         0.15
                     ],
                     [
                         "v50.0",
                         0.1
                     ],
                     [
                         "v48.0",
                         0.31
                     ],
                     [
                         "v47.0",
                         0.12
                     ]
                 ]
             },
             {
                 "name": "Internet Explorer",
                 "id": "Internet Explorer",
                 "data": [
                     [
                         "v11.0",
                         6.2
                     ],
                     [
                         "v10.0",
                         0.29
                     ],
                     [
                         "v9.0",
                         0.27
                     ],
                     [
                         "v8.0",
                         0.47
                     ]
                 ]
             },
             {
                 "name": "Safari",
                 "id": "Safari",
                 "data": [
                     [
                         "v11.0",
                         3.39
                     ],
                     [
                         "v10.1",
                         0.96
                     ],
                     [
                         "v10.0",
                         0.36
                     ],
                     [
                         "v9.1",
                         0.54
                     ],
                     [
                         "v9.0",
                         0.13
                     ],
                     [
                         "v5.1",
                         0.2
                     ]
                 ]
             },
             {
                 "name": "Edge",
                 "id": "Edge",
                 "data": [
                     [
                         "v16",
                         2.6
                     ],
                     [
                         "v15",
                         0.92
                     ],
                     [
                         "v14",
                         0.4
                     ],
                     [
                         "v13",
                         0.1
                     ]
                 ]
             },
             {
                 "name": "Opera",
                 "id": "Opera",
                 "data": [
                     [
                         "v50.0",
                         0.96
                     ],
                     [
                         "v49.0",
                         0.82
                     ],
                     [
                         "v12.1",
                         0.14
                     ]
                 ]
             }
         ]
     }
 });
</script>
    
    
    
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
