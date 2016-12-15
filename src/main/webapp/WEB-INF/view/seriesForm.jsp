<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 13/12/2016
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<z:dashboard pageTitle="A simple page">

    <div class="dashboard-body">
        <div class="dashboard-body-inner">
            <div class="dsb-title">
                <div class="dsb-title-single dsb-title-1">
                    <i class="fa fa-address-book" aria-hidden="true"></i>
                    <p>PARTIA</p>
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
                <p>Leki</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>${medicine.name}</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Partia</p>
            </div>


            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <a href="/dashboard/medicines/series/${medicine.id}" class="btn btn-warning">Powrót</a>
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Partia</h4>
                            </div>
                            <div class="content-panel-body">

                                <form:form commandName="series" method="post" action="/dashboard/medicines/series/${medicine.id}">
                                    <form:hidden path="id" id="id"/>
                                    <form:hidden path="medicine.id" value="${series.medicine}"/>

                                    <div class="col-xs-12">
                                        <strong><form:errors path="manufacturedAt"/></strong>
                                    </div>
                                    <div class="col-xs-12">
                                        <strong><form:errors path="endAt"/></strong>
                                    </div>
                                    <div class="col-xs-12">
                                        <strong><form:errors path="serialNumber"/></strong>
                                    </div>
                                    <div class="col-xs-12">
                                        <strong><form:errors path="amount"/></strong>
                                    </div>

                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="manufacturedAt">Wyprodukowano</label>
                                            <form:input path="manufacturedAt" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label for="endAt">Data ważności</label>
                                            <form:input path="endAt" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="serialNumber">Number seryjny</label>
                                            <form:input path="serialNumber" id="serialNumber" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="amount">Ilość</label>
                                            <form:input path="amount" id="amount" class="form-control"/>
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
