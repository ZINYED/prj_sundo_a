<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>수자원 목록</title>
    <style>

          header {
              height: 55px;
          }

        .doughnut_1{
        margin: 2%;
        border: 1px solid black;
        border-radius: 10px
        }
        .orgAreaLineGraph{
            margin: 2%;
            border: 1px solid black;
            border-radius: 10px
        }

        .flex-container {
            display: flex;
            flex-wrap: wrap;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>


        $(function () {

            $.ajax({
                url			: '/main_header_21',
                dataType 	: 'html',
                success		: function(data) {
                    $('#header').html(data);
                }
            });

            $.ajax({
                url			: '/main_footer',
                dataType 	: 'html',
                success		: function(data) {
                    $('#footer').html(data);
                }
            });

            $.ajax({
                url: "/doughnut_chart",
                dataType: 'json',
                success: function (response) {
                    console.log(response);
                    const doughnutCtx = document.getElementById('doughnut_chart').getContext('2d');
                    const doughnut_data = {
                        labels: ['댐', '관개수로', '저수지','펌프'],
                        datasets: [{
                            data: response,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.5)',
                                'rgba(54, 162, 235, 0.5)',
                                'rgba(176, 136, 255, 0.5)',
                                'rgba(255, 99, 132, 0.5)'
                            ],
                            borderColor: [
                                'rgb(255, 99, 132)',
                                'rgb(54, 162, 235)',
                                'rgb(176, 136, 255)',
                                'rgb(255, 99, 132)'
                            ],
                            borderWidth: 1
                        }]
                    };

                    createDrawChart(doughnutCtx, 'doughnut', doughnut_data, doughnut_options);
                }
            });

            /////////////////////////////////////////////////

            $.ajax({
                url: "/orgAreaLineGraph",
                dataType: 'json',
                success: function (response) {
                    console.log(response);

                    ////////////데이터 전처리  ///////////
                    category_1_list=[]
                    category_2_list=[]
                    category_3_list=[]
                    category_4_list=[]
                    var labels = []

                    for (let i = 0; i < response.length; i++) {
                        labels.push(response[i].org_area_name+'('+response[i].org_area+')');
                        category_1_list.push(response[i].category_1);
                        category_2_list.push(response[i].category_2);
                        category_3_list.push(response[i].category_3);
                        category_4_list.push(response[i].category_4);
                    }

                    ////////////데이터 전처리  ///////////
                    const lineCtx = document.getElementById('line_chart').getContext('2d'); // 두 번째 차트에 대해 다른 변수 사용
                    const line_data = {
                        labels: labels,
                        datasets: [
                            {
                                label: '댐',
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 2,
                                data: category_1_list // 서울에 대한 데이터 배열
                            },
                            {
                                label: '관개수로',
                                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                borderColor: 'rgba(255, 99, 132, 1)',
                                borderWidth: 2,
                                data: category_2_list// 경기도에 대한 데이터 배열
                            },
                            {
                                label: '저수지',
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 2,
                                data: category_3_list // 서울에 대한 데이터 배열
                            },
                            {
                                label: '펌프장',
                                backgroundColor: 'rgba(176, 136, 255, 0.5)',  // 보라색 배경
                                borderColor: 'rgb(176, 136, 255)',  // 보라색 테두리
                                borderWidth: 2,
                                data: category_4_list // 서울에 대한 데이터 배열
                            }
                        ]
                    };
                    createDrawChart(lineCtx, 'line', line_data, line_Options);
                }
            });
            const line_Options = {
                plugins: {

                    title: {
                        display: true,
                        text: '행정구역별 수자원시설물'
                    },
                    legend: {  // 범례 설정
                        position: 'bottom'  // 아래에 위치
                    },
                },

                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            };
            const  doughnut_options = {
                plugins: {
                        title: {
                            display: true,
                            text: '마강 수산자원시설물'

                        },
                        legend: {  // 범례 설정
                            position: 'bottom'  // 아래에 위치
                        },
                        tooltip: {// enabled: false // 툴팁 비활성화
                    },
                    datalabels: {
                        display: true, // 데이터 레이블 표시
                        color: 'white', // 데이터 레이블의 텍스트 색상
                        font: {
                            weight: 'bold'
                        },
                        formatter: (value, context) => {
                            return context.chart.data.labels[context.dataIndex] + ': ' + value;
                        },
                        // anchor: 'end', // 데이터 레이블 위치 설정
                        // align: 'end' // 데이터 레이블 위치 설정
                    }
                }
            };

            function createDrawChart(ctx, chart_type, data, options) {
                return new Chart(ctx, {
                    type: chart_type,
                    data: data,
                    options: options
                });
            }
        });
    </script>
</head>
<body>
<header id="header"></header>
    <div class="container">
        <div class="row">
            <div id="center">
                <h2><a href="/waterResourcesList">정보</a> | <a href="/waterResourceStatistics">통계</a></h2>
                <div class="flex-container">
                    <!-- 첫 번째 그래프 영역 (비율 1) -->
                    <!-- 도넛 차트의 캔버스 ID 변경 -->
                    <div class="doughnut_1">
                        <canvas id="doughnut_chart"></canvas>
                    </div>


                    <!-- 두 번째 그래프 영역 (비율 2) -->
                    <!-- 라인 차트의 캔버스 ID 변경 -->
                    <div class="orgAreaLineGraph">
                        <canvas id="line_chart"></canvas>
                    </div>
                </div>

            </div>
        </div>
    </div>



    <footer class="footer py-2">
        <div id="footer" class="container">
        </div>
    </footer>

</body>
</html>