<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<html>
<head>


<title>积分商城</title>

<meta name="keywords" content="理财返利平台,P2P返利,网贷返利,理财返利,金融返利">
<meta name="description"
	content="返利网-是国内领先的互联网金融理财返利平台,专注于理财返利、网贷返利、p2p返利网、2014年在国内率先推出理财返利平台概念现已成为网贷返利平台领导者！">
<link href="${ctx}/CQW/JFstore/bootstrap.css" rel="stylesheet">
<link href="${ctx}/CQW/JFstore/personal.css" rel="stylesheet">
<link href="${ctx}/CQW/JFstore/site.css" rel="stylesheet">
<link href="${ctx}/CQW/JFstore/forum.css" rel="stylesheet">
<link href="${ctx}/CQW/JFstore/cropbox.css" rel="stylesheet">
<link href="${ctx}/CQW/JFstore/dropload.css" rel="stylesheet">
<%-- <link href="${ctx}/CQW/JFstore/bootstrap-slider.css" rel="stylesheet"> --%>
<link href="${ctx}/CQW/JFstore/toastr.css" rel="stylesheet">
<link href="${ctx}/CQW/JFstore/guide.css" rel="stylesheet">
<link href="${ctx}/CQW/JFstore/liMarquee.css" rel="stylesheet">


<%-- <link rel="stylesheet" href="${ctx}/CQW/JFstore/skin/layer.css" type="text/css"></link>
  --%>

<style class="firebugResetStyles" type="text/css" charset="utf-8">

/** reset styling **/
.firebugResetStyles {
	z-index: 2147483646 !important;
	top: 0 !important;
	left: 0 !important;
	display: block !important;
	border: 0 none !important;
	margin: 0 !important;
	padding: 0 !important;
	outline: 0 !important;
	min-width: 0 !important;
	max-width: none !important;
	min-height: 0 !important;
	max-height: none !important;
	position: fixed !important;
	transform: rotate(0deg) !important;
	transform-origin: 50% 50% !important;
	border-radius: 0 !important;
	box-shadow: none !important;
	background: transparent none !important;
	pointer-events: none !important;
	white-space: normal !important;
}

style.firebugResetStyles {
	display: none !important;
}

.firebugBlockBackgroundColor {
	background-color: transparent !important;
}

.firebugResetStyles:before,.firebugResetStyles:after {
	content: "" !important;
}

