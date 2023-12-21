var map;
var wms1;
var wms2;
var wms3;
var wms4;
var wms5;
var wms6;

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
	      zoom: 9
	    })
	});
		wms1 = new ol.layer.Tile({
		source : new ol.source.TileWMS({
			url : 'http://localhost:8300/geoserver/sundo/wms?service=WMS', // 1. 레이어 URL
			params : {
				'VERSION' : '1.1.0', // 2. 버전
				'LAYERS' : 'sundo:LSMD_CONT_UJ201_11_202310', // 3. 작업공간:레이어 명
				'BBOX' : [179271.578125, 437187.78125, 215578.53125, 465761.4375], 
				'SRS' : 'EPSG:5174', // SRID
				'FORMAT' : 'image/png' // 포맷
			},
			serverType : 'geoserver',
		})
	});
	
		
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
	
	
	map.addLayer(wms1); // 맵 객체에 레이어를 추가함
	map.addLayer(wms2); // 맵 객체에 레이어를 추가함
	map.addLayer(wms3); // 맵 객체에 레이어를 추가함
	map.addLayer(wms4); // 맵 객체에 레이어를 추가함
	map.addLayer(wms5); // 맵 객체에 레이어를 추가함
	map.addLayer(wms6); // 맵 객체에 레이어를 추가함		
});

