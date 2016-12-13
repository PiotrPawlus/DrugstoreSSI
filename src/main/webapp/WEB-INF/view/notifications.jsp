<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 21:22
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
                    <p>Komunikaty</p>
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
                <p>System apteczny</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Komunikaty</p>
            </div>

            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Komunikaty</h4>
                            </div>
                            <div class="content-panel-body">
                                <div class="alert alert-success alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <strong>Nowa aktualizacja!</strong> System został zaktualizowany do nowej wersji 0.97.
                                </div>
                                <div class="alert alert-info alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <strong>Niski stan!</strong> W naszych zasobach zaczyna brakować leku o nazwie: 4 Flex.
                                </div>
                                <div class="alert alert-danger alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <strong>Uwaga!</strong> Całkowity brak substytutu do wytworzenia lekarstwa oczekującego w zamówieniu.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</z:dashboard>
