<%@ attribute name="pageTitle" required="true" type="java.lang.String" %>
<%@ tag body-content="scriptless" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
    <head>
        <spring:url value="/resources/css/style.css" var="styleCss" />

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Projekt SSI</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link href="${styleCss}" rel="stylesheet" />
    </head>

    <body id="dashboard">
        <div class="logged-site">
            <nav class="navbar navbar-static-top" style="margin-left: 240px;">
                <div class="container-fluid">
                    <div class="navbar-option-single navbar-icons">
                        <ul>
                            <li><i class="fa fa-inbox" aria-hidden="true"></i></li>
                            <li><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="navbar-option-single navbar-info">
                        <div class="navbar-info-inner">
                            <div class="pull-left navbar-info-single navbar-calendar">
                                <i class="fa fa-calendar pull-left" aria-hidden="true"></i>
                                <p class="pull-left"> Pon, 6 Listopad 2016</p>
                            </div>
                            <div class="pull-left navbar-info-single navbar-clock">
                                <i class="fa fa-clock-o pull-left" aria-hidden="true"></i>
                                <p class="pull-left"> 15 : 35 : 11</p>
                            </div>
                            <div class="pull-left navbar-info-single navbar-weather">
                                <i class="fa fa-bolt pull-left" aria-hidden="true"></i>
                                <p class="pull-left">  Cracow  6* 20km/h</p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="navbar-option-single navbar-settings">
                        <p>Witaj, Admin <i class="fa fa-caret-down" aria-hidden="true"></i></p>
                        <a href="/dashboard/sales"><p><i class="fa fa-cog" aria-hidden="true"></i>Settings</p></a>
                    </div>
                </div>
            </nav>
            <div class="dashboard-left-menu">
                <div class="skin-part">
                    <div class="sidebar">
                        <div class="sidebar-logo">
                            <h2>Pharmacy<span>V0.9</span></h2>
                        </div>

                        <div class="sidebar-option">
                            <div class="widget-menu">
                                <span class="widget-menu-title">Customer service</span>
                            </div>
                            <ul>
                                <li><a href="/dashboard/sales"><i class="fa fa-cart-plus" aria-hidden="true"></i>Sales</a></li>
                                <li><a href="/dashboard/lexicon"><i class="fa fa-book" aria-hidden="true"></i>Medicines Lexicon</a></li>
                            </ul>
                        </div>


                        <div class="sidebar-option">
                            <div class="widget-menu">
                                <span class="widget-menu-title">Pharmacy System</span>
                            </div>
                            <ul>
                                <li><a href="/dashboard/notifications"><i class="fa fa-inbox" aria-hidden="true"></i>Notification</a></li>
                                <li><a href="/dashboard/orders"><i class="fa fa-telegram" aria-hidden="true"></i>Orders</a></li>
                                <li><a href="/dashboard/"><i class="fa fa-bookmark" aria-hidden="true"></i>Categories</a></li>
                                <li><a href="/dashboard/medicines"><i class="fa fa-medkit" aria-hidden="true"></i>Medicines Warehouse</a></li>
                            </ul>
                        </div>

                        <div class="sidebar-option">
                            <div class="widget-menu">
                                <span class="widget-menu-title">Admin functions</span>
                            </div>
                            <ul>
                                <li><a href="/dashboard/users"><i class="fa fa-cog" aria-hidden="true"></i> System administration</a></li>
                                <li><a href="/dashboard/personal"><i class="fa fa-bar-chart" aria-hidden="true"></i>Personal Informations</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:doBody/>

        </div>

        <spring:url value="/resources/js/script.js" var="scriptJS" />

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="${scriptJS}"></script>
    </body>
</html>
