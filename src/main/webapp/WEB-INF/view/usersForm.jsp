<%--
  Created by IntelliJ IDEA.
  User: Andrzej
  Date: 12.12.2016
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form commandName="user" method="post" action="/dashboard/users">
    <div class="dsb-content">
        <div class="dsb-content-inner row">
            <div class="col-xs-12">
                <div class="content-panel">
                    <div class="content-panel-header">
                        <h4>Dodaj użytkownika</h4>
                    </div>
                    <div class="content-panel-body">
                        <div class="col-xs-6">
                            <form:hidden path="id" id="id"/>
                            <div class="form-group">
                                <label>Email</label>
                                <form:input path="email" id="email" type="email" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>Hasło</label>
                                <form:input path="password" id="password" type="password" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>Stanowisko</label>
                                <form:select path="role" id="role" class="form-control">
                                    <form:option value="Administrator" label="Administrator"/>
                                    <form:option value="Farmaceuta" label="Farmaceuta"/>
                                </form:select>
                            </div>
                        </div>
                        <button class="btn btn-success" type="submit">Dodaj</button>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</form:form>
