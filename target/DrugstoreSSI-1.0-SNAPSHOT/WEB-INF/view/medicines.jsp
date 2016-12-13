<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 21:21
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
                    <p>LISTA LEKÓW</p>
                    <div class="clearfix"></div>
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
            </div>


            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <a href="/dashboard/medicines/new" class="btn btn-success">Dodaj lek</a>
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Leki</h4>
                            </div>
                            <div class="content-panel-body">
                                <table class="table table-bordered table-striped cf">
                                    <thead class="cf">
                                        <tr>
                                            <th>ID</th>
                                            <th>Nazwa</th>
                                            <th class="numeric">Ilość/Pojemność</th>
                                            <th class="numeric">Cena</th>
                                            <th>Opis</th>
                                            <th>Akcje</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${medicines}" var="medicine">

                                        <tr>
                                            <td><c:out value="${medicine.id}"/></td>
                                            <td><c:out value="${medicine.name}"/></td>
                                            <td class="numeric"><c:out value="${medicine.capacity} ${medicine.measure}"/></td>
                                            <td class="numeric"><c:out value="${medicine.price}"/>PLN</td>
                                            <td><c:out value="${medicine.description}"/></td>
                                            <td>
                                                <a href="/dashboard/medicines/edit/${medicine.id}" class="btn btn-primary">Edytuj</a>
                                                <a href="/dashboard/medicines/delete/${medicine.id}" class="btn btn-danger">Usuń</a>
                                                <a href="/dashboard/medicines/series/${medicine.id}" class="btn btn-success">Dodaj nowy produkt</a>
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
