﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<script>
function check(){
   var pass1=document.getElementById("password").value;
   var pass2=document.getElementById("repassword").value;
   if(pass1.length<8||pass1.length>20){
    alert("Password length must be between 8 and 20 characters!");
	return false;
   }
   if(pass1!=pass2){
    alert("The two passwords do not match!");
	return false;
   }
}
</script>

 <script>
  function fun(t) {
    t.style.display='';
  }
  function show(t) {
    t.style.display='none';
  }
 </script>

</head>
<body>

<div id="main_container">
  <div class="top_bar"></div>
	<div id="header">
	 <div id="divstr"><br/><h2>Welcome to the Online Mall</h2><h3>
<script language=JavaScript>
var today = new Date();
var strDate = ( today.getYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate() );
var n_day = today.getDay();
var ww;
switch (n_day) {
case 0:{ww =  "Sunday";} break;
case 1:{ww =  "Monday";} break;
case 2:{ww =  "Tuesday";} break;
case 3:{ww =  "Wednesday";} break;
case 4:{ww =  "Thursday";} break;
case 5:{ww =  "Friday";} break;
case 6:{ww =  "Saturday";} break;
}
strDate="Today is: " + ww+"</font>";
document.write(strDate);
</script></h3></div>
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
    Navigation:  <span class="current"><a href="GoIndexAction.action">Home</a> &gt;&gt; Reset Password</span>
    </div>
    <div align="right">
      <form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
        <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Enter the product name you want to search'){this.value='';}" onblur="if(this.value==''){this.value='Enter the product name you want to search';}" value="Enter the product name you want to search" size="25" maxlength="30" type="text" />
        <input name="Search" type="submit" value="Search" />
      </form>
    </div>
    
    <table border="0" cellpadding="0" cellspacing="0" align="center" width=100% height="400px" bgcolor="#e9e7e7">
    <tr>
    <td width=20%></td>
      <c:if test="${empty sessionScope.findUser}">
      <% response.sendRedirect("index.jsp"); %>
      </c:if>
    <c:if test="${!empty sessionScope.findUser}">
    <td class="center_content" width=100% height=500px align="center">
    <form name="myform" method="post" action="UserAction!updatePass.action" id="myform" onsubmit="return check();">
      <table width=500 border="0" align="center" bgcolor="#e9e7e7">
        <tr><td colspan=3 bgcolor="#c0c0c0" align="center"><h3>Reset Password</h3></td></tr>
        <tr> 
          <td height=30>Password:
            <input type="hidden" name="user.userId" value="${sessionScope.findUser.userId}"/>
            <input type="hidden" name="user.username" value="${sessionScope.findUser.username}"/>
          </td>
          <td width=100><input id="password" type="password" name="user.password" size="20" onclick="fun(msg1)" onblur="show(msg1)"/></td>
          <td width=180><div id=msg1 style="color:#ff0000;display:none;">Password length must be between 8 and 20 characters</div></td>
        </tr>
        <tr> 
          <td height=30>Confirm Password:
            <input type="hidden" name="user.name" value="${sessionScope.findUser.name}"/>
            <input type="hidden" name="user.sex" value="${sessionScope.findUser.sex}"/>
            <input type="hidden" name="user.phone" value="${sessionScope.findUser.phone}"/>
            <input type="hidden" name="user.post" value="${sessionScope.findUser.post}"/>
            <input type="hidden" name="user.address" value="${sessionScope.findUser.address}"/>
            <input type="hidden" name="user.email" value="${sessionScope.findUser.email}"/>
          </td>
          <td width=100><input id="repassword" type="password" name="pwd2" size="20" onclick="fun(msg2)" onblur="show(msg2)"/></td>
          <td width=180><div id=msg2 style="color:#ff0000;display:none;">The two passwords must match</div></td>
        </tr>
        <tr>
          <td><input type="hidden" name="user.money" value="1000"/></td>
          <td><input type="submit" name="submit1" value="Submit" />
          <input type="reset" name="Submit2" value="Reset" /></td>
        </tr>
        <tr>
          <td colspan="3"><h3>${updatePass}
            <c:if test="${!empty updatePass}">Please re-login!<br/>
            Redirecting to the login page! If it does not redirect, <a href="login.jsp">click here</a>.
            <% response.setHeader("refresh","3;url=login.jsp"); %> 
            </c:if>
          </h3></td>
        </tr>
      </table>
    </form>
    </td></c:if>
    </tr>
    </table>
   <div class="footer" align="center"><br />&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All Rights Reserved&nbsp;|&nbsp;Online Mall System<br/><a href="admin/login.jsp">Admin Panel</a></div>
</div>

</body>
</html>