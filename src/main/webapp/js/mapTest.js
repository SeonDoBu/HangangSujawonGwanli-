var map;
var wms1;

var mapOverlay;
var container;
/*var popupContent;*/
var content;
/*var coordinate;*/
var markerVectorLayer;
var siseolVectorLayer;
var hover = null;

var wms2;
var wms3;
var wms4;
var wms5;
var wms6;
var wms7;

var vectorSource = new ol.source.Vector();
markerVectorLayer = new ol.layer.Vector({
   source: vectorSource,
});

var siseolVectorSource = new ol.source.Vector();
siseolVectorLayer = new ol.layer.Vector({
   source: siseolVectorSource,
});


function sluiceval() {
      var type5 = $("#chk9").val();   
      var  type1 = $("#chk10").val();   
      var type4 = $("#chk8").val();
      
   /*   type5 = $("#chk9").val();      
       type1 = $("#chk10").val();      
       type4 = $("#chk8").val();    */

/*   if (type5 == "1") {
         var   type5 = $("#chk9").val();
         }else if (type4 == "4") {
         var   type4 = $("#chk8").val();      
         }else if (type1 == "2") {
         var   type1 = $("#chk10").val();
         } else {
          console.log("왜안돼");
         }*/
      console.log(type5); //1
      console.log(type1);  //2
         console.log(type4); //4 
         jQuery.ajaxSettings.traditional = true;
      $.ajax({
      url: "/sluiceDataList",
      data: {type5 : type5, type1 : type1,type4 : type4},
      method: "GET",
      dataType: 'json',
      success: function(sluiceData) {
         console.log("컨트롤러 탔음");
         console.log(sluiceData);
         console.log(type5);
         console.log(type1);
         console.log(type4);
         sluiceData.forEach(function(data) {
            var id = data.sluice_id;
            var mapx = data.mapx;
            var mapy = data.mapy;
            var type = data.type;
            var name = data.name;
            var data_ymd = data.data_ymd;
            var   value00   =   data.value00;
            var   value01   =   data.value01;
            var   value02   =   data.value02;
            var   value03   =   data.value03;
            var   value04   =   data.value04;
            var   value05   =   data.value05;
            var   value06   =   data.value06;
            var   value07   =   data.value07;
            var   value08   =   data.value08;
            var   value09   =   data.value09;
            var   value10   =   data.value10;
            var   value11   =   data.value11;
            var   value12   =   data.value12;
            var   value13   =   data.value13;
            var   value14   =   data.value14;
            var   value15   =   data.value15;
            var   value16   =   data.value16;
            var   value17   =   data.value17;
            var   value18   =   data.value18;
            var   value19   =   data.value19;
            var   value20   =   data.value20;
            var   value21   =   data.value21;
            var   value22   =   data.value22;
            var   value23   =   data.value23;
            
            var marker = new ol.Feature({
               geometry: new ol.geom.Point(
                  [data.mapx, data.mapy]
               ).transform('EPSG:4326', 'EPSG:3857'),
               id: id,
               mapx: mapx,
               mapy: mapy,
               type: type,
               data_ymd:data_ymd,
               name:name,
               value00   :   value00   ,
               value01   :   value01   ,
               value02   :   value02   ,
               value03   :   value03   ,
               value04   :   value04   ,
               value05   :   value05   ,
               value06   :   value06   ,
               value07   :   value07   ,
               value08   :   value08   ,
               value09   :   value09   ,
               value10   :   value10   ,
               value11   :   value11   ,
               value12   :   value12   ,
               value13   :   value13   ,
               value14   :   value14   ,
               value15   :   value15   ,
               value16   :   value16   ,
               value17   :   value17   ,
               value18   :   value18   ,
               value19   :   value19   ,
               value20   :   value20   ,
               value21   :   value21   ,
               value22   :   value22   ,
               value23   :   value23   
            });
            var iconStyle = new ol.style.Style({
               image: new ol.style.Icon(({
                  anchor: [0.5, 0.96],
                  scale: 0.1,
                  src: 'images/free-icon.png'
               })),
               zindex: 10
            });
            marker.setStyle(iconStyle);
            vectorSource.addFeature(marker);
         });
         console.log("관측소 정보 가져왔음");
         /*   map.addLayer(markerVectorLayer);*/
         console.log("관측소 레이어 추가");
      },
      error: function() {
         console.log("관측소 정보 가져오지 못했습니다.");
      }
   })
}

