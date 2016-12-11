<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <body id="login-wrapper">
        <div class="container">
            <div class="login-wrapper">
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-4">
                        <div class="logo-login">
                            <h2>Apteka SSI <span>V0.9</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-4">
                        <div class="account-data">
                            <!-- <form> -->
                            <div class="form-group">
                                <a href="#" class="pull-right label-forgot">Zapomniałeś email?</a>
                                <label for="inputUsernameEmail">Adres email:</label>
                                <input type="email" class="form-control" id="inputUsernameEmail">
                            </div>
                            <div class="form-group">
                                <a href="#" class="pull-right label-forgot">Zapomniałeś hasło?</a>
                                <label for="inputPassword">Hasło:</label>
                                <input type="password" class="form-control" id="inputPassword">
                            </div>
                            <div class="checkbox pull-left">
                                <label><input type="checkbox">Zapamiętaj mnie</label>
                            </div>
                            <a href="/dashboard"><button class="btn btn-primary pull-right">Zaloguj się</button></a>
                            <div class="clearfix"></div>
                            <!-- </form> -->
                        </div>
                    </div>
                </div>
            </div>
            <div style="text-align:center;margin:0 auto;">
                <h6 style="color:#fff;">SSI Pharmacy Project V0.9 Powered by © Michnowicz, Obrzut, Pawluś 2016</h6>
            </div>
        </div>

        <spring:url value="/resources/js/script.js" var="scriptJS" />

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="${scriptJS}"></script>
    </body>
</html>
