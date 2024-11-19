<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.itbaizhan.po.Commodity" %>
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
/*var hh = today.getHours();
if(hh<10) hh = '0' + hh;
var mm = today.getMinutes();
if(mm<10) mm = '0' + mm;
var ss = today.getSeconds();
if(ss<10) ss = '0' + ss;
*/
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
  <script language=JavaScript >
  function date(){
var today = new Date();
var strDate = ( today.getYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate());

 return strDate;
}
 </script>	
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
                         
                         <li class="divider"></li>
                         <c:if test="${empty sessionScope.user.username}">
                         <li><a href="login.jsp" class="nav3">User Login</a></li>
                         <li class="divider"></li>                         
                         <li><a href="register.jsp" class="nav6">User Registration </a></li>

                         </c:if>
                         <li class="divider"></li>
                    </ul>

             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->
    
    </div> 
   
     
    <div class="crumb_navigation">
    Navigation: <span class="current"><a href="GoIndexAction.action">Home</a>&gt;&gt; Shopping Cart</span>
    
    </div><div align="right"><form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
    <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Please enter the name of the product you want to search for'){this.value='';}" onblur="if(this.value==''){this.value='Please enter the name of the product you want to search for';}" value="Please enter the name of the product you want to search for" size="25" maxlength="30" type="text" />
<input name="Search" type="submit" value="Search" />
    </form></div>
    <table border="0" cellpadding="0" cellspacing="0" align="center" width=100% height="400px" bgcolor="#e9e7e7">
    <tr>
    <td width=15%>
    
    </td>
   <c:if test="${!empty sessionScope.user.username}">
    
    <td class="center_content" width=100% height=400px>
    <div class="center_content">
     <div class="center_title_bar">My Shopping Cart</div>
     <div class="prod_box_big">
     	<div class="top_prod_box_big"></div>
	 	<div class="center_prod_box_big"> 
      <table>
   <%
   	  SimpleDateFormat matter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
      String tm= matter.format(new Date()); 
 	  Object s=session.getAttribute("list");
 	  SimpleDateFormat mat=new SimpleDateFormat("yyyyMMdd"); 
      String ornum= mat.format(new Date()); 
      int ra=(int)(1000+Math.random()*9000);
      %>

     <s:if test="#session.car.isEmpty" >
			<tr><td colspan="5">There are no items in the shopping cart!</td></tr>
		</s:if>
		<s:else>
		
		<tr>
			<td width="60">Product ID</td>
			<td width="120">Product Name</td>
			<td width="124">Manufacturer</td>
			<td width="60">Product Price</td>
			<td width="119">Remove Product</td>
			
		</tr>
	<s:iterator value="#session.car" id="cars" >
		<tr>
			<td width="147"> ${cars.commodityId}</td>
			<td width="144"> ${cars.commodityName}</td>
			<td width="124"> ${cars.manufacturer}</td>
			<td width="119"> ${cars.webPrice}</td>
			<td width="119"><a href="AddToCarAction!deleteFromCar.action?commodity.commodityId=${cars.commodityId}">Remove</a></td>
		</tr></s:iterator>
		</s:else>
		</table>
		<s:if test="#session.car.isEmpty">
		</s:if>
		<s:else>
		<table>
		<tr>
		<td><form action="OrderFormAction!addOrderForm.action" method="post" name="myform" ><table ><tr><td>
		<input type="hidden" name="orderForm.username" value="${sessionScope.user.username}"/>
	  	<input type="hidden" name="orderForm.totalPrice" value="${totalPrice}" />
	  	<input type="hidden" name="orderForm.isPayoff" value="No" />
	  	<input type="hidden" name="orderForm.submitTime" value="<%=tm %>" />
	 	<input type="hidden" name="orderForm.consignmentTime" value=" "/>
	  	<input type="hidden" name="orderForm.isConsignment" value="No" />
	  	<input type="hidden" name="orderForm.orderFormNum" value="<%=ornum %><%=ra %>" /></td>
	  	<td>
	  	Buyer Remarks：<input type="text" name="orderForm.remark" value="None"/></td>
	  	<td><input type="submit"  value="Submit Order" />
	  	</td>
	  	</tr>
		</table></form></td><td width=140>&nbsp;</td>
		<td ><form action="GoIndexAction"><input type="submit"  value="Continue Shopping" /></form></td>
		</tr>
		</table>
		</s:else>	  	
	  	</div>
	  </div>
	   <div ></div>
     </div>
	</td>
    
    <td class="right_content"><table>
    <tr>
    <td class="shopping_cart"><table>
    <tr><td class="cart_title">Shopping Cart  </td>
    </tr>
     <tr><td class="cart_icon">
     <a href="showCar.jsp" title="">
     <img src="images/shoppingcart.png" alt="" title="" width="48" height="48" border="0" /></a>
    </td>
     </tr></table>
     </td></tr>
     <tr><td> <c:if test="${empty sessionScope.user.username}">
     <form action="UserAction!login.action" name="form" method="post" >
   		<div class="title_box">User Login</div>  
        <div class="border_box">
		<p>Username：<input id="username" name="user.username" type="text" style="width:110px"/></p>
		<p>Password：<input id="password" name="user.password" type="password"  style="width:110px"/></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<input name="Submit" type="submit" value="Login" /><input name="Reset" type="reset" value="Reset" />
        </p>
        <p align="center">&nbsp;&nbsp;&nbsp;[<a href="register.jsp">New User Registration</a>] &nbsp;[<a href="findPass.jsp" >Forgot Password</a>]</p>
        
     </div>  </form> </c:if>
     <c:if test="${!empty sessionScope.user.username}">
            <div class="title_box">User Information</div>  
        <div class="border_box">
         <br/>
		<p>Welcome：${sessionScope.user.username}</p><br/>
		<p> [<a href="OrderFormAction!findOrderFormByUserName.action?orderForm.username=${sessionScope.user.username}">My Orders</a>]&nbsp;&nbsp; [<a href="updatePass.jsp" >Change Password</a>] </p>
		<p> [<a href="userInfo.jsp">Personal Info</a>]&nbsp;&nbsp; [<a href="UserAction!logout.action"  onclick="return confirm('Are you sure you want to log out?')" >Logout</a>] </p>
     </div>
        </c:if> 
      
    </td>
     </tr>
    </table></td> </c:if> 
    <c:if test="${empty sessionScope.user.username}">
    <td class="center_content" width=100% height=400px align=center>
    <table bgcolor="#e9e7e7" >
    <tr><td> <h3>Sorry, you are not logged in, please log in</h3>
    <h3>Redirecting to the login page, if not redirected please <a href=login.jsp>click here!</a></h3>
	<%response.setHeader("refresh","3;url=login.jsp");%>
    </td></tr></table>
      </td>

    </c:if>
    </tr>
    </table>
  
 
  <div class="footer" align="center"><br />&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All rights reserved&nbsp;|&nbsp;Online Mall System<br/><a href="admin/login.jsp">Admin Management</a></div>

</div>

</body>
</html>