/**actual styling to be modified by firebug theme**/
.firebugCanvas {
	display: none !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.firebugLayoutBox {
	width: auto !important;
	position: static !important;
}

.firebugLayoutBoxOffset {
	opacity: 0.8 !important;
	position: fixed !important;
}

.firebugLayoutLine {
	opacity: 0.4 !important;
	background-color: #000000 !important;
}

.firebugLayoutLineLeft,.firebugLayoutLineRight {
	width: 1px !important;
	height: 100% !important;
}

.firebugLayoutLineTop,.firebugLayoutLineBottom {
	width: 100% !important;
	height: 1px !important;
}

.firebugLayoutLineTop {
	margin-top: -1px !important;
	border-top: 1px solid #999999 !important;
}

.firebugLayoutLineRight {
	border-right: 1px solid #999999 !important;
}

.firebugLayoutLineBottom {
	border-bottom: 1px solid #999999 !important;
}

.firebugLayoutLineLeft {
	margin-left: -1px !important;
	border-left: 1px solid #999999 !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.firebugLayoutBoxParent {
	border-top: 0 none !important;
	border-right: 1px dashed #E00 !important;
	border-bottom: 1px dashed #E00 !important;
	border-left: 0 none !important;
	position: fixed !important;
	width: auto !important;
}

.firebugRuler {
	position: absolute !important;
}

.firebugRulerH {
	top: -15px !important;
	left: 0 !important;
	width: 100% !important;
	height: 14px !important;
	background:
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%13%88%00%00%00%0E%08%02%00%00%00L%25a%0A%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%04%F8IDATx%DA%EC%DD%D1n%E2%3A%00E%D1%80%F8%FF%EF%E2%AF2%95%D0D4%0E%C1%14%B0%8Fa-%E9%3E%CC%9C%87n%B9%81%A6W0%1C%A6i%9A%E7y%0As8%1CT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AATE9%FE%FCw%3E%9F%AF%2B%2F%BA%97%FDT%1D~K(%5C%9D%D5%EA%1B%5C%86%B5%A9%BDU%B5y%80%ED%AB*%03%FAV9%AB%E1%CEj%E7%82%EF%FB%18%BC%AEJ8%AB%FA'%D2%BEU9%D7U%ECc0%E1%A2r%5DynwVi%CFW%7F%BB%17%7Dy%EACU%CD%0E%F0%FA%3BX%FEbV%FEM%9B%2B%AD%BE%AA%E5%95v%AB%AA%E3E5%DCu%15rV9%07%B5%7F%B5w%FCm%BA%BE%AA%FBY%3D%14%F0%EE%C7%60%0EU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5JU%88%D3%F5%1F%AE%DF%3B%1B%F2%3E%DAUCNa%F92%D02%AC%7Dm%F9%3A%D4%F2%8B6%AE*%BF%5C%C2Ym~9g5%D0Y%95%17%7C%C8c%B0%7C%18%26%9CU%CD%13i%F7%AA%90%B3Z%7D%95%B4%C7%60%E6E%B5%BC%05%B4%FBY%95U%9E%DB%FD%1C%FC%E0%9F%83%7F%BE%17%7DkjMU%E3%03%AC%7CWj%DF%83%9An%BCG%AE%F1%95%96yQ%0Dq%5Dy%00%3Et%B5'%FC6%5DS%95pV%95%01%81%FF'%07%00%00%00%00%00%00%00%00%00%F8x%C7%F0%BE%9COp%5D%C9%7C%AD%E7%E6%EBV%FB%1E%E0(%07%E5%AC%C6%3A%ABi%9C%8F%C6%0E9%AB%C0'%D2%8E%9F%F99%D0E%B5%99%14%F5%0D%CD%7F%24%C6%DEH%B8%E9rV%DFs%DB%D0%F7%00k%FE%1D%84%84%83J%B8%E3%BA%FB%EF%20%84%1C%D7%AD%B0%8E%D7U%C8Y%05%1E%D4t%EF%AD%95Q%BF8w%BF%E9%0A%BF%EB%03%00%00%00%00%00%00%00%00%00%B8vJ%8E%BB%F5%B1u%8Cx%80%E1o%5E%CA9%AB%CB%CB%8E%03%DF%1D%B7T%25%9C%D5(%EFJM8%AB%CC'%D2%B2*%A4s%E7c6%FB%3E%FA%A2%1E%80~%0E%3E%DA%10x%5D%95Uig%15u%15%ED%7C%14%B6%87%A1%3B%FCo8%A8%D8o%D3%ADO%01%EDx%83%1A~%1B%9FpP%A3%DC%C6'%9C%95gK%00%00%00%00%00%00%00%00%00%20%D9%C9%11%D0%C0%40%AF%3F%EE%EE%92%94%D6%16X%B5%BCMH%15%2F%BF%D4%A7%C87%F1%8E%F2%81%AE%AAvzr%DA2%ABV%17%7C%E63%83%E7I%DC%C6%0Bs%1B%EF6%1E%00%00%00%00%00%00%00%00%00%80cr%9CW%FF%7F%C6%01%0E%F1%CE%A5%84%B3%CA%BC%E0%CB%AA%84%CE%F9%BF)%EC%13%08WU%AE%AB%B1%AE%2BO%EC%8E%CBYe%FE%8CN%ABr%5Dy%60~%CFA%0D%F4%AE%D4%BE%C75%CA%EDVB%EA(%B7%F1%09g%E5%D9%12%00%00%00%00%00%00%00%00%00H%F6%EB%13S%E7y%5E%5E%FB%98%F0%22%D1%B2'%A7%F0%92%B1%BC%24z3%AC%7Dm%60%D5%92%B4%7CEUO%5E%F0%AA*%3BU%B9%AE%3E%A0j%94%07%A0%C7%A0%AB%FD%B5%3F%A0%F7%03T%3Dy%D7%F7%D6%D4%C0%AAU%D2%E6%DFt%3F%A8%CC%AA%F2%86%B9%D7%F5%1F%18%E6%01%F8%CC%D5%9E%F0%F3z%88%AA%90%EF%20%00%00%00%00%00%00%00%00%00%C0%A6%D3%EA%CFi%AFb%2C%7BB%0A%2B%C3%1A%D7%06V%D5%07%A8r%5D%3D%D9%A6%CAu%F5%25%CF%A2%99%97zNX%60%95%AB%5DUZ%D5%FBR%03%AB%1C%D4k%9F%3F%BB%5C%FF%81a%AE%AB'%7F%F3%EA%FE%F3z%94%AA%D8%DF%5B%01%00%00%00%00%00%00%00%00%00%8E%FB%F3%F2%B1%1B%8DWU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*UiU%C7%BBe%E7%F3%B9%CB%AAJ%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5*%AAj%FD%C6%D4%5Eo%90%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5%86%AF%1B%9F%98%DA%EBm%BBV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%AD%D6%E4%F58%01%00%00%00%00%00%00%00%00%00%00%00%00%00%40%85%7F%02%0C%008%C2%D0H%16j%8FX%00%00%00%00IEND%AEB%60%82")
		repeat-x !important;
	border-top: 1px solid #BBBBBB !important;
	border-right: 1px dashed #BBBBBB !important;
	border-bottom: 1px solid #000000 !important;
}

.firebugRulerV {
	top: 0 !important;
	left: -15px !important;
	width: 14px !important;
	height: 100% !important;
	background:
		url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%0E%00%00%13%88%08%02%00%00%00%0E%F5%CB%10%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%06~IDATx%DA%EC%DD%D1v%A20%14%40Qt%F1%FF%FF%E4%97%D9%07%3BT%19%92%DC%40(%90%EEy%9A5%CB%B6%E8%F6%9Ac%A4%CC0%84%FF%DC%9E%CF%E7%E3%F1%88%DE4%F8%5D%C7%9F%2F%BA%DD%5E%7FI%7D%F18%DDn%BA%C5%FB%DF%97%BFk%F2%10%FF%FD%B4%F2M%A7%FB%FD%FD%B3%22%07p%8F%3F%AE%E3%F4S%8A%8F%40%EEq%9D%BE8D%F0%0EY%A1Uq%B7%EA%1F%81%88V%E8X%3F%B4%CEy%B7h%D1%A2E%EBohU%FC%D9%AF2fO%8BBeD%BE%F7X%0C%97%A4%D6b7%2Ck%A5%12%E3%9B%60v%B7r%C7%1AI%8C%BD%2B%23r%00c0%B2v%9B%AD%CA%26%0C%1Ek%05A%FD%93%D0%2B%A1u%8B%16-%95q%5Ce%DCSO%8E%E4M%23%8B%F7%C2%FE%40%BB%BD%8C%FC%8A%B5V%EBu%40%F9%3B%A72%FA%AE%8C%D4%01%CC%B5%DA%13%9CB%AB%E2I%18%24%B0n%A9%0CZ*Ce%9C%A22%8E%D8NJ%1E%EB%FF%8F%AE%CAP%19*%C3%BAEKe%AC%D1%AAX%8C*%DEH%8F%C5W%A1e%AD%D4%B7%5C%5B%19%C5%DB%0D%EF%9F%19%1D%7B%5E%86%BD%0C%95%A12%AC%5B*%83%96%CAP%19%F62T%86%CAP%19*%83%96%CA%B8Xe%BC%FE)T%19%A1%17xg%7F%DA%CBP%19*%C3%BA%A52T%86%CAP%19%F62T%86%CA%B0n%A9%0CZ%1DV%C6%3D%F3%FCH%DE%B4%B8~%7F%5CZc%F1%D6%1F%AF%84%F9%0F6%E6%EBVt9%0E~%BEr%AF%23%B0%97%A12T%86%CAP%19%B4T%86%CA%B8Re%D8%CBP%19*%C3%BA%A52huX%19%AE%CA%E5%BC%0C%7B%19*CeX%B7h%A9%0C%95%E1%BC%0C%7B%19*CeX%B7T%06%AD%CB%5E%95%2B%BF.%8F%C5%97%D5%E4%7B%EE%82%D6%FB%CF-%9C%FD%B9%CF%3By%7B%19%F62T%86%CA%B0n%D1R%19*%A3%D3%CA%B0%97%A12T%86uKe%D0%EA%B02*%3F1%99%5DB%2B%A4%B5%F8%3A%7C%BA%2B%8Co%7D%5C%EDe%A8%0C%95a%DDR%19%B4T%C66%82fA%B2%ED%DA%9FC%FC%17GZ%06%C9%E1%B3%E5%2C%1A%9FoiB%EB%96%CA%A0%D5qe4%7B%7D%FD%85%F7%5B%ED_%E0s%07%F0k%951%ECr%0D%B5C%D7-g%D1%A8%0C%EB%96%CA%A0%A52T%C6)*%C3%5E%86%CAP%19%D6-%95A%EB*%95q%F8%BB%E3%F9%AB%F6%E21%ACZ%B7%22%B7%9B%3F%02%85%CB%A2%5B%B7%BA%5E%B7%9C%97%E1%BC%0C%EB%16-%95%A12z%AC%0C%BFc%A22T%86uKe%D0%EA%B02V%DD%AD%8A%2B%8CWhe%5E%AF%CF%F5%3B%26%CE%CBh%5C%19%CE%CB%B0%F3%A4%095%A1%CAP%19*Ce%A8%0C%3BO*Ce%A8%0C%95%A12%3A%AD%8C%0A%82%7B%F0v%1F%2FD%A9%5B%9F%EE%EA%26%AF%03%CA%DF9%7B%19*Ce%A8%0C%95%A12T%86%CA%B8Ze%D8%CBP%19*Ce%A8%0C%95%D1ae%EC%F7%89I%E1%B4%D7M%D7P%8BjU%5C%BB%3E%F2%20%D8%CBP%19*Ce%A8%0C%95%A12T%C6%D5*%C3%5E%86%CAP%19*Ce%B4O%07%7B%F0W%7Bw%1C%7C%1A%8C%B3%3B%D1%EE%AA%5C%D6-%EBV%83%80%5E%D0%CA%10%5CU%2BD%E07YU%86%CAP%19*%E3%9A%95%91%D9%A0%C8%AD%5B%EDv%9E%82%FFKOee%E4%8FUe%A8%0C%95%A12T%C6%1F%A9%8C%C8%3D%5B%A5%15%FD%14%22r%E7B%9F%17l%F8%BF%ED%EAf%2B%7F%CF%ECe%D8%CBP%19*Ce%A8%0C%95%E1%93~%7B%19%F62T%86%CAP%19*Ce%A8%0C%E7%13%DA%CBP%19*Ce%A8%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4h%A9%0C%B3E%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4h%A9%0C%B3E%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4%AE%A4%F5%25%C0%00%DE%BF%5C'%0F%DA%B8q%00%00%00%00IEND%AEB%60%82")
		repeat-y !important;
	border-left: 1px solid #BBBBBB !important;
	border-right: 1px solid #000000 !important;
	border-bottom: 1px dashed #BBBBBB !important;
}

.overflowRulerX>.firebugRulerV {
	left: 0 !important;
}

.overflowRulerY>.firebugRulerH {
	top: 0 !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.fbProxyElement {
	position: fixed !important;
	pointer-events: auto !important;
}
</style>
</head>
<body>
	<header>
		<!--右侧浮动结束-->
		<div class="placeholder"></div>
		<div style="top: 0px; left: 0px; width: 100%; z-index: 9999;"
			class="header_top">
			<div class="header_center clearfix">
				<div class="header_lef">
					<span class="mr15"><i class="glyphicon glyphicon-earphone"></i>欢迎致电：400-000-0000</span>
					<span><i class="glyphicon glyphicon-time"></i>服务时间：9:00-18:00</span>
					<span id="weibo" class="ml20 mr4" style="display: none;"> <i
						class="icon icon_weibo"></i> <em class="show_weibo"
						style="display: none;">
							<p>点击关注返利网微博</p>
							<p>
								<a href="javascript:;" target="_blank">caiqi@weibo</a>
							</p> </em> </span> <span id="qq" style="margin-left: 10px;"> <i
						class="icon icon_qq"></i> <em class="show_qq"
						style="display: none;">
							<p>返利网官方客服</p>
							 <p><a href="javascript:;" target="_blank"></a><a  href="http://wpa.qq.com/msgrd?v=3&uin=2569461773&site=qq&menu=yes" target="_blank">2569461773</a></p>
							  </em> </span> <span id="weixin" style="margin-left: 1px;"> <i
						class="icon icon_weixin"></i> <em class="show_weixin"
						style="display: none;">
							<p>返利网官方微信</p>
							<p>
								<a href="javascript:;" target="_blank"><img
									src="${ctx}/CQW/image/weikefu.jpg" alt="" width="130"> </a>
							</p> </em> </span>
				</div>
				<div class="header_rig">
					<ul>
					<li><a href="">帮助中心</a></li>
						<li>
						  <c:choose><c:when test="${not empty SignUpNameCS}"> <a  onclick="" href='javascript:;'>${SignUpNameCS}</a> </c:when> <c:otherwise><a href="${ctx}/mainsy/Register.do">注册</a></c:otherwise> </c:choose>
						</li>
						<li>
						  <c:choose><c:when test="${not empty SignUpIdCS}"> <a  onclick="SCsession()" href='javascript:;'>退出</a> </c:when> <c:otherwise><a href='${ctx}/loginweb/login.do'>登录</a></c:otherwise> </c:choose>
						</li>	
						<li>
						 <c:choose><c:when test="${not empty SignUpIdCS}"> <a href="${ctx}/loginweb/signin.do" style="color: red; font-weight: bold;">签到</a> </c:when> <c:otherwise><a href="javascript:;" onclick="layer.msg('请先登录')" style="color: red; font-weight: bold;">签到</a></c:otherwise> </c:choose>
						  
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="header_bottom">
			<div class="bottom_center">
				<a href=""><img class="bot_left"
					src="${ctx}/CQW/image/LOGO.png"> </a>
				<div class="nav_list">
					<ul>
					   <li><a href="${ctx}/mainsy/MainIndex.do">首页</a></li>
                       <li><a href="${ctx}/RenwuT/renwu.do">任务大厅</a></li>
                       <li class="navCur">
                           <a href="${ctx}/zFStore/JFmain.do">积分商城</a>
                           <i class="hot" style="top: 25px; right: -8px;"><img src="${ctx}/CQW/image/u_new.gif"></i>
                       </li>
                       <!-- <li><a href="">理财返利</a></li> -->
                       <li><a href="">理财资讯</a></li>
                       <li><a href="">新手指南</a></li>
                       <li>
                         <c:choose><c:when test="${not empty SignUpIdCS}"> <a href="${ctx}/personalWeb/wdzl.do"> </c:when> <c:otherwise> <a href="javascript:;" onclick="layer.msg('请先登录')">   </c:otherwise> </c:choose>
                         <c:choose><c:when test="${not empty HeadportraitCS}"> <i class="account mr15"><img src="${ctx}/mainsy/getUserPicture.do?file=${HeadportraitCS}" onerror="this.onerror=null;this.src='${ctx}/CQW/image/user-o.png'"></i> </c:when> <c:otherwise><i class="account mr15"><img src="${ctx}/CQW/image/user-o.png"></i></c:otherwise> </c:choose>
                                                                                         我的账户</a>
                       </li>
					</ul>
				</div>

			</div>
		</div>
	</header>
	<div class="shop mb30 clearfix">
		<!---->
		<%-- <script src="${ctx}/CQW/JFstore/hm.js"></script> --%>
		<script src="${ctx}/CQW/JFstore/jquery_005.js"></script>
		<script src="${ctx}/CQW/JFstore/market.js"></script>
		<!--banner-->
		<div style="height: 320px;" id="focus-banner">
			<ul id="focus-banner-list">

				<li style="z-index: 3; display: list-item;"><a
					style="height: 320px;" href=""
					class="focus-banner-img" target="_blank"><img
						src="${ctx}/CQW/image/2017082209451474.jpg" alt="" height="320">
				</a>
				</li>

				<li style="z-index: 2; display: none;"><a
					style="height: 320px;" href=""
					class="focus-banner-img" target="_blank"><img
						src="${ctx}/CQW/image/2017082209450069.jpg" alt="" height="320">
				</a>
				</li>

				<li style="z-index: 1; display: none;"><a
					style="height: 320px;" href=""
					class="focus-banner-img" target="_blank"><img
						src="${ctx}/CQW/image/2017082209444453.jpg" alt="" height="320">
				</a>
				</li>

			</ul>
			<a href="javascript:;" id="next-img" class="focus-handle"></a> <a
				href="javascript:;" id="prev-img" class="focus-handle"></a>
			<ul style="width: 66px; margin-left: -33px;" id="focus-bubble"></ul>
		</div>
		<div class="wrap clearfix">
			<div class="mall-nav-p">
				<div class="mall-l pull-left">
					<p class="ul-top"></p>
					<ul class="mall-ul">

						<c:forEach items="${Xallone}" var="Xallone">

							<li>
								<p class="tl">
									<a href="" title="${Xallone.mc}">${Xallone.mc}</a>
								</p>
								<ul class="lst clearfix" id="ID${Xallone.storetyleid}">

									<c:if test="${Xallone.storetyleid == 1}">
										<c:forEach items="${category1}" var="category1">
											<li><a onclick="CXFF('${category1.mc}');">${category1.mc}</a>
											</li>
										</c:forEach>
									</c:if>

									<c:if test="${Xallone.storetyleid == 2}">
										<c:forEach items="${category2}" var="category2">
											<li><a onclick="CXFF('${category2.mc}');">${category2.mc}</a>
											</li>
										</c:forEach>
									</c:if>

									<c:if test="${Xallone.storetyleid == 3}">
										<c:forEach items="${category3}" var="category3">
											<li><a onclick="CXFF('${category3.mc}');">${category3.mc}</a>
											</li>
										</c:forEach>
									</c:if>
								</ul>
							</li>

						</c:forEach>


					</ul>
				</div>
				<div class="mall-r pull-left">
					<p class="ul-top"></p>
					<div id="HasLoginFrame" class="mall-r-t text-center myScoreLoading">
						<span class="toux"> <img
							<c:choose><c:when test="${SESSION_USERone.headportrait != null}">src="${ctx}/mainsy/getUserPicture.do?file=${SESSION_USERone.headportrait}"   onerror="this.onerror=null;this.src='${ctx}/image/WT.png'" </c:when> <c:otherwise> src="${ctx}/CQW/image/user-o.png"  </c:otherwise> </c:choose>>

						</span>
						<c:choose>
							<c:when test="${SESSION_USERone.signupId != null}">
								<h3 class="tl color-gray-middle">
									你好：<a href="${ctx}/servlet/personalServlet">${SESSION_USERone.signupname}</a>
								</h3>
								<p class="sum MyScore">
									积分：${signtabCX.signintegral + signtabCX.integral} <i><img
										src="${ctx}/CQW/image/zuanshi.png"> </i>
								</p>
								<dl class="_rule">
									<a href="${ctx}/loginweb/signin.do" >立即签到</a>
								</dl>

							</c:when>
							<c:otherwise>
								<h2 class="">
									未登陆
									</h2>
									<dl class="_rule">
										<a href="${ctx}/loginweb/login.do" >立即登陆</a>
									</dl>
							</c:otherwise>
						</c:choose>


					</div>
					
					<!--Sign-->
					<div class="sign_panel">
						<!---->
						<div
							style="width: 260px; height: auto; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border-radius: 0px; color: rgb(255, 255, 255); padding: 6px 0px 0px 16px;"
							class="my_sign_right">
							<div class="race_back">
								<a href="javascript:;"></a>
							</div>
							<div class="title">
								<p>2018年8月9日</p>
							</div>
							<ul class="week clearfix">
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); box-sizing: border-box; background: rgb(249, 68, 68) none repeat scroll 0% 0%;">日</li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); box-sizing: border-box; background: rgb(249, 68, 68) none repeat scroll 0% 0%;">一</li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); box-sizing: border-box; background: rgb(249, 68, 68) none repeat scroll 0% 0%;">二</li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); box-sizing: border-box; background: rgb(249, 68, 68) none repeat scroll 0% 0%;">三</li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); box-sizing: border-box; background: rgb(249, 68, 68) none repeat scroll 0% 0%;">四</li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); box-sizing: border-box; background: rgb(249, 68, 68) none repeat scroll 0% 0%;">五</li>
								<li
									style="width: 32.1429px; height: 30px; border-right: medium none; box-sizing: border-box; background: rgb(249, 68, 68) none repeat scroll 0% 0%;">六</li>
							</ul>
							<ul class="calendarList clearfix">
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li class="data1"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">1</li>
								<li class="data2 checked"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">2</li>
								<li class="data3"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">3</li>
								<li class="data4"
									style="width: 32.1429px; height: 30px; border-right: medium none; border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">4</li>
								<li class="data5 checked"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">5</li>
								<li class="data6 checked"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">6</li>
								<li class="data7 checked"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">7</li>
								<li class="data8 checked"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">8</li>
								<li class="data9 checked able-qiandao"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">9</li>
								<li class="data10"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">10</li>
								<li class="data11"
									style="width: 32.1429px; height: 30px; border-right: medium none; border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">11</li>
								<li class="data12"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">12</li>
								<li class="data13"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">13</li>
								<li class="data14"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">14</li>
								<li class="data15"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">15</li>
								<li class="data16"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">16</li>
								<li class="data17"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">17</li>
								<li class="data18"
									style="width: 32.1429px; height: 30px; border-right: medium none; border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">18</li>
								<li class="data19"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">19</li>
								<li class="data20"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">20</li>
								<li class="data21"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">21</li>
								<li class="data22"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">22</li>
								<li class="data23"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">23</li>
								<li class="data24"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">24</li>
								<li class="data25"
									style="width: 32.1429px; height: 30px; border-right: medium none; border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">25</li>
								<li class="data26"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">26</li>
								<li class="data27"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">27</li>
								<li class="data28"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">28</li>
								<li class="data29"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">29</li>
								<li class="data30"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">30</li>
								<li class="data31"
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);">31</li>
								<li
									style="width: 32.1429px; height: 30px; border-right: medium none; border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: 1px solid rgb(255, 153, 0); border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
								<li
									style="width: 32.1429px; height: 30px; border-right: medium none; border-bottom: 1px solid rgb(255, 153, 0); box-sizing: border-box; color: rgb(178, 93, 6);"></li>
							</ul>
						</div>
						<script type="text/javascript">
							$('.race_back a').on('click', function() {
								$('.sign_panel').toggle('normal', function() {
									$('#HasLoginFrame').toggle('normal');
								});
							});
						</script>
					</div>
					<!--End Sign-->
				</div>
			</div>
		</div>
		<!--banner end-->
		<div class="mask">
			<div class="modal_banner">
				<a href="#" class="closeBtn">×</a> <span class="title_h1 clearfix"><i
					class="fa fa-check"></i>签到成功!<em>+1</em> </span>
			</div>
		</div>

		

		<div id="yinchang">
			<div class="shop_list mt30 clearfix">
				<div class="hot_shop">
					<h2 class="s_title">热门兑换</h2>
				</div>
				<div class="hot_list">
					<ul>

						<c:forEach items="${allo}" var="allo">

							<li><a href=""> <img
									src="${ctx}/zFStore/getUserPicture.do?file=${allo.picture}"  onerror="this.onerror=null;this.src='${ctx}/image/WT.png'" 
									alt="" border="0" height="200" width="200"> </a> <span
								class="l_c"> 
								
							    <a  class="a_1" onclick="LJDHone(${allo.integralstoreid},'${SESSION_USERone.signupId}',${allo.integral})">立即兑换</a>
						
									<!-- <a class="a_2" href="" target="_blank">查看详情</a> --> </span>
								<div class="prd-des">
									<p class="prd-name" title="${allo.storemc}">${allo.storemc}</p>
									<p class="orange fz12">
										<span>积分：${allo.integral} <i class="zuanshi"></i> </span> <span>已兑换：${allo.intzhi}个</span>
									</p>
								</div></li>
						</c:forEach>

					</ul>
				</div>
			</div>
			<!---->
			<!--tuijian-->
			<div class="tui_list clearfix">
				<div class="tui_shop">
					<h2 class="s_title">
						精品推荐<em><a href="">MORE ></a> </em>
					</h2>
				</div>
				<div class="tui_list">
					<ul>


						<c:forEach items="${sja}" var="sja">

							<li><a href=""> <img
									src="${ctx}/zFStore/getUserPicture.do?file=${sja.picture}"  onerror="this.onerror=null;this.src='${ctx}/image/WT.png'" 
									alt="" border="0" height="200" width="200"> </a> <span
								class="l_c"> <a class="a_1"
									onclick="LJDHone(${sja.integralstoreid},'${SESSION_USERone.signupId}',${sja.integral})">立即兑换</a>
									<!-- <a class="a_2" href="" target="_blank">查看详情</a> --> </span>
								<div class="prd-des">
									<p class="prd-name" title="${sja.storemc}">${sja.storemc}</p>
									<p class="orange fz12">
										<span>积分：${sja.integral} <i class="zuanshi"></i> </span> <span >已兑换：${sja.intzhi}个</span>
									</p>
								</div></li>
						</c:forEach>

					</ul>
				</div>
			</div>

		</div>


		<!---->
	</div>
	<footer>
		<div style="background:#333!important;" class="clearfix">
			<div class="footer_center clearfix">
				<div class="footer_left">
					<dl>
						<dt>
							<i class="icon icon_about mr12"></i>关于我们
						</dt>
						<dd>
							<a href="">了解返利</a>
						</dd>
						<dd>
							<a href="">加入返利</a>
						</dd>
						<dd>
							<a href="">联系返利</a>
						</dd>
						<dd>
							<a href="">意见反馈</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<i class="icon icon_help mr12"></i>帮助中心
						</dt>
						<dd>
							<a href="">新手上路</a>
						</dd>
						<dd>
							<a href="">注册登录</a>
						</dd>
						<dd>
							<a href="">名词解释</a>
						</dd>
						<dd>
							<a href="">提现申请</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<i class="icon icon_pro mr12"></i>广告主服务
						</dt>
						<dd>
							<a href="">广告主登录</a>
						</dd>
						<dd>
							<a href="">广告主注册</a>
						</dd>
					</dl>
					<dl style="margin-right: 20px;">
						<dt>
							<i class="icon icon_see mr12"></i>关注我们
						</dt>
						<dd style="height:88px; padding-left: 25px;">
							<img src="${ctx}/CQW/image/weixin.png"> <img
								src="${ctx}/CQW/image/weikefu.jpg"
								style="margin-left:10px;width:88px;height:88px;">
						</dd>
						<dd>
							<a href="javascript:;">微信公众号</a><a href="javascript:;"
								style="margin-left:40px;">微信客服</a>
						</dd>
					</dl>
				</div>
				<div class="footer_rig">
					<dl>
						<dt>
							<i class="icon icon_service"></i>服务支持
						</dt>
						<dd class="fz30 color3">000-000-0000</dd>
						
						<dd class="mt10">
							服务时间：<strong>9:00-18:00</strong>
						</dd>
						<dd class="mt12">投资有风险 理财需谨慎</dd>
					</dl>
				</div>
			</div>
			<div class="footer_copyright">
				<div class="copyright">版权所有：头号（北京）科技有限公司 © CopyRight 2014-2016 www..com .All Rights Reserved. 京ICP备00000000	
					 &nbsp;&nbsp;</div>
				<div class="copyright_tags">
					<span><img src="${ctx}/CQW/image/copy1.png"> </span> <span><img
						src="${ctx}/CQW/image/copy2.png"> </span> <span><img
						src="${ctx}/CQW/image/copy3.png"> </span>
				</div>
			</div>
		</div>

	</footer>

	<!-- 收货信息mod -->
	<!-- 收货信息mod -->
	<div class="modal fade" data-backdrop="static" id="modservice_room_DH">
		<div class="modal-dialog"
			style="width: 500px; padding: 10px;margin-top: 80px;">
			<div class="modal-content"
				style="padding:8px;background-color: #f9f9f9;">
				<div class="" style="margin-bottom:0;">
					<label style="font-size:14px; float:left;">收货信息</label>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true" style="color: black;">&times;</span><span
							class="sr-only">Close</span>
					</button>
					<br />
				</div>
				<!-- header -->
				<div class=""
					style="background-color:#ffffff;border: 1px solid #cac6c6;margin-top: 10px;padding-bottom: 30px;">

					<form id="formwuyu"
						action="${ctx}/zFStore/doInsert.do"
						class="form-horizontal form-radius" method="post"
						enctype="multipart/form-data">
						<!--  <input type="reset" name="reset" style="display: none;"/> -->

						<input id="ID_span" type="text" name="integralstoreid" hidden="hidden"> 
						<input id="ID_spanHY" type="text" name="signupId" hidden="hidden"> 
						<input id="ID_spanJF" type="text" name="nameJF" hidden="hidden">
						<input id="qdjifen" type="text" name="qdjifen" hidden="hidden">

						<input id="wjifen" type="text" name="wjifen" hidden="hidden">

						<input id="qdID" type="text" name="qdID" hidden="hidden">


						<div class="row" style="margin-top: 40px;">
							<div class="col-lg-12">
								<div style="width: 70%;">
									<i class="shop_icon s_adress"></i><input type="text"
										class="form-control w300 pl40 mb30 brnone"
										id="ID_consigneeName"
										name="consigneename" placeholder="收货人姓名" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-12">
								<div style="width: 70%;">
									<i class="shop_icon s_name"></i><input type="text"
										class="form-control w300 pl40 mb30 brnone"
										id="ID_receivingAddress"
										name="receivingaddress" placeholder="收货地址" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-12">
								<div style="width: 70%;">
									<i class="shop_icon s_phone"></i><input type="text"
										class="form-control w300 pl40 mb30 brnone" name="telephone"
										onkeyup="this.value=this.value.replace(/\D/g,'')" 
										onafterpaste="this.value=this.value.replace(/\D/g,'')"
										maxlength="11"
										placeholder="电话"  id="telephone"/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-12">
								<div style="width: 70%;">
									<i class="shop_icon s_qq"></i><input type="text" id="ID_QQ"
										class="form-control w300 pl40 mb30 brnone" name="qq"
										placeholder="QQ" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-12">
								<div style="width: 70%;">
									<input type="button"
										style="width: 100%;height: 36px;background: #fe5722;color: white;"
										onclick="insert()" value="立即兑换" />
								</div>
							</div>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>



	<script src="${ctx}/CQW/JFstore/jquery.js"></script> 
    <script src="${ctx}/CQW/JFstore/yii.js"></script> 
	<script src="${ctx}/CQW/JFstore/bootstrap.js"></script>
	<script src="${ctx}/CQW/JFstore/style.js"></script>
	<script src="${ctx}/CQW/JFstore/banner.js"></script>
	<script src="${ctx}/CQW/JFstore/scale.js"></script>
	<script src="${ctx}/CQW/JFstore/scaleA.js"></script>
	<script src="${ctx}/CQW/JFstore/scaleB.js"></script>
	<script src="${ctx}/CQW/JFstore/personal.js"></script>

	<script type="text/javascript" src="${ctx}/assets/plugins/jquery.form-3.46.0/jquery.form.js"></script>

	<script src="${ctx}/CQW/JFstore/jquery_003.js"></script>
	<script src="${ctx}/CQW/JFstore/uaredirect.js"></script>
	<script src="${ctx}/CQW/JFstore/jquery_002.js"></script>
	
	<script src="${ctx}/CQW/JFstore/layer.js"></script>
	<script src="${ctx}/CQW/JFstore/cropbox.js"></script>
	<script src="${ctx}/CQW/JFstore/toastr.js"></script>
	<script src="${ctx}/CQW/JFstore/jquery_004.js"></script>
	<script src="${ctx}/CQW/JFstore/awardRotate.js"></script>
	<script src="${ctx}/CQW/JFstore/jquery_006.js"></script>

