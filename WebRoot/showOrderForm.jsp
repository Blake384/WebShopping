<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="js/style.css" />

<style>
.main_iframe {
	Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 92%
	</style>

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
                         <li><a href="login.jsp" class="nav3" >User Login</a></li>
                         <li class="divider"></li>                         
                         <li><a href="register.jsp" class="nav6">User Registration</a></li>

                         </c:if>
                         <li class="divider"></li>
                    </ul>

             <div class="right_menu_corner"></div>
            </div><!-- end of menu tab -->
    
    </div> 
    
    <div class="crumb_navigation">
    Navigation: <span class="current"><a href="GoIndexAction.action">Home</a>&gt;&gt;My Orders</span>
    
    </div>
    <div align="right"><form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
    <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Please enter the product name you are searching for'){this.value='';}" onblur="if(this.value==''){this.value='Please enter the product name you are searching for';}" value="Please enter the product name you are searching for" size="25" maxlength="30" type="text" />
<input name="Search" type="submit" value="Search" />
    </form></div>
    <table border="0" bgcolor="#e9e7e7" align="center" width=100% >
    <tr>
    <td width=15%>
    
    </td>
    
    <td class="center_content" width=100%  height=400px>
    <c:if test="${empty sessionScope.user.username}">
    <table bgcolor="#e9e7e7"  width=100%  align=center>
    
    <tr><td  align=center> <h3>Sorry, you are not logged in. Please log in.</h3>
    <h3>Redirecting to the login page. If not redirected, please <a href=login.jsp>click here!</a></h3>
    </td></tr></table>
   <% response.setHeader("refresh","3;url=login.jsp");%> 
    </c:if>
    
    <c:if test="${!empty sessionScope.user.username}">
     <div class="center_content">
     <div class="center_title_bar">My Orders</div>
     <div class="prod_box_big">
     	<div class="top_prod_box_big"></div>
	 	<div class="center_prod_box_big"> 
      <table>
      <s:if test="#request.orderFormByUserName.isEmpty"  >
			<td colspan="5">No order information available for you!</td>
		</s:if>
		<s:else>
		<tr>
			<td width="60">Order Number</td>
			<td width="144">Payment Time</td>
			<td width="144">Shipping Time</td>
			<td width="80">Total Order Amount</td>
			<td width="60">Payment Status</td>
			<td width="60">Shipping Status</td>
			<td width="60">Actions</td>
		</tr>
	<s:iterator value="#request.orderFormByUserName" id="orderFormByUserName" >
		<tr>
			<td ><s:property value="#orderFormByUserName.orderFormNum"/></td>
			<td ><s:property value="#orderFormByUserName.submitTime"/></td>
			<td ><s:property value="#orderFormByUserName.consignmentTime"  /></td>
			<td ><s:property value="#orderFormByUserName.totalPrice"/></td>
			<td><s:property value="#orderFormByUserName.isPayoff"/></td>
			<td ><s:property value="#orderFormByUserName.isConsignment"/></td>
			<s:if test='#orderFormByUserName.isPayoff=="No" '><td >
		<form action="OrderFormAction!payOrder.action" method="post" name="myform" >
		<input type="hidden" name="orderForm.orderFormId" value='<s:property value="#orderFormByUserName.orderFormId"/>' />
		<input type="hidden" name="orderForm.orderFormNum" value='<s:property value="#orderFormByUserName.orderFormNum"/>' />
		<input type="hidden" name="orderForm.username" value='<s:property value="#orderFormByUserName.username"/>'/>
	  	<input type="hidden" name="orderForm.totalPrice" value='<s:property value="#orderFormByUserName.totalPrice"/>' />
	  	<input type="hidden" name="orderForm.isPayoff" value='<s:property value="#orderFormByUserName.isPayoff"/>' />
	  	<input type="hidden" name="orderForm.submitTime" value='<s:property value="#orderFormByUserName.submitTime"/>' />
	 	<input type="hidden" name="orderForm.consignmentTime" value='<s:property value="#orderFormByUserName.consignmentTime"/>'/>
	  	<input type="hidden" name="orderForm.isConsignment" value='<s:property value="#orderFormByUserName.isConsignment"/>' />
	  	<input type="hidden" name="orderForm.remark" value='<s:property value="#orderFormByUserName.remark"/>' />
	  	<input type="submit"  value="Pay Now" />	
	  	</form></td></s:if>
			<s:elseif test=' #orderFormByUserName.isPayoff=="Yes" '><td >Already Paid</td></s:elseif>
			</tr></s:iterator>
				
		</s:else>
		</table>		
	  	<div><h3>${payemessage } </h3>
	  	</div>
	  	
	  </div>
	   <div class="bottom_prod_box_big"></div>
     </div>
     </div>
       </c:if> 
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
    </table></td>
    </tr>
    </table>
  
 
  <div class="footer" align="center"><br/>&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All rights reserved&nbsp;|&nbsp;Online Mall System<br/><a href="admin/login.jsp">Admin Management</a></div>

</div>

</body>
</html>
