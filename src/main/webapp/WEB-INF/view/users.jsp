<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<z:dashboard pageTitle="A simple page">

    <div class="dashboard-body">
        <div class="dashboard-body-inner">
            <div class="dsb-title">
                <div class="dsb-title-single dsb-title-1">
                    <i class="fa fa-address-book" aria-hidden="true"></i>
                    <p>Lista użytkowników</p>
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
                <p>Funkcje admina</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Lista użytkowników</p>
            </div>

            <jsp:include page="usersForm.jsp"/>


            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Lista użytkowników systemu</h4>
                            </div>
                            <div class="content-panel-body">
                                <table class="table table-bordered table-striped cf">
                                    <thead class="cf">
                                    <tr>
                                        <th>ID</th>
                                        <th>Imię i nazwisko</th>
                                        <th>Email</th>
                                        <th class="numeric">Adres zamieszkania</th>
                                        <th class="numeric">Data urodzenia</th>
                                        <th class="numeric">Data zatrudnienia</th>
                                        <th class="numeric">Stanowisko</th>
                                        <th class="numeric">Akcje</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <td><c:out value="${user.id}"/></td>
                                            <td>Jan Kowalski</td>
                                            <td><c:out value="${user.email}"/></td>
                                            <td class="numeric">Warszawska 129, 31-490 Kraków</td>
                                            <td class="numeric">05.11.1983</td>
                                            <td class="numeric">10.02.2015</td>
                                            <td class="numeric"><c:out value="${user.role}"/></td>
                                            <td>
                                                <a href="/dashboard/users/edit/${user.id}" class="btn btn-primary btn-sm">Edytuj</a>
                                                <a href="/dashboard/users/delete/${user.id}" class="btn btn-danger btn-sm">Usuń</a>
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
