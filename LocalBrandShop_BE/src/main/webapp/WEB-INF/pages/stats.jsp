<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/stats/revenue_by_peroid/2016" var="stats_peroid" />

<div style="background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px;">
    <h1 style="color: #000; margin-bottom: 20px;">Thống kê doanh thu</h1>

    <h3>Bảng doanh thu theo từng sản phẩm</h3>
    <a class="btn btn-info m-1" href="${stats_peroid}" />Thống kê theo giai đoạn</a>
    <div class="row">
        <div class="col-md-8 col-12">
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Tên sản phẩm</th>
                    <th>Doanh thu</th>
                </tr>
                <c:forEach items="${revenues}" var="r">
                    <tr>
                        <td>${r[0]}</td>
                        <td>${r[1]}</td>
                        <td>${String.format("%,d", r[2])} VNĐ</td>
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
        labels.push('${r[1]}');
        data.push(${r[2]});
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