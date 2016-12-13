<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 21:26
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
                    <p>Lista parti produktów dla ${medicine.name}</p>
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
                <p>Leki</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>${medicine.name}</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Partie</p>
            </div>


            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <a href="/dashboard/medicines/" class="btn btn-warning">Powrót</a>
                        <a href="/dashboard/medicines/series/${medicine.id}/new" class="btn btn-success">Dodaj lek</a>
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Lista parti produktów dla ${medicine.name}</h4>
                            </div>
                            <div class="content-panel-body">
                                <table class="table table-bordered table-striped cf">
                                    <thead class="cf">
                                    <tr>
                                        <th>ID</th>
                                        <th class="numeric">Data produkcji</th>
                                        <th class="numeric">Data ważności</th>
                                        <th class="numeric">Numer seryjny</th>
                                        <th class="numeric">Ilość</th>
                                        <th>Akcje</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${seriesList}" var="series">

                                        <tr>
                                            <td><c:out value="${series.id}"/></td>
                                            <td class="numeric"><c:out value="${series.manufacturedAt}"/></td>
                                            <td class="numeric"><c:out value="${series.endAt}"/></td>
                                            <td class="numeric"><c:out value="${series.serialNumber}"/>PLN</td>
                                            <td class="numeric"><c:out value="${series.amount}"/></td>
                                            <td>
                                                <a href="/dashboard/medicines/series/${medicine.id}/edit/${series.id}" class="btn btn-primary">Edytuj</a>
                                                <a href="/dashboard/medicines/series/${medicine.id}/delete/${series.id}" class="btn btn-danger">Usuń</a>
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
