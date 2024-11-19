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
<script>
  function Check() {
     if(document.form1.peopleName.value == ''){
       alert('Name cannot be empty!');
       return false;
     }
     if(document.form1.peopleName.value.length > 20){
       alert('Name cannot exceed 20 characters!');
       return false;
     }
     if(document.form1.title.value == ''){
       alert('Title cannot be empty!');
       return false;
     }
     if(document.form1.title.value.length > 30){
       alert('Title cannot exceed 30 characters!');
       return false;
     }
     if(document.form1.message.value == ''){
       alert('Content cannot be empty!');
       return false;
     }
     if(document.form1.message.value.length > 200) {
       alert('Content cannot exceed 200 characters!');
       return false;
     }
  }
</script>
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
var daysOfWeek;

switch (n_day) {
  case 0: daysOfWeek =  "Sunday"; break;
  case 1: daysOfWeek =  "Monday"; break;
  case 2: daysOfWeek =  "Tuesday"; break;
  case 3: daysOfWeek =  "Wednesday"; break;
  case 4: daysOfWeek =  "Thursday"; break;
  case 5: daysOfWeek =  "Friday"; break;
  case 6: daysOfWeek =  "Saturday"; break;
}
strDate="Today is: " + daysOfWeek;
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
      </div>
    </div> 

    <div class="crumb_navigation">
    Navigation: <span class="current"><a href="GoIndexAction.action">Home</a> &gt;&gt; User Messages</span>
    </div>

    <div align="right">
      <form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
        <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Please enter the name of the product you want to search'){this.value='';}" onblur="if(this.value==''){this.value='Please enter the name of the product you want to search';}" value="Please enter the name of the product you want to search" size="25" maxlength="30" type="text" />
        <input name="Search" type="submit" value="Search" />
      </form>
    </div>

    <c:if test="${empty sessionScope.user.username}">
      <table bgcolor="#e9e7e7" width="100%" align="center">
        <tr>
          <td align="center"> 
            <h3>Sorry, you are not logged in. Please log in.</h3>
            <h3>Redirecting to login page. If it does not redirect, please <a href="login.jsp">click here</a>!</h3>
          </td>
        </tr>
      </table>
      <% response.setHeader("refresh","3;url=login.jsp");%> 
    </c:if>

    <table border="0" bgcolor="#e9e7e7" align="center" width="100%" height="400px">
      <c:if test="${!empty sessionScope.user.username}">
        <tr>
          <td width="15%"></td>
          <td class="center_content" width="70%" height="400px">
            <form onsubmit="return Check();" action="messagePane.jsp" method="post" name="form1">
              <table width="100%">
                <tr><th align="center" colspan="2"><h2>Message Board</h2></th></tr>
                <tr><td width="150">Username:</td><td><input type="text" name="peopleName" readonly="readonly" value="${sessionScope.user.username}"/></td></tr>
                <tr><td>Enter your message title:</td><td><input type="text" name="title"/></td></tr>
                <tr><td>Enter your message:</td><td><textarea name="message" rows="10" cols="50" wrap="physical"></textarea></td></tr>
                <tr><td></td><td><input type="submit" value="Submit" name="submit" style="height:30px;width:100px"/>
                <input type="button" value="View Message Board" name="look" style="height:30px;width:100px" onclick="window.location.href('messageShow.jsp')"/></td></tr>
              </table>
            </form>
          </td>

          <td class="right_content">
            <table>
              <tr>
                <td class="shopping_cart">
                  <table>
                    <tr><td class="cart_title">Shopping Cart</td></tr>
                    <tr>
                      <td class="cart_icon">
                        <a href="showCar.jsp" title="">
                        <img src="images/shoppingcart.png" alt="" title="" width="48" height="48" border="0" /></a>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <c:if test="${empty sessionScope.user.username}">
                    <form action="UserAction!login.action" name="form" method="post">
                      <div class="title_box">User Login</div>  
                      <div class="border_box">
                        <p>Username: <input id="username" name="user.username" type="text" style="width:110px"/></p>
                        <p>Password: <input id="password" name="user.password" type="password" style="width:110px"/></p>
                        <p><input name="Submit" type="submit" value="Login" /><input name="Reset" type="reset" value="Reset" /></p>
                        <p align="center">[<a href="register.jsp">New User Registration</a>] &nbsp;[<a href="findPass.jsp" >Forgot Password</a>]</p>
                      </div>
                    </form>
                  </c:if>
                  <c:if test="${!empty sessionScope.user.username}">
                    <div class="title_box">User Information</div>  
                    <div class="border_box">
                      <p>Welcome: ${sessionScope.user.username}</p>
                      <p> [<a href="OrderFormAction!findOrderFormByUserName.action?orderForm.username=${sessionScope.user.username}">My Orders</a>] &nbsp; [<a href="updatePass.jsp">Change Password</a>] </p>
                      <p> [<a href="userInfo.jsp">Personal Information</a>] &nbsp; [<a href="UserAction!logout.action" onclick="return confirm('Are you sure you want to log out?')" >Logout</a>] </p>
                    </div>
                  </c:if> 
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </c:if>
    </table>

  <div class="footer" align="center"><br />&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All Rights Reserved&nbsp;|&nbsp;Online Mall System<br/><a href="admin/login.jsp">Admin Management</a></div>
</div>
<!-- end of main_container -->
</body>
</html>
