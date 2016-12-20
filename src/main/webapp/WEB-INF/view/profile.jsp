<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 21:44
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
                <div class="dsb-title-single dsb-title-2">
                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                    <p>Witaj ponownie, <span>Admin!</span> Twoje ostatnie logowanie było dnia 07-09-2016.</p>
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

            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Twoje dane</h4>
                            </div>


                            <form:form commandName="profile" method="post" action="/dashboard/profile">
                                <form:errors path="*" class="has-error" />

                                <form:hidden path="id" id="id"/>
                                <form:hidden path="user_id.id" value="${user.getId()}"/>

                                <div class="content-panel-body">
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label>Imię</label>
                                            <form:input path="name"  type="text"  class="form-control" placeholder="Wpisz imię"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Data urodzenia</label>
                                            <form:input path="dateOfBirthday" type="text" id="dateOfBirthday"  class="form-control" placeholder="Wpisz date urodzenia"/>
                                        </div>

                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label>Nazwisko</label>
                                            <form:input path="surname" type="text" class="form-control" placeholder="Wpisz nazwisko"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Telefon</label>
                                            <form:input path="phone" type="text" class="form-control" placeholder="Wpisz telefon"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 text-right">
                                        <button class="btn btn-success" type="submit">Zapisz</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </form:form>


                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</z:dashboard>
