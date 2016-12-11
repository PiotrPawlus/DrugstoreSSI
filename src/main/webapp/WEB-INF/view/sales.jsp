<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 20:41
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
                    <p>Sprzedaż</p>
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
                <p>Obsługa klienta</p>
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <p>Sprzedaż</p>
            </div>

            <div class="dsb-content">
                <div class="dsb-content-inner row">
                    <div class="col-xs-12">
                        <div class="content-panel">
                            <div class="content-panel-header">
                                <h4>Nowy rachunek</h4>
                            </div>
                            <div class="content-panel-body">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="name">Nazwa produktu</label>
                                        <input type="text" id="name" class="form-control">
                                    </div>
                                    <table class="table table-bordered table-striped cf">
                                        <thead class="cf">
                                        <tr>
                                            <th>Nr. produktu</th>
                                            <th>Nazwa</th>
                                            <th class="numeric">Ilość sztuk na stanie</th>
                                            <th class="numeric">Leksykon leku</th>
                                            <th class="numeric">Dodaj do rachunku</th>
                                            <th class="numeric">Cena</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>12345</td>
                                            <td>Tabletki Imuprom MAX</td>
                                            <td class="numeric">120</td>
                                            <td class="numeric add-i"><i class="fa fa-book" aria-hidden="true"></i></td>
                                            <td class="numeric add-i"><i class="fa fa-plus" aria-hidden="true"></i></td>
                                            <td class="numeric">12,99</td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td>Tabletki Imuprom MAX</td>
                                            <td class="numeric">120</td>
                                            <td class="numeric add-i"><i class="fa fa-book" aria-hidden="true"></i></td>
                                            <td class="numeric add-i"><i class="fa fa-plus" aria-hidden="true"></i></td>
                                            <td class="numeric">12,99</td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td>Tabletki Imuprom MAX</td>
                                            <td class="numeric">120</td>
                                            <td class="numeric add-i"><i class="fa fa-book" aria-hidden="true"></i></td>
                                            <td class="numeric add-i"><i class="fa fa-plus" aria-hidden="true"></i></td>
                                            <td class="numeric">12,99</td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td>Tabletki Imuprom MAX</td>
                                            <td class="numeric">120</td>
                                            <td class="numeric add-i"><i class="fa fa-book" aria-hidden="true"></i></td>
                                            <td class="numeric add-i"><i class="fa fa-plus" aria-hidden="true"></i></td>
                                            <td class="numeric">12,99</td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td>Tabletki Imuprom MAX</td>
                                            <td class="numeric">120</td>
                                            <td class="numeric add-i"><i class="fa fa-book" aria-hidden="true"></i></td>
                                            <td class="numeric add-i"><i class="fa fa-plus" aria-hidden="true"></i></td>
                                            <td class="numeric">12,99</td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td>Tabletki Imuprom MAX</td>
                                            <td class="numeric">120</td>
                                            <td class="numeric add-i"><i class="fa fa-book" aria-hidden="true"></i></td>
                                            <td class="numeric add-i"><i class="fa fa-plus" aria-hidden="true"></i></td>
                                            <td class="numeric">12,99</td>
                                        </tr>
                                        <tr>
                                            <td>12345</td>
                                            <td>Tabletki Imuprom MAX</td>
                                            <td class="numeric">120</td>
                                            <td class="numeric add-i"><i class="fa fa-book" aria-hidden="true"></i></td>
                                            <td class="numeric add-i"><i class="fa fa-plus" aria-hidden="true"></i></td>
                                            <td class="numeric">12,99</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-xs-12" style="margin-top: 20px;">
                                    <h5>Rachunek kupującego:</h5>
                                    <ul style="list-style: none; padding: 0 0 0 20px;">
                                        <li>
                                            <p>Tabletki Imuprom MAX <span>12,99 zł </span><i class="fa fa-times" aria-hidden="true"></i></p>
                                        </li>
                                        <li>
                                            <p>Tabletki Imuprom MAX <span>12,99 zł </span><i class="fa fa-times" aria-hidden="true"></i></p>
                                        </li>
                                        <li>
                                            <p>Tabletki Imuprom MAX <span>12,99 zł </span><i class="fa fa-times" aria-hidden="true"></i></p>
                                        </li>
                                        <li>
                                            <p>Tabletki Imuprom MAX <span>12,99 zł </span><i class="fa fa-times" aria-hidden="true"></i></p>
                                        </li>
                                        <li>
                                            <p>Tabletki Imuprom MAX <span>12,99 zł </span><i class="fa fa-times" aria-hidden="true"></i></p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-xs-12" style="margin-top: 20px;">
                                    <p class="text-right">Suma rachunku: <span>29.90 zł</span></p>
                                </div>
                                <div class="col-xs-12 text-right">
                                    <button class="btn btn-success" type="submit">Zakończ sprzedaż</button>
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
