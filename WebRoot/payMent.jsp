<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
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
var strDate = ( today.getYear() + " Year " + (today.getMonth() + 1) + " Month " + today.getDate() + " Day");

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
strDate="Today is: " + ww+"</font>";
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
                         <li><a href="showCar.jsp" class="nav5">My Shopping Cart</a></li>
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
    Navigation: <span class="current"><a href="GoIndexAction.action">Home</a>&gt;&gt; Payment</span>
    
    </div><div align="right"><form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
    <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Please enter the name of the product you are looking for'){this.value='';}" onblur="if(this.value==''){this.value='Please enter the name of the product you are looking for';}" value="Please enter the name of the product you are looking for" size="25" maxlength="30" type="text" />
<input name="Search" type="submit" value="Search" />
    </form></div>
    <table border="0" cellpadding="0" cellspacing="0" align="center" width=100% height="400px" bgcolor="#e9e7e7">
    <tr>
    <td width=15%>
    
    </td>
   <c:if test="${!empty sessionScope.user.username}">
    
    <td class="center_content" width=100% height=400px>
    <div class="center_content">
     <div class="center_title_bar">Payment</div>
     <div class="prod_box_big">
     	<div class="top_prod_box_big"></div>
	 	<div class="center_prod_box_big"> 
      <table>
  <tr>
	<td align="center" width="8%">Order Number</td>
    <td align="center" >Username</td>
    <td  align="center" >Submission Time</td>
     <td align="center" >Total Order Amount</td>
    <td align="center" >Paid</td>
    <td  align="center" >Action</td>
   
  </tr>
   
    <s:iterator value="#request.nowOrder" id="nowOrder" >
  <tr>
    <td  height=24 align="center"><s:property value="#nowOrder.orderFormNum"/></td>
    <td   height=24 align="center"><s:property value="#nowOrder.username"/></td>
  
    <td  height=24 align="center"><s:property value="#nowOrder.submitTime" /> </td>
     <td  height=24 align="center"><s:property value="#nowOrder.totalPrice"/></td>
    <td   height=24 align="center"><s:property value="#nowOrder.isPayoff"/></td>
  <td  height=24 align="center">
   <s:if test='#nowOrder.isPayoff=="No"'>
  	<form action="OrderFormAction!payOrderForm.action" method="post" name="myform">
  		<input type="hidden" name="orderForm.orderFormId" value="<s:property value='#nowOrder.orderFormId'/>"/>
  		<input type="hidden" name="orderForm.orderFormNum" value="<s:property value='#nowOrder.orderFormNum'/>"/>
		<input type="hidden" name="orderForm.username" value="<s:property value='#nowOrder.username'/>"/>
	  	<input type="hidden" name="orderForm.totalPrice" value="<s:property value='#nowOrder.totalPrice'/>" />
	  	<input type="hidden" name="orderForm.isPayoff" value="<s:property value='#nowOrder.orderFormId'/>" />
	  	<input type="hidden" name="orderForm.submitTime" value="<s:property value='#nowOrder.submitTime'/>" />
	 	<input type="hidden" name="orderForm.consignmentTime" value="<s:property value='#nowOrder.consignmentTime'/>"/>
	  	<input type="hidden" name="orderForm.isConsignment" value="<s:property value='#nowOrder.isConsignment'/>" />
	  	<input type="hidden" name="orderForm.remark" value="<s:property value='#nowOrder.remark'/>" />
	  	<input type="submit"  value="Pay" />	
	  	</form>
	</s:if>
  </td>
	</tr>
	</s:iterator>
		</table>		
	  	</div>	
	  </div>
	   <div >${payemessage}</div>
     </div>
	</td>
    
    <td class="right_content"><table>
    <tr>
    <td class="shopping_cart"><table>
    <tr><td class="cart_title">Shopping Cart</td>
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
		<p>Username: <input id="username" name="user.username" type="text" style="width:110px"/></p>
		<p>Password: <input id="password" name="user.password" type="password"  style="width:110px"/></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<input name="Submit" type="submit" value="Login" /><input name="Reset" type="reset" value="Reset" />
        </p>
        <p align="center">&nbsp;&nbsp;&nbsp;[<a href="register.jsp">New User Registration</a>] &nbsp;[<a href="findPass.jsp" >Forgot Password</a>]</p>
        
     </div>  </form> </c:if>
     <c:if test="${!empty sessionScope.user.username}">
            <div class="title_box">User Information</div>  
        <div class="border_box">
         <br/>
		<p>Welcome: ${sessionScope.user.username}</p><br/>
		<p> [<a href="OrderFormAction!findOrderFormByUserName.action?orderForm.username=${sessionScope.user.username}">My Orders</a>]&nbsp;&nbsp; [<a href="updatePass.jsp" >Change Password</a>] </p>
		<p> [<a href="userInfo.jsp">Personal Information</a>]&nbsp;&nbsp; [<a href="UserAction!logout.action"  onclick="return confirm('Are you sure you want to log out?')" >Log Out</a>] </p>
     </div>
        </c:if> 
      
    </td>
     </tr>
    </table></td> </c:if> 
    <c:if test="${empty sessionScope.user.username}">
    <td class="center_content" width=100% height=400px align=center>
    <table bgcolor="#e9e7e7" >
    <tr><td> <h3>Sorry, you are not logged in. Please log in</h3>
    <h3>Redirecting to login page. If not redirected, <a href=login.jsp>click here!</a></h3>
    </td></tr></table></td>
   <% response.setHeader("refresh","3;url=login.jsp");%> 
    </c:if>
    </tr>
    </table>
  
 
  <div class="footer" align="center"><br />&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All rights reserved&nbsp;|&nbsp;Online Shopping System<br/><a href="admin/login.jsp">Admin Management</a></div>

</div>

</body>
</html>
