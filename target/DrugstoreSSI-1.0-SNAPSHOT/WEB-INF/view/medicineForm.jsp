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

<z:dashboard pageTitle="A simple page">

    <div class="dashboard-body">
        <div class="dashboard-body-inner">
            <div class="dsb-title">
                <div class="dsb-title-single dsb-title-1">
                    <i class="fa fa-address-book" aria-hidden="true"></i>
                    <p>ADD MEDICINE</p>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="dsb-breadcrumb">
                <i class="fa fa-home" aria-hidden="true"></i>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Home</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Pharmacy System</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Medicines</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>New Medicine</p>
            </div>

            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <a href="/dashboard/medicines" class="btn btn-warning">Back</a>
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Create new medicine</h4>
                            </div>
                            <div class="content-panel-body">

                                <form:form commandName="medicine" method="post" action="/dashboard/medicines">
                                    <form:hidden path="id" id="id"/>

                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <form:input path="name" id="name" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Price</label>
                                            <form:input path="price" id="price" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="capacity">Capacity</label>
                                            <form:input path="capacity" id="capacity" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Measure</label>
                                            <form:input path="measure" id="measure" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-group">
                                            <label for="description">Description</label>
                                            <form:input path="description" id="description" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 text-right">
                                        <input class="btn btn-success" type="submit" name="save" value="Save"/>
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