$(document).ready(function() {
	console.log("document.ready");
   map = new ol.Map({ // OpenLayer의 맵 객체를 생성한다.
      target: 'map', // 맵 객체를 연결하기 위한 target으로 <div>의 id값을 지정해준다.
      layers: [ // 지도에서 사용 할 레이어의 목록을 정희하는 공간이다.
         new ol.layer.Tile({
            source: new ol.source.OSM({
               url: 'https://api.vworld.kr/req/wmts/1.0.0/828A2304-9683-3843-9B9B-3D3660554AC8/Base/{z}/{y}/{x}.png'
					// vworld의 지도를 가져온다.
            })
         })
      ],
      view: new ol.View({ // 지도가 보여 줄 중심좌표, 축소, 확대 등을 설정한다. 보통은 줌, 중심좌표를 설정하는 경우가 많다.
         center: ol.proj.fromLonLat([126.9784, 37.56681]),
         zoom: 9,
         minZoom: 7,
		 maxZoom: 18
      })
   });

   var ctrl = new ol.control.Scale({});
   map.addControl(ctrl);
   map.addControl(new ol.control.ScaleLine());

   mapOverlay = new ol.Overlay({
      element: container,
      autoPan: true,
      autoPanAnimation: {
         duration: 250
      }
   });
   container = document.getElementById('popup'); //팝업 컨테이너
   popupContent = document.getElementById('popup-content'); //팝업 내용

   console.log("map");
   wms1 = new ol.layer.Tile({
      source: new ol.source.TileWMS({
         url: 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
         params: {
            'VERSION': '1.1.0', // 2. 버전
            'LAYERS': 'sundoB:LSMD_CONT_UJ201_11_202310', // 3. 작업공간:레이어 명
            'BBOX': [179271.578125, 437187.78125, 215578.53125, 465761.4375],
            'SRS': 'EPSG:5174', // SRID
            'FORMAT': 'image/png' // 포맷
         },
         serverType: 'geoserver',
      })
   });

   console.log("wms1 추가");

   

   map.on('singleclick', function(evt) { //마우스 올렸을 때
      var coordinate = evt.coordinate; //마우스가 올려진 좌표값
      lon = coordinate[0];
      lat = coordinate[1];
      map.getTargetElement().style.cursor = map.hasFeatureAtPixel(evt.pixel) ? 'pointer' : '';
      if (hover != null) {
         hover = null;
      }

      map.forEachFeatureAtPixel(evt.pixel, function(f) {
         hover = f;
         return true;
      });
      if (hover) {
         var content = '<form action="ObservDataList" method="POST">'
         + "<div class='__float-tbl' id='my_div'>관측소 번호 : " + hover.get('id')
			+ "<input type='hidden' name='sluice_id' value='"+hover.get('id')+"'>"
            + "<br>경도:" + hover.get('mapx') + "<br>위도:" + hover.get('mapy')
         /*   +"<div>type = 1 강수량만 나오게 </div>"*/
            + " <br><button style='background-color: #2a5dc5; border: 0px;' type='button' onclick='alert()'>"
            + '<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16" style="background-color: #2a5dc5;">'
            + '<path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>'
            + '</svg>'
            + "</button>"
            + "<input type='button'    value='닫기'  onclick='deleteDiv()'>"
         /*   +'    <input type="submit" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal1">'   
            +"강수량</button>'"*/
   +'   </form></div>';
         popupContent.innerHTML = content;
         mapOverlay.setPosition(lon, lat);
         mapOverlay.setOffset(lon, lat);
         mapOverlay.setPositioning(lon, lat);
         map.addOverlay(mapOverlay);
         console.log(mapOverlay);
      } else {
         popupContent.innerHTML = '';
      }
   });



   wms2 = new ol.layer.Tile({
      source: new ol.source.TileWMS({
         url: 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
         params: {
            'VERSION': '1.1.0', // 2. 버전
            'LAYERS': 'sundoB:LSMD_CONT_UJ201_41_202310', // 3. 작업공간:레이어 명
            'BBOX': [158046.8125, 377790.5, 270626.21875, 526259.5],
            'SRS': 'EPSG:5174', // SRID
            'FORMAT': 'image/png' // 포맷
         },
         serverType: 'geoserver',
      })
   });



   wms3 = new ol.layer.Tile({
      source: new ol.source.TileWMS({
         url: 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
         params: {
            'VERSION': '1.1.0', // 2. 버전
            'LAYERS': 'sundoB:LSMD_CONT_UM730_11_202310', // 3. 작업공간:레이어 명
            'BBOX': [179119.90625, 436844.4375, 215834.421875, 465874.875],
            'SRS': 'EPSG:5174', // SRID
            'FORMAT': 'image/png' // 포맷
         },
         serverType: 'geoserver',
      })
   });



   wms4 = new ol.layer.Tile({
      source: new ol.source.TileWMS({
         url: 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
         params: {
            'VERSION': '1.1.0', // 2. 버전
            'LAYERS': 'sundoB:LSMD_CONT_UM730_41_202310', // 3. 작업공간:레이어 명
            'BBOX': [157399.453125, 397699.84375, 271335.40625, 514954.8125],
            'SRS': 'EPSG:5174', // SRID
            'FORMAT': 'image/png' // 포맷
         },
         serverType: 'geoserver',
      })
   });

   wms5 = new ol.layer.Tile({
      source: new ol.source.TileWMS({
         url: 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
         params: {
            'VERSION': '1.1.0', // 2. 버전
            'LAYERS': 'sundoB:LARD_ADM_SECT_SGG_41S', // 3. 작업공간:레이어 명
            'BBOX': [900494.625, 1877294.5, 1030749.1875, 2039420.625],
            'SRS': 'EPSG:5174', // SRID
            'FORMAT': 'image/png' // 포맷
         },
         serverType: 'geoserver',
      })
   });

   wms6 = new ol.layer.Tile({
      source: new ol.source.TileWMS({
         url: 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
         params: {
            'VERSION': '1.1.0', // 2. 버전
            'LAYERS': 'sundoB:LARD_ADM_SECT_SGG_11S', // 3. 작업공간:레이어 명
            'BBOX': [935035.1875, 1936665.5, 972067.625, 1966987.25],
            'SRS': 'EPSG:5174', // SRID
            'FORMAT': 'image/png'    // 포맷
         },
         serverType: 'geoserver',
      })
   });

   wms7 = new ol.layer.Tile({
      source: new ol.source.TileWMS({
         url: 'http://localhost:8383/geoserver/sundoB/wms?service=WMS', // 1. 레이어 URL
         params: {
            'VERSION': '1.1.0', // 2. 버전
            'LAYERS': 'sundoB:sluice_map', // 3. 작업공간:레이어 명
            'BBOX': [126.66444396972656, 36.93333053588867, 127.71916961669922, 38.1238899230957],
            'SRS': 'EPSG:4166', // SRID
            'FORMAT': 'image/png' // 포맷
         },
         serverType: 'geoserver',
      })
   });

   /*   map.addLayer(wms7); // 맵 객체에 레이어를 추가함   관측소 점
   map.addLayer(wms1); // 맵 객체에 레이어를 추가함
      map.addLayer(wms2); // 맵 객체에 레이어를 추가함
      map.addLayer(wms3); // 맵 객체에 레이어를 추가함
      map.addLayer(wms4); // 맵 객체에 레이어를 추가함
      map.addLayer(wms5); // 맵 객체에 레이어를 추가함
      map.addLayer(wms6); // 맵 객체에 레이어를 추가함      */
	
	getSiseolLayer();

});

