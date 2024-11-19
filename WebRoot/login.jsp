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
	
	 <div id="divstr"><br/><h2>Welcome to the Online Mall</h2><h3><script language=JavaScript >
var today = new Date();
var strDate = ( today.getFullYear() + " Year " + (today.getMonth() + 1) + " Month " + today.getDate() + " Day");

var n_day = today.getDay();
var daysOfWeek;

switch (n_day)
{
case 0:{daysOfWeek =  "Sunday";} break;
case 1:{daysOfWeek =  "Monday";} break;
case 2:{daysOfWeek =  "Tuesday";} break;
case 3:{daysOfWeek =  "Wednesday";} break;
case 4:{daysOfWeek =  "Thursday";} break;
case 5:{daysOfWeek =  "Friday";} break;
case 6:{daysOfWeek =  "Saturday";} break;
}
strDate="Today is: " + daysOfWeek;
document.write(strDate);
 </script></h3></div>
	  <!-- end of header content-->
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
    Navigation:  <span class="current"><a href="GoIndexAction.action">Home</a>&gt;&gt; User Login</span>
    
    </div>
  <div align="right"><form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
    <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Please enter the name of the product you want to search'){this.value='';}" onblur="if(this.value==''){this.value='Please enter the name of the product you want to search';}" value="Please enter the name of the product you want to search" size="25" maxlength="30" type="text" />
<input name="Search" type="submit" value="Search" />
    </form></div>
    
    <div></div>
    <table width="100%" bgcolor="#e9e7e7"><tr><td width="20%"></td>
    <td class="center_content" width="100%" height="400px" align="center">
    
    <form action="UserAction!login.action" name="form" method="post" >
   		<div class="title_box">User Login</div>  
        <div class="border_box">
		<p>Username: <input  name="user.username" type="text" style="width:110px" /></p>
		<p>Password: <input name="user.password" type="password" style="width:110px" /></p>
        <p><input name="Submit" type="submit" value="Login" /><input name="Reset" type="reset" value="Reset" />
        </p>
        <p align="center">[<a href="register.jsp">New User Registration</a>] &nbsp;[<a href="findPass.jsp" >Forgot Password</a>]</p>
        
     </div>  </form>
       
	</td></tr>
    </table>
    
  <div class="footer" align="center"><br />&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All Rights Reserved&nbsp;|&nbsp;Online Mall System<br/><a href="admin/login.jsp">Admin Management</a></div>
</div>

</body>
</html>
