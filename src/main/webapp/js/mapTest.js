var map;
var wms1;
var mapOverlay;
var container;
var popupContent;
var content;
var coordinate;
var markerVectorLayer;

/*var wms2;
var wms3;
var wms4;
var wms5;
var wms6;*/
var wms7;

$( document ).ready(function() {
	map = new ol.Map({ // OpenLayer의 맵 객체를 생성한다.
	    target: 'map', // 맵 객체를 연결하기 위한 target으로 <div>의 id값을 지정해준다.
	    layers: [ // 지도에서 사용 할 레이어의 목록을 정희하는 공간이다.
	      new ol.layer.Tile({
	        source: new ol.source.OSM({
	          url: 'https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png' // vworld의 지도를 가져온다.
	        })
	      })
	    ],
	    view: new ol.View({ // 지도가 보여 줄 중심좌표, 축소, 확대 등을 설정한다. 보통은 줌, 중심좌표를 설정하는 경우가 많다.
	      center: ol.proj.fromLonLat([126.9784, 37.56681]),
	      zoom: 9,
		  minzoom: 5
	    })
	});
	
	var ctrl = new ol.control.Scale({});
	map.addControl(ctrl);
	map.addControl(new ol.control.ScaleLine());
	
	mapOverlay = new ol.Overlay(({element:container}));
	container = document.getElementById('popup'); //팝업 컨테이너
	popupContent = document.getElementById('popup-content'); //팝업 내용
	
	console.log("map");
		wms1 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'sundoB:LSMD_CONT_UJ201_11_202310', // 3. 작업공간:레이어 명
				'BBOX' : [179271.578125, 437187.78125, 215578.53125, 465761.4375], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		})
	});
	map.addLayer(wms1); // 맵 객체에 레이어를 추가함
	console.log("wms1 추가");
	
	var vectorSource = new ol.source.Vector();
	markerVectorLayer = new ol.layer.Vector({
		source: vectorSource,
	});
	
	$.ajax({
		url:"/sluiceDataList",
		method:"GET",
		dataType:'json',
		success: function(sluiceData) {
			console.log("컨트롤러 탔음");
			console.log(sluiceData);
			sluiceData.forEach(function(data) {
				var id = data.sluice_id;
				var marker = new ol.Feature({
					geometry: new ol.geom.Point(
						[data.mapx, data.mapy]
					).transform('EPSG:4326', 'EPSG:3857'),
					id: id
				});
				var iconStyle = new ol.style.Style({
					image: new ol.style.Icon(({
						anchor: [0.5, 0.96],
						scale: 0.1,
						src: 'images/pochaco.png'
					})),
					zindex: 10
				});
				marker.setStyle(iconStyle);
				vectorSource.addFeature(marker);
			});
			console.log("관측소 정보 가져왔음");
			map.addLayer(markerVectorLayer);
			console.log("관측소 레이어 추가");
		},
		error: function() {
			console.log("관측소 정보 가져오지 못했습니다.");
		}
	})

	map.on('singleclick', function(evt) {
		coordinate = evt.coordinate;
		console.log(coordinate);
		map.forEachFeatureAtPixel(evt.pixel, function(feature){
			content = "<span class='__float-tbl'>관측소 번호 : "+feature.get('id')+" <button type='button' onclick='alert()'>북마크</button></span>";
			popupContent.innerHTML = content;
			mapOverlay.setPosition(coordinate);
			map.addOverlay(mapOverlay);
		});

	})


		/*
	wms2 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8300/geoserver/sundo/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'sundo:LSMD_CONT_UJ201_41_202310', // 3. 작업공간:레이어 명
				'BBOX' : [158046.8125, 377790.5, 270626.21875, 526259.5], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		})
	});
	
	

	wms3 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8300/geoserver/sundo/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'sundo:LSMD_CONT_UM730_11_202310', // 3. 작업공간:레이어 명
				'BBOX' : [179119.90625, 436844.4375, 215834.421875, 465874.875], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		})
	});
	
	
	
	wms4 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8300/geoserver/sundo/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'sundo:LSMD_CONT_UM730_41_202310', // 3. 작업공간:레이어 명
				'BBOX' : [157399.453125, 397699.84375, 271335.40625, 514954.8125], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		})
	});
	
	wms5 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8300/geoserver/sundo/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'sundo:LARD_ADM_SECT_SGG_4112', // 3. 작업공간:레이어 명
				'BBOX' : [900494.625, 1877294.5, 1030749.1875, 2039420.625], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		})
	});
	
	wms6 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8300/geoserver/sundo/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'sundo:LARD_ADM_SECT_SGG_11S', // 3. 작업공간:레이어 명
				'BBOX' : [935035.1875, 1936665.5, 972067.625, 1966987.25], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		})
	});
*/
	wms7 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'sundoB:sluice_map', // 3. 작업공간:레이어 명
				'BBOX' : [126.66444396972656, 36.93333053588867, 127.71916961669922, 38.1238899230957], 
				'SRS' : 'EPSG:4166', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		})
	});
// map.addLayer(wms7); // 맵 객체에 레이어를 추가함	


	//map.addLayer(wms2); // 맵 객체에 레이어를 추가함
	/*map.addLayer(wms3); // 맵 객체에 레이어를 추가함
	map.addLayer(wms4); // 맵 객체에 레이어를 추가함
	map.addLayer(wms5); // 맵 객체에 레이어를 추가함
	map.addLayer(wms6); // 맵 객체에 레이어를 추가함		
*/
});