function getSiseolLayer() {
	map.removeLayer(siseolVectorLayer);
	
	var siseolVectorSource = new ol.source.Vector();
	siseolVectorLayer = new ol.layer.Vector({
	   source: siseolVectorSource,
	});
	
	let sc1; let sc2; let sc3; let sc4;
	
	if(document.getElementById('chkSiseol1').checked) {
		sc1 = "1";
	} else {
		sc1 = "0";
	}
	
	if(document.getElementById('chkSiseol2').checked) {
		sc2 = "1";
	} else {
		sc2 = "0";
	}
	
	if(document.getElementById('chkSiseol3').checked) {
		sc3 = "1";
	} else {
		sc3 = "0";
	}
	
	if(document.getElementById('chkSiseol4').checked) {
		sc4 = "1";
	} else {
		sc4 = "0";
	}
	
	$.ajax({
		url:"/siseolDataList",
		method:"GET",
		data:{sc1:sc1, sc2:sc2, sc3:sc3, sc4:sc4},
		dataType:"json",
		success: function(siseolData) {
			console.log(siseolData);
			siseolData.forEach(function(data) {
				var id = data.siseol_id;
				var mapx = data.mapx;
				var mapy = data.mapy;
				var marker = new ol.Feature({
					geometry: new ol.geom.Point(
						[data.mapx, data.mapy]
					).transform('EPSG:4326', 'EPSG:3857'),
					id: id,
					mapx:mapx,
					mapy:mapy,
				});
				
				var src; 
				if(data.small_code == '1') {
					src = 'images/pochaco1.png'
				} else if(data.small_code == '2') {
					src = 'images/pochaco2.png'
				} else if(data.small_code == '3') {
					src = 'images/pochaco3.png'
				} else if(data.small_code == '4') {
					src = 'images/pochaco4.png'
				}
				
				var iconStyle = new ol.style.Style({
					image: new ol.style.Icon(({
						anchor: [0.5, 0.96],
						scale: 0.1,
						src: src
					})),
					zindex: 10
				});
				marker.setStyle(iconStyle);
				siseolVectorSource.addFeature(marker);
			});
			map.addLayer(siseolVectorLayer);
			console.log("시설물 레이어 추가");
		},
		error: function() {
			console.log("시설물 정보 가져오지 못했습니다.");
		}
	});

}