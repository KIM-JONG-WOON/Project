<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../includes/heejin/header.jsp" %> 








	<div id="banner-area" class="banner-area"
		style="background-image: url(/resources/heejin/constra/images/banner/banner1.jpg)">
		<div class="banner-text">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="banner-heading">
							<h1 class="banner-title" style="text-shadow: 4px 4px 3px #000;">캠핑장 검색</h1>
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb justify-content-center">
									<!-- <li class="breadcrumb-item"><a href="#">Home</a></li>
                      <li class="breadcrumb-item"><a href="#">Company</a></li> -->
									<li class="breadcrumb-item active" aria-current="page" style="text-shadow: 4px 4px 3px #000;">Search Page</li>
								</ol>
							</nav>
						</div>
					</div>
					<!-- Col end -->
				</div>
				<!-- Row end -->
			</div>
			<!-- Container end -->
		</div>
		<!-- Banner text end -->
	</div>
	<!-- Banner area end -->



	<section id="main-container" class="main-container">
		<div class="container">

			<!-- <div class="row text-center">
				<div class="col-12">
					<h2 class="section-title">Reaching our Campsite</h2>
					<h3 class="section-sub-title">캠핑장 찾기</h3>
				</div>
			</div> -->
			<!--/ Title row end -->




			<div class="row">
				<div class="col-md-6">
					<div id="datepicker" style="width: 100%;"></div>



				</div>
				<div class="col-md-6">
					<!-- <h3 class="column-title">We love to hear</h3> -->
					<!-- contact form works with formspree.io  -->
					<!-- contact form activation doc: https://docs.themefisher.com/constra/contact-form/ -->
					<form id="searchForm" method="get" role="form" action="/camp/search">
						<div class="error-container"></div>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<label>키워드</label> <input class="form-control" name="keyword"
										id="keyword" placeholder="" type="text" value='<c:out value="${criteria.keyword }"/>'>
								</div>
							</div>
							<div class="col-6">
								<div class="form-group">
									<label>지역</label>
									<!-- <input class="form-control" name="email" id="email" placeholder="" type="email"> -->
									<select class="form-control" name="region">
										<option value="" <c:out value="${criteria.region==null?'selected':'' }"/>>선택</option>
										<option value="서울시" <c:out value="${criteria.region eq '서울시'?'selected':'' }"/>>서울</option>
										<option value="부산시" <c:out value="${criteria.region eq '부산시'?'selected':'' }"/>>부산</option>
										<option value="대구시" <c:out value="${criteria.region eq '대구시'?'selected':'' }"/>>대구</option>
										<option value="인천시" <c:out value="${criteria.region eq '인천시'?'selected':'' }"/>>인천</option>
										<option value="광주시" <c:out value="${criteria.region eq '광주시'?'selected':'' }"/>>광주</option>
										<option value="대전시" <c:out value="${criteria.region eq '대전시'?'selected':'' }"/>>대전</option>
										<option value="울산시" <c:out value="${criteria.region eq '울산시'?'selected':'' }"/>>울산</option>
										<option value="세종시" <c:out value="${criteria.region eq '세종시'?'selected':'' }"/>>세종</option>
										<option value="경기도" <c:out value="${criteria.region eq '경기도'?'selected':'' }"/>>경기</option>
										<option value="강원도" <c:out value="${criteria.region eq '강원도'?'selected':'' }"/>>강원</option>
										<option value="충청북도" <c:out value="${criteria.region eq '충청북도'?'selected':'' }"/>>충북</option>
										<option value="충청남도" <c:out value="${criteria.region eq '충청남도'?'selected':'' }"/>>충남</option>
										<option value="전라북도" <c:out value="${criteria.region eq '전라북도'?'selected':'' }"/>>전북</option>
										<option value="전라남도" <c:out value="${criteria.region eq '전라남도'?'selected':'' }"/>>전남</option>
										<option value="경상북도" <c:out value="${criteria.region eq '경상북도'?'selected':'' }"/>>경북</option>
										<option value="경상남도" <c:out value="${criteria.region eq '경상남도'?'selected':'' }"/>>경남</option>
										<option value="제주도" <c:out value="${criteria.region eq '제주도'?'selected':'' }"/>>제주</option>

									</select>
								</div>
							</div>
							<div class="col-6">
								<div class="form-group">
									<label>테마</label>
									<!-- <input class="form-control form-control-subject" name="subject" id="subject" placeholder=""> -->
									<select class="form-control" name="theme">
										<option value="" <c:out value="${criteria.theme==null?'selected':'' }"/>>선택</option>
										<option value="해변" <c:out value="${criteria.theme eq '해변'?'selected':'' }"/>>해변</option>
										<option value="섬" <c:out value="${criteria.theme eq '섬'?'selected':'' }"/>>섬</option>
										<option value="산" <c:out value="${criteria.theme eq '산'?'selected':'' }"/>>산</option>
										<option value="숲" <c:out value="${criteria.theme eq '숲'?'selected':'' }"/>>숲</option>
										<option value="계곡" <c:out value="${criteria.theme eq '계곡'?'selected':'' }"/>>계곡</option>
										<option value="강" <c:out value="${criteria.theme eq '강'?'selected':'' }"/>>강</option>
										<option value="호수" <c:out value="${criteria.theme eq '호수'?'selected':'' }"/>>호수</option>
										<option value="도심" <c:out value="${criteria.theme eq '도심'?'selected':'' }"/>>도심</option>
									</select>
								</div>
							</div>
						</div>
						<br>
						<div class="text-right">
							<br>
							<button class="btn btn-primary solid blank">검색하기</button>
						</div>
					</form>
				</div>

			</div>
			<!-- Content row -->

			<div class="gap-40"></div>

			<form id='resForm' action="/camp/res" method="get">
			</form>
			
			
			<div class="map_wrap">
				<div id="kakao-map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<!-- <div class="option">
                <div>
                    <form onsubmit="searchPlaces(); return false;">
                        키워드 : <input type="text" value="TIS정보" id="keyword" size="15"> 
                        <button type="submit">검색하기</button> 
                    </form>
                </div>
            </div>
            <hr> -->

					<ul id="placesList">
					<c:forEach items="${list }" var="camp" varStatus="status">
							
							<li class="item"><span
								class="markerbg marker_<c:out value="${status.count }"/>"></span>
								
								<a class="resLink" href="${camp.cno }">
								<div class="info">
									<h5 class="cname">
										<c:out value="${camp.cname }" />
									</h5>
									<span><c:out value="${camp.site }" /></span> 
									<span class="tel"><c:out value="${camp.phoneNumber }" /></span>
									<span class="lat" hidden="hidden"><c:out value="${camp.lat }"/></span>
									<span class="lng" hidden="hidden"><c:out value="${camp.lng }"/></span>
								</div>
								</a>
								</li>
						
					</c:forEach>
					</ul>




					<div id="pagination"></div>
				</div>
			</div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fe2dd86531a6844a5dfe9d9e58e8b74&libraries=services"></script>
			<script>
				// 마커를 담을 배열입니다
				var markers = [];
				
				var mapContainer = document.getElementById('kakao-map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();

				// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					zIndex : 1
				});
				
				var menuEl = document.getElementById('menu_wrap');
				var itemEl = document.getElementsByClassName('item');
				var bounds = new kakao.maps.LatLngBounds();
				
				// 키워드로 장소를 검색합니다
				//searchPlaces();
				
				
							
				
				var campName = document.getElementsByClassName('cname');
				var campLat = document.getElementsByClassName('lat');
		        var campLng = document.getElementsByClassName('lng');
				
		        
		        if(campLat.length > 0){
				for(var i=0; i<campLat.length; i++){
					
					
					var campPosition = new kakao.maps.LatLng(campLat[i].innerHTML, campLng[i].innerHTML);
					var marker = addMarker(campPosition, i);
					
					bounds.extend(campPosition);
					
					(function (marker, title) {
			              kakao.maps.event.addListener(marker, 'mouseover', function () {
			                displayInfowindow(marker, title);
			              });

			              kakao.maps.event.addListener(marker, 'mouseout', function () {
			                infowindow.close();
			              });

			              itemEl[i].onmouseover = function () {
			                displayInfowindow(marker, title);
			              };

			              itemEl[i].onmouseout = function () {
			                infowindow.close();
			              };
			            })(marker, campName[i].innerHTML);
			            //marker와  place_name이 매개변수
					
					
				}
				
				menuEl.scrollTop = 0;
				
				map.setBounds(bounds);
				
				
		        }
				// 키워드 검색을 요청하는 함수입니다
				function searchPlaces() {

					var keyword = document.getElementById('keyword').value;

					if (!keyword.replace(/^\s+|\s+$/g, '')) {
						alert('키워드를 입력해주세요!');
						return false;
					}

					// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
					ps.keywordSearch(keyword, placesSearchCB);
				}

				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

						// 정상적으로 검색이 완료됐으면
						// 검색 목록과 마커를 표출합니다
						displayPlaces(data);

						// 페이지 번호를 표출합니다
						displayPagination(pagination);

					} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

						alert('검색 결과가 존재하지 않습니다.');
						return;

					} else if (status === kakao.maps.services.Status.ERROR) {

						alert('검색 결과 중 오류가 발생했습니다.');
						return;

					}
				}

				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces(places) {

					//검색결과 목록 관련
					var listEl = document.getElementById('placesList'), menuEl = document
							.getElementById('menu_wrap'), fragment = document
							.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

					
					
					
					
					
					// 검색 결과 목록에 추가된 항목들을 제거합니다
					removeAllChildNods(listEl);

					// 지도에 표시되고 있는 마커를 제거합니다
					removeMarker();

					for (var i = 0; i < places.length; i++) {

						// 마커를 생성하고 지도에 표시합니다
						var placePosition = new kakao.maps.LatLng(places[i].y,
								places[i].x), marker = addMarker(placePosition,
								i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						bounds.extend(placePosition);

						// 마커와 검색결과 항목에 mouseover 했을때
						// 해당 장소에 인포윈도우에 장소명을 표시합니다
						// mouseout 했을 때는 인포윈도우를 닫습니다
						(function(marker, title) {
							kakao.maps.event.addListener(marker, 'mouseover',
									function() {
										displayInfowindow(marker, title);
									});

							kakao.maps.event.addListener(marker, 'mouseout',
									function() {
										infowindow.close();
									});

							itemEl.onmouseover = function() {
								displayInfowindow(marker, title);
							};

							itemEl.onmouseout = function() {
								infowindow.close();
							};
						})(marker, places[i].place_name);

						fragment.appendChild(itemEl);
					}

					// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
					listEl.appendChild(fragment);
					menuEl.scrollTop = 0;

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);
				}

				// 검색결과 항목을 Element로 반환하는 함수입니다
				function getListItem(index, places) {

					var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
							+ (index + 1)
							+ '"></span>'
							+ '<div class="info">'
							+ '   <h5>' + places.place_name + '</h5>';

					if (places.road_address_name) {
						itemStr += '    <span>' + places.road_address_name
								+ '</span>' + '   <span class="jibun gray">'
								+ places.address_name + '</span>';
					} else {
						itemStr += '    <span>' + places.address_name
								+ '</span>';
					}

					itemStr += '  <span class="tel">' + places.phone
							+ '</span>' + '</div>';

					el.innerHTML = itemStr;
					el.className = 'item';

					return el;
				}

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, idx, title) {
					var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
					imgOptions = {
						spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
						spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset : new kakao.maps.Point(13, 37)
					// 마커 좌표에 일치시킬 이미지 내에서의 좌표
					}, markerImage = new kakao.maps.MarkerImage(imageSrc,
							imageSize, imgOptions), marker = new kakao.maps.Marker(
							{
								position : position, // 마커의 위치
								image : markerImage
							});

					marker.setMap(map); // 지도 위에 마커를 표출합니다
					markers.push(marker); // 배열에 생성된 마커를 추가합니다

					return marker;
				}

				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null);
					}
					markers = [];
				}

				// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
				function displayPagination(pagination) {
					var paginationEl = document.getElementById('pagination'), fragment = document
							.createDocumentFragment(), i;

					// 기존에 추가된 페이지번호를 삭제합니다
					while (paginationEl.hasChildNodes()) {
						paginationEl.removeChild(paginationEl.lastChild);
					}

					for (i = 1; i <= pagination.last; i++) {
						var el = document.createElement('a');
						el.href = "#";
						el.innerHTML = i;

						if (i === pagination.current) {
							el.className = 'on';
						} else {
							el.onclick = (function(i) {
								return function() {
									pagination.gotoPage(i);
								}
							})(i);
						}

						fragment.appendChild(el);
					}
					paginationEl.appendChild(fragment);
				}

				// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
				// 인포윈도우에 장소명을 표시합니다
				function displayInfowindow(marker, title) {
					var content = '<div style="padding:5px;z-index:1;">'
							+ title + '</div>';

					infowindow.setContent(content);
					infowindow.open(map, marker);
				}

				// 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {
					while (el.hasChildNodes()) {
						el.removeChild(el.lastChild);
					}
				}
			</script>







			<!-- <div id="kakao-map" style="width:50%;height:600px;"></div>
    <script>
		var container = document.getElementById('kakao-map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>  -->

			<div class="gap-40"></div>

			<%-- <c:forEach items="${list}" var="camp">
				<tr>
					<td><c:out value="${camp.cno}" /></td>
					<td><a class="move" href='<c:out value="${camp.cno}"/>'> <c:out
								value="${camp.cname}" /> <c:out value="${camp.site}" />
					</a></td>
					<td><c:out value="${camp.phoneNumber}" /></td>
					<td><c:out value="${camp.facility}" /></td>
					<td><c:out value="${camp.theme}" /></td>
					<td><c:out value="${camp.price}" /></td>
					<td><c:out value="${camp.lat}" /></td>
					<td><c:out value="${camp.lng}" /></td>

				</tr>
				<br>
			</c:forEach> --%>




		</div>
		<!-- Conatiner end -->
	</section>
	<!-- Main container end -->




	<!-- Javascript Files
  ================================================== -->

	


	<!-- datepicker  -->
	<script type="text/javascript">
		
	$.datepicker.setDefaults({
		dateFormat : 'yymmdd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'
	});

	$(function() {
		$("#datepicker").datepicker();
	});
		

		//search버튼
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			e.preventDefault();
			/* if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			} */

			/* if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			} */

			//첫페이지로 이동
			searchForm.submit();

		});
		
		var resForm = $("#resForm");
		$(".resLink").on("click", function(e){
			e.preventDefault();
			resForm.append("<input type='hidden' name ='cno' value='"+$(this).attr("href")+"'>");
			resForm.attr("action","/camp/res");
			resForm.submit();
			
		});
	</script>
	<!-- Body inner end -->
	<%@ include file="../includes/heejin/footer.jsp" %>   