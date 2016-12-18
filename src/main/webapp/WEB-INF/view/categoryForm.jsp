<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 12/12/2016
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<z:dashboard pageTitle="A simple page">

    <div class="dashboard-body">
        <div class="dashboard-body-inner">
            <div class="dsb-title">
                <div class="dsb-title-single dsb-title-1">
                    <i class="fa fa-address-book" aria-hidden="true"></i>
                    <p>KATEGORIA LEKÓW</p>
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
                <p>Kategorie</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Kategoria Leków</p>
            </div>

            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <a href="/dashboard/categories" class="btn btn-warning">Powrót</a>
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Stwórz nową kategorię</h4>
                            </div>
                            <div class="content-panel-body">

                                <form:form commandName="category" method="post" id="nowa-kategoria" action="/dashboard/categories">
                                    <form:hidden path="id" id="id"/>

                                    <div class="col-xs-12">
                                        <strong><form:errors path="name"/></strong>
                                    </div>

                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="name">Nazwa</label>
                                            <form:input path="name" id="name" name="name" class="form-control"/>
                                        </div>
                                        <div class="from-group">
                                            <form:errors path="name" cssStyle="color:red"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="description">Opis</label>
                                            <form:input path="description" id="description" class="form-control"/>
                                        </div>
                                        <div class="from-group">
                                            <form:errors path="description" cssStyle="color:red"/>
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
