<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 12/12/2016
  Time: 14:35
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
                    <p>LEK</p>
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
                <p>Lek</p>
            </div>

            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <a href="/dashboard/medicines" class="btn btn-warning">Powrót</a>
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Stwórz nowy lek</h4>
                            </div>
                            <div class="content-panel-body">

                                <form:form commandName="medicine" method="post" action="/dashboard/medicines">
                                    <form:hidden path="id" id="id"/>

                                    <div class="col-xs-12">
                                        <strong><form:errors path="name"/></strong>
                                    </div>
                                    <div class="col-xs-12">
                                        <strong><form:errors path="price"/></strong>
                                    </div>
                                    <div class="col-xs-12">
                                        <strong><form:errors path="capacity"/></strong>
                                    </div>
                                    <div class="col-xs-12">
                                        <strong><form:errors path="measure"/></strong>
                                    </div>

                                    <div class="col-xs-6">

                                        <div class="form-group">
                                            <label for="name">Nazwa</label>
                                            <form:input path="name" id="name" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Cena</label>
                                            <form:input path="price" id="price" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label for="category.id">Categoria</label>

                                            <form:select path="category.id" id="category.id">
                                                <form:options items="${categories}" itemValue="id" itemLabel="name" />
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="capacity">Ilość/Pojemność</label>
                                            <form:input path="capacity" id="capacity" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="measure">Miara</label>
                                            <form:input path="measure" id="measure" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="manufacturer.id">Producent</label>

                                            <form:select path="manufacturer.id" id="manufacturer.id">
                                                <form:options items="${manufacturers}" itemValue="id" itemLabel="name" />
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <label for="description">Opis</label>
                                            <form:input path="description" id="description" class="form-control"/>
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
