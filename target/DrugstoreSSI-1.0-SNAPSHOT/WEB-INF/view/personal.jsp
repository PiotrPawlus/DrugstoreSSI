<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="z" tagdir="/WEB-INF/tags" %>

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
                                <h4>Dodaj nowego użytkownika</h4>
                            </div>
                            <div class="content-panel-body">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="name">Imię i nazwisko</label>
                                        <input type="text" id="name" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="adress">Adres zamieszkania</label>
                                        <input type="password" id="adress" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="adress">Stanowisko</label>
                                        <select name="" id="" class="form-control">
                                            <option value="10">Administrator</option>
                                            <option value="20">Technik</option>
                                            <option value="30">Pracownik zaw.</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="data1">Data urodzenia</label>
                                        <input type="email" id="data1" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="data2">Data zatrudnienia</label>
                                        <input type="password" id="exampleInputPassword1" class="form-control">
                                    </div>
                                </div>
                                <div class="col-xs-12 text-right">
                                    <button class="btn btn-success" type="submit">Dodaj użytkownika</button>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</z:dashboard>
