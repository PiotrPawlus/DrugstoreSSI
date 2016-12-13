<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 13/12/2016
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<z:dashboard pageTitle="A simple page">

    <div class="dashboard-body">
        <div class="dashboard-body-inner">
            <div class="dsb-title">
                <div class="dsb-title-single dsb-title-1">
                    <i class="fa fa-address-book" aria-hidden="true"></i>
                    <p>PRODUCENT</p>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="dsb-breadcrumb">
                <i class="fa fa-home" aria-hidden="true"></i>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Home</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>System Apteczny</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Lista Producentów</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Producent</p>
            </div>


            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <a href="/dashboard/producers" class="btn btn-warning">Powrót</a>
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Stwórz nowy lek</h4>
                            </div>
                            <div class="content-panel-body">

                                <form:form commandName="manufacturer" method="post" action="/dashboard/producers">
                                    <form:hidden path="id" id="id"/>

                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="name">Nazwa</label>
                                            <form:input path="name" id="name" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="web">Strona www</label>
                                            <form:input path="web" id="web" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="mail">Aders mailowy</label>
                                            <form:input path="mail" id="mail" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Telefon</label>
                                            <form:input path="phone" id="phone" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 text-right">
                                        <input class="btn btn-success" type="submit" name="save" value="Zapisz"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </form:form>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</z:dashboard>
