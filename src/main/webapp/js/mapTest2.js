var wms1;
var wms2;
var wms3;
var wms4; //ㅇㄹㅇ
let map;

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
	      center: ol.proj.fromLonLat([126.9452, 37.55659]),
	      zoom: 11
	    })
	});
	
	wms1 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8500/geoserver/gis_test/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'gis_test:Gyeonggi', // 3. 작업공간:레이어 명
				'BBOX' : [126.51725769042969, 37.07951354980469, 127.80809020996094, 38.13747787475586], 
				'SRS' : 'EPSG:4326', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		}),
		visible: true // false - true로 제어
		
	});
/*	
	wms2 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8383/geoserver/cite/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'cite:LSMD_CONT_UJ201_41_202310', // 3. 작업공간:레이어 명
				'BBOX' : [158046.8125, 377790.5, 270626.21875, 526259.5], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		}),
		visible: true // false - true로 제어
		
	});
	
	wms3 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8383/geoserver/cite/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'cite:LSMD_CONT_UM730_11_202310', // 3. 작업공간:레이어 명
				'BBOX' : [179119.90625, 436844.4375, 215834.421875, 465874.875], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		}),
		visible: true // false - true로 제어
		
	});
	
	wms4 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8383/geoserver/cite/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'cite:LSMD_CONT_UJ201_11_202310', // 3. 작업공간:레이어 명
				'BBOX' : [179271.578125, 437187.78125, 215578.53125, 465761.4375], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		}),
		visible: true // false - true로 제어
		
	});
*/	
	map.addLayer(wms1); // 맵 객체에 레이어를 추가함
/*
	map.addLayer(wms2);
	map.addLayer(wms3);
	map.addLayer(wms4);
	*/
	console.log("mapTest.js");
	
});