</body>

<script type="text/javascript">
    

	  //立即兑换
	   function LJDHone(id,huyuanID,jifenB) {
	   //判断是否登录
       
       var ID=id;// undefined
       var varstr = "${SESSION_USERone.signupname}";
     
       if( varstr !=null  && varstr !="" ){//判断登录
       
       var jifen="${signtabCX.signintegral + signtabCX.integral}";//总积分
       var qdjifen="${signtabCX.signintegral}";
       var wjifen= "${signtabCX.integral}";
       var qdID= "${signtabCX.signid}";
       
       
       
       if(jifen >= jifenB){//判断兑换积分是否大于
    
       $.getJSON("${ctx}/zFStore/PDYH.do?zhi=" + varstr, function (data) {
	      
	       if(data.state == true){
		      $("#ID_span").val(ID);//商品ID
		      $("#ID_spanHY").val(huyuanID);//会员ID
		      $("#ID_spanJF").val(jifenB);//总积分
		      $("#qdjifen").val(qdjifen);//签到积分
		      $("#wjifen").val(wjifen);//外积分
		      $("#qdID").val(qdID);//签到积分ID
		      
		      //信息回填（默认）
		      $("#ID_consigneeName").val("${SESSION_USER.signupname}");//收件人
		      $("#ID_receivingAddress").val("${SESSION_USER.living}");//收货地址
		      $("#telephone").val("${SESSION_USER.phonenumber}");//电话
		      
               $("#modservice_room_DH").modal("show");//收货信息mod显示
		       }else{layer.msg("请先登录！");}
			}) 
			 }else{
		  layer.msg("积分不足！");
		}
			
       }else{
          layer.msg("请先登录！");
       }
       
        }
        
    
        
        
    //类别a连接查询
    function CXFF(st){
    //换回跳转页面
      window.location.href="${ctx}/zFStore/chaxunzhi.do?zhi="+st;
    }
	
	
	 //签到跳转页面   没有
		$("#qiandao2").click(function() {
		  var varstr = "${SESSION_USERone.signupname}";
     
       if( varstr !=null  && varstr !="" ){
           
           window.location.href="${ctx}/loginweb/signin.do";
       }else{
        layer.msg("您还没有登录！请先登录");
		location.href="${ctx}/servlet/loginServlet";
       }
		});
		
		
		
	function insert(){
			var layerIndex=layer.load();  
			$("#formwuyu").ajaxSubmit(function(data){
				if ((typeof data)=="string") {
					data=JSON.parse(data);
				}
				console.log(data);
                layer.close(layerIndex);
                    
				if(data.state==true){
				     layer.msg(data.msg);
				     setTimeout('location.reload()',2000); //指定后 2秒刷新
				   
                // $("#modservice_room_DH").modal("hide");//收货信息mod显示
                //重置失败 document.getElementById("modservice_room_DH").reset();//重置form表单
                
                }else{//data.msg
                	  layer.msg(data.msg);
                }
			});		
		}
		
		 $("#telephone").change(function(){
            var phone=$("#telephone").val();
            if(!/^1[3|4|5|8][0-9]\d{8}$/.test(phone)  && phone != phone>1){
            layer.msg("电话号码不正确！");
            $("#telephone").val("")
            }
            
            })
             // 去数字强行输入的字母
            $("#telephone,#ID_QQ").on('blur', function () {
                var $asdfg = $(this);
                  $asdfg.val(($asdfg.val().replace(/[^\d]/g, '')))//去除匹配值 去除非数字
            })
            
 
    
      	   //退出
        function SCsession(){
        var varstr = "${SignUpNameCS}";
       if( varstr !=null  && varstr !="" ){
        $.getJSON("${ctx}/mainsy/SCsessiom.do", function (data) {
	      
	       if(data.state == true){
             layer.msg("退出成功");
             setTimeout('location.reload()',2000); //指定后 2秒刷新
		       }else{
		      layer.msg("退出失败！");
		       }
			}); 
       }else{
        layer.msg("未登录！");
       }
     
    }
    
     function souye(){
    window.location.href="${ctx}/mainsy/MainIndex.do";
    }
    
		    //电话
            $("#telephone").change(function(){
            var phone=$("#phoneNumber").val();
            if(!/^1[3|4|5|8][0-9]\d{8}$/.test(phone)  && phone != phone>1){
            layer.alert($("#phoneNumber").val(),{icon:5,title:"电话号码不正确！"});
            $("#phoneNumber").val("")
            }
            
            })
		 
  // window.onload = tu;//加载完页面执行
	
	</script>



</html>