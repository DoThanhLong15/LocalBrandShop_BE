<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/stats" var="stats" />
<c:url value="/stats/revenue_by_peroid/2016" var="stats_peroid_2016" />
<c:url value="/stats/revenue_by_peroid/2017" var="stats_peroid_2017" />
<c:url value="/stats/revenue_by_peroid/2018" var="stats_peroid_2018" />
<c:url value="/stats/revenue_by_peroid/2019" var="stats_peroid_2019" />
<c:url value="/stats/revenue_by_peroid/2020" var="stats_peroid_2020" />

<div style="background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px;">
    <h1 style="color: #000; margin-bottom: 20px;">Thống kê doanh thu</h1>

    <h3>Bảng doanh thu theo giai đoạn</h3>
    <a class="btn btn-info m-1" href="${stats}" />Thống kê theo sản phẩm</a>
    <a class="btn btn-info m-1" href="${stats_peroid_2016}" />Thống kê năm 2016</a>
    <a class="btn btn-info m-1" href="${stats_peroid_2017}" />Thống kê năm 2017</a>
    <a class="btn btn-info m-1" href="${stats_peroid_2018}" />Thống kê năm 2018</a>
    <a class="btn btn-info m-1" href="${stats_peroid_2019}" />Thống kê năm 2019</a>
    <a class="btn btn-info m-1" href="${stats_peroid_2020}" />Thống kê năm 2020</a>
<div class="row">
    <div class="col-md-8 col-12">
        <table class="table table-striped">
            <tr>
                <th>Tháng</th>
                <th>Doanh thu</th>
            </tr>
            <c:forEach items="${revenues}" var="r">
                <tr>
                    <td>${r[0]}</td>
                    <td>${String.format("%,d", r[1])} VNĐ</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-9 col-12">
        <canvas id="myChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    let labels = [];
    let data = [];
    <c:forEach items="${revenues}" var="r">
    labels.push('${r[0]}');
    data.push(${r[1]});
    </c:forEach>
    window.onload = function () {
        const ctx = document.getElementById('myChart');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                        label: '# Doanh thu',
                        data: data,
                        borderWidth: 1
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    };
</script>

</div>