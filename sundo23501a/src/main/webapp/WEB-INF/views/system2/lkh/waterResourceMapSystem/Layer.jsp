<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수자원 등록 </title>
    <script>
        <link rel="stylesheet"  href="http://localhost:8090/geoserver/openlayers3/ol.css"   type="text/css">
        <link rel="stylesheet" href="http://localhost:8090/geoserver/openlayers3/ol.css" type="text/css">
    </script>
    <script src="http://localhost:8090/geoserver/openlayers3/ol.js" type="text/javascript"></script>
    <script>
        $(function() {

            $.ajax({
                url			: '/main_header_2',
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
        });

    </script>
    <style>

        header {
            height: 55px;
        }

        body {
            font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
            font-size: small;
        }

        iframe {
            width: 100%;
            height: 250px;
            border: none;
        }

        #map {
            clear: both;
            position: relative;
            width: 1003px;
            height: 600px;
            border: 1px solid black;
        }

        #wrapper {
            width: 1003px;
        }


        h1 {
            color: blue;
        }

        hr {
            border: solid 1px yellow;
        }

        .custom-mouse-position {
            color: blue;
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <header id="header"></header>

    <div class="container">
        <div class="row">
            <div id="center">

                <h2>실시간 수문정보 관리 시스템</h2>
                <h3>레이어 부분</h3>



                <div id="map">


                </div>
                <form>
                    <label>Projection </label> <select id="projection">
                    <option value="EPSG:4326">EPSG:4326</option>
                    <option value="EPSG:900913">EPSG:900913</option>
                    <option value="EPSG:3857">EPSG:3857</option>
                </select> <label>Precision </label> <input id="precision" type="number" min="0"
                                                           max="12" value="4" />
                    <div id = "mouse-position"></div>
                </form>
                <div id="wrapper">
                    <div id="location"></div>


                </div>
            </div>
        </div>
    </div>


    <footer class="footer py-2">
        <div id="footer" class="container">
        </div>
    </footer>

    <script type="text/javascript">
        // OpenLayers map setup
        // 기존 코드
        var map = new ol.Map({
            target: 'map',
            layers: [
                new ol.layer.Tile({
                    source: new ol.source.OSM()
                }),
                new ol.layer.Image({
                    source: new ol.source.ImageWMS({
                        url: 'http://localhost:8090/geoserver/wms',
                        params: {
                            'LAYERS':'lee:SEOUL_HANGANG_HACUN',
                            'TILED': true
                        },
                        serverType: 'geoserver'
                    })
                })
            ],
            view: new ol.View({
                center: ol.proj.fromLonLat([126.9780, 37.5665]), // 서울 시청 좌표
                zoom: 10
            })
        });

    </script>
</body>
</html>



