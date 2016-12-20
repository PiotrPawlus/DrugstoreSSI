<%@ attribute name="pageTitle" required="true" type="java.lang.String" %>
<%@ tag pageEncoding="UTF-8"%>
<%@ tag body-content="scriptless" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <spring:url value="/resources/css/style.css" var="styleCss" />
        <spring:url value="/resources/css/jquery-ui.css" var="styleCss1" />
        <spring:url value="/resources/css/jquery-ui.structure.css" var="styleCss2" />
        <spring:url value="/resources/css/jquery-ui.theme.css" var="styleCss3" />

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Projekt SSI</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link href="${styleCss}" rel="stylesheet" />
        <link href="${styleCss1}" rel="stylesheet" />
        <link href="${styleCss2}" rel="stylesheet" />
        <link href="${styleCss3}" rel="stylesheet" />
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
                                <p class="pull-left">  Kraków  6* 20km/h</p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="navbar-option-single navbar-settings">
                        <p>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                                <a onclick="document.forms['logoutForm'].submit()" class="btn btn-default" aria-label="Left Align">
                                    <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Wyloguj się
                                </a>
                            </c:if>
                        </p>
                    </div>
                </div>
            </nav>
            <div class="dashboard-left-menu">
                <div class="skin-part">
                    <div class="sidebar">
                        <div class="sidebar-logo">
                            <h2>Apteka<span>V0.9</span></h2>
                        </div>

                        <div class="sidebar-option">
                            <div class="widget-menu">
                                <span class="widget-menu-title">System Apteczny</span>
                            </div>
                            <ul>
                                <li><a href="/dashboard/notifications"><i class="fa fa-inbox" aria-hidden="true"></i>Komunikaty</a></li>
                                <li><a href="/dashboard/producers"><i class="fa fa-telegram" aria-hidden="true"></i>Producenci Leków</a></li>
                                <li><a href="/dashboard/categories"><i class="fa fa-bookmark" aria-hidden="true"></i>Kategorie</a></li>
                                <li><a href="/dashboard/medicines"><i class="fa fa-medkit" aria-hidden="true"></i>Magazyn Leków</a></li>
                            </ul>
                        </div>

                        <sec:authorize  access="hasRole('ROLE_ADMIN')">
                            <div class="sidebar-option">
                                <div class="widget-menu">
                                    <span class="widget-menu-title">Funkcje administratora</span>
                                </div>
                                <ul>
                                    <li><a href="/dashboard/users"><i class="fa fa-cog" aria-hidden="true"></i>Zarządzaj Personelem</a></li>
                                </ul>
                            </div>
                        </sec:authorize>



                        <div class="sidebar-option">
                            <div class="widget-menu">
                                <span class="widget-menu-title">Zarządzaj kontem</span>
                            </div>
                            <ul>
                                <li><a href="/dashboard/profile"><i class="fa fa-bar-chart" aria-hidden="true"></i>Twoje dane personalne</a></li>
                            </ul>
                        </div>

                        <div class="sidebar-option">
                            <div class="widget-menu">
                                <span class="widget-menu-title">Informacje ogólne</span>
                            </div>
                            <ul>
                                <li><a href="/dashboard/info"><i class="fa fa-cart-plus" aria-hidden="true"></i>Informacje</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:doBody/>

        </div>

        <spring:url value="/resources/js/script.js" var="scriptJS" />

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="http://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="${scriptJS}"></script>
    </body>
</html>
