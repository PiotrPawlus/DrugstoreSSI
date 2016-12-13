<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<z:dashboard pageTitle="A simple page">


    <div class="dashboard-body">
        <div class="dashboard-body-inner">
            <div class="dsb-title">
                <div class="dsb-title-single dsb-title-1">
                    <i class="fa fa-address-book" aria-hidden="true"></i>
                    <p>Lista użytkowników</p>
                    <div class="clearfix"></div>
                </div>
                <div class="dsb-title-single dsb-title-2">
                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                </div>
                <div class="dsb-title-single dsb-title-3">
                    <input class="form-control" type="search" placeholder="wyszukaj">
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
            </div>


            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <a href="/dashboard/producers/new" class="btn btn-success">Dodaj nowego producenta</a>
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Lista producentów</h4>
                            </div>
                            <div class="content-panel-body">
                                <table class="table table-bordered table-striped cf">
                                    <thead class="cf">
                                    <tr>
                                        <th>ID</th>
                                        <th>Nazwa</th>
                                        <th class="numeric">Strona www</th>
                                        <th class="numeric">Email</th>
                                        <th class="numeric">Telefon</th>
                                        <th class="numeric">Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${manufacturers}" var="manufacturer">

                                        <tr>
                                            <td><c:out value="${manufacturer.id}"/></td>
                                            <td><c:out value="${manufacturer.name}"/></td>
                                            <td><c:out value="${manufacturer.web}"/></td>
                                            <td><c:out value="${manufacturer.mail}"/></td>
                                            <td class="numeric"><c:out value="${manufacturer.phone}"/></td>
                                            <td>
                                                <a href="/dashboard/producers/edit/${manufacturer.id}" class="btn btn-primary">Edytuj</a>
                                                <a href="/dashboard/producers/delete/${manufacturer.id}" class="btn btn-danger">Usuń</a>
                                            </td>
                                        </tr>

                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</z:dashboard>
