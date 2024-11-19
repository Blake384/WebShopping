<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="js/style.css" />
<style>
.main_iframe {
	Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 92%
	</style>
<script type="text/javascript" src="js/boxOver.js"></script>

</head>
<body>

<div id="main_container">
  <div class="top_bar"></div>
	<div id="header">
	
	 <div id="divstr"><br/><h2>Welcome to the Online Mall</h2><h3>
<script language=JavaScript >
var today = new Date();
var strDate = ( today.getYear() + " year " + (today.getMonth() + 1) + " month " + today.getDate() + " day");
var n_day = today.getDay();
var ww;

switch (n_day)
{
case 0:{ww =  "Sunday";} break;
case 1:{ww =  "Monday";} break;
case 2:{ww =  "Tuesday";} break;
case 3:{ww =  "Wednesday";} break;
case 4:{ww =  "Thursday";} break;
case 5:{ww =  "Friday";} break;
case 6:{ww =  "Saturday";} break;
case 7:{ww =  "Sunday";} break;
}
strDate="Today is:" + ww+"</font>";
document.write(strDate);
 </script></h3></div>
	  <!-- end of oferte_content-->
</div>
    
   <div id="main_content"> 
            <div id="menu_tab">
            <div class="left_menu_corner"></div>
                    <ul class="menu">
                         <li><a href="GoIndexAction.action" class="nav1">Home</a></li>
                         <li class="divider"></li>
                         <li><a href="GoIndexAction.action" class="nav2">Online Shopping</a></li>
                         <li class="divider"></li>
                         <li><a href="showCar.jsp" class="nav5">My Cart</a></li>
                         <li class="divider"></li>
                         
                         <c:if test="${empty sessionScope.user.username}">
                         <li class="divider"></li>
                         <li><a href="login.jsp" class="nav3">User Login</a></li>
                         <li class="divider"></li>                         
                         <li><a href="register.jsp" class="nav6">User Registration</a></li>

                         </c:if>
                         <li class="divider"></li>
                    </ul>

             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->
    
    </div> 
    
    <div class="crumb_navigation">
    Navigation: <span class="current"><a href="GoIndexAction.action">Home</a> &gt;&gt;${sessionScope.commodityById.commodityName }
     </span>
    
    </div><div align="right"><form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
    <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Please enter the product name you are searching for'){this.value='';}" onblur="if(this.value==''){this.value='Please enter the product name you are searching for';}" value="Please enter the product name you are searching for" size="25" maxlength="30" type="text" />
<input name="Search" type="submit" value="Search" />
    </form></div>
    <table border="0" cellpadding="0" cellspacing="0" align="center" width=100% height=400px>
    <tr>
    <td width=20%>
     </td>
    
    <td class="center_content" width=60% >
     
    <div class="center_content">
     <div class="center_title_bar">${sessionScope.commodityById.commodityName }</div>
     <div class="prod_box_big">
       <div class="top_prod_box_big"></div>
       <div class="center_prod_box_big">
         <div class="product_img_big"> 
             <div><img src="product/${sessionScope.commodityById.image }" alt="${sessionScope.commodityById.commodityName }" title="${sessionScope.commodityById.commodityName }" border="0" width="144px" height="144px"/></div>
         </div>
         <div class="details_big_box">
           <div class="product_title_big">${sessionScope.commodityById.commodityName }</div>
           <div class="specifications"> 
           	Manufacturer: <span class="blue">${sessionScope.commodityById.manufacturer }</span><br />
              Product ID: <span class="blue">${sessionScope.commodityById.commodityId }</span><br />
              Total Quantity: &nbsp;&nbsp;&nbsp;&nbsp;<span class="blue">${sessionScope.commodityById.commodityAmount }</span><br />
              Remaining Quantity: <span class="blue">${sessionScope.commodityById.commodityLeaveNum }</span><br />
           Mall Price: <span class="blue">${sessionScope.commodityById.webPrice }</span><br />
           </div>
           <div class="prod_price_big"><span class="reduce"></span> <span class="price"></span></div>
           <a href="AddToCarAction?commodity.commodityId=${sessionScope.commodityById.commodityId }" class="addtocart">Add to Cart</a></div>
            </div>
       <div class="bottom_prod_box_big"></div>
     </div>
     <div class="center_title_bar">Product Description</div>
	     <div class="prod_box_big">
	    
			<table border=0 cellspacing="2">
			<tr>
			<td ><font size=3> ${sessionScope.commodityById.commodityDepict }</font></td></tr>
			
 </table>
	     </div>
     </div> 
	</td>
    
    <td width=20%></td>
    </tr>
    </table>
  
 
  <div class="footer" align="center"><br />&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All rights reserved&nbsp;|&nbsp;Online Mall System<br/><a href="admin/login.jsp">Admin Management</a></div>

</div>
<!-- end of main_container -->
</body>
</html>
