<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>

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
<script>
function check(){

   var username=document.getElementById("username").value;
   
   var email=document.getElementById("email").val;
   var address=document.getElementById("address").value;
   var name=document.getElementById("name").value;
   var phone=document.getElementById("phone").value;
   var post=document.getElementById("post").value;
   
  
   
  if(address==null||address==''){
    alert("Address cannot be empty!");
	return false;
   }
  if(name==null||name==''){
    alert("Name cannot be empty!");
	return false;
  }
	if(phone==null||phone==''){
    alert("Phone cannot be empty!");
	return false;
  }
  if(post==null||post==''){
    alert("Postal code cannot be empty!");
	return false;
  }
 
  if(email.match(/[\w-]+@{1}[\w-]+\.{1}\w{2,4}(\.{0,1}\w{2}){0,1}/ig)!=email.value)
   { alert("Email format is incorrect!");
	return false;
  }
  
}
</script>
<script>
  function fun(t)
  {
    t.style.display='';
  }
  function show(t)
  {
    t.style.display='none';
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
    Navigation: <span class="current"><a href="GoIndexAction.action">Home</a>&gt;&gt;User Information</span>
    
    </div>
    <div align="right"><form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
    <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Please enter the product name you are searching for'){this.value='';}" onblur="if(this.value==''){this.value='Please enter the product name you are searching for';}" value="Please enter the product name you are searching for" size="25" maxlength="30" type="text" />
<input name="Search" type="submit" value="Search" />
    </form></div>
    <table border="0" bgcolor="#e9e7e7" align="center" width=100% >
    <tr>
    <td width=20%>
    
    </td>
    
    <td class="center_content" width=100%>
    <c:if test="${empty sessionScope.user.username}">
    <table bgcolor="#e9e7e7"  width=100%  align=center>
    
    <tr><td  align=center> <h3>Sorry, you are not logged in. Please log in.</h3>
    <h3>Redirecting to the login page, if not redirected please <a href=login.jsp>click here!</a></h3>
    </td></tr></table>
   <% response.setHeader("refresh","3;url=login.jsp");%> 
    </c:if>
    <c:if test="${!empty sessionScope.user.username}">
      <form name="myform" method="post" action="UserAction!updateUser.action" onsubmit="return check();" id="myform" >
   
  <table width=500 border="0" align="center" bgcolor="#e9e7e7">
  <tr ><td  colspan=3  bgcolor="#c0c0c0" align="center" ><h3>User Information Update</h3></td> 
     
      
    </tr>
    <tr> 
      <td width=60 height=30>Username:</td>
      <td width=100> <input type="hidden" name="user.userId" value="${sessionScope.user.userId}"/>
        <input id="username" type="text" name="user.username" size="20"  value="${sessionScope.user.username}" readonly="readonly"/>
        <input type="hidden" name="user.password" value="${sessionScope.user.password}"/>
      </td>
      <td width=220> 
      </td>
    </tr>
              
    <tr> 
      <td height=30>User Name:</td>
      <td width=100> 
        <input id="name" type="text" name="user.name" size="20" onclick="fun(msg3)"  onblur="show(msg3)" value="${sessionScope.user.name }"/>
      </td>
       <td width=180> 
        <div  id=msg3 style="color:#ff0000;display:none;">Enter your name</div>
      </td>
    </tr>
    <tr> 
      <td height=30>Gender:</td>
      <td width=100> 
        <input  type="radio" name="user.sex" value="Male" checked="checked"/>Male
        <input  type="radio" name="user.sex" value="Female"/>Female</td>
        <td > 
      </td>
    </tr>
    <tr>
    <td height=30>User Phone:</td>
      <td width=100> 
        <input id="phone" type="text" name="user.phone" size="20" value="${sessionScope.user.phone}" onclick="fun(msg4)"  onblur="show(msg4)"/>
      </td>
       <td width=180> 
        <div  id=msg4 style="color:#ff0000;display:none;">Enter your phone number</div>
      </td>
    </tr>
    <tr>
    <td height=30>Postal Code:</td>
      <td width=100> 
        <input id="post" type="text" name="user.post" size="20" value="${sessionScope.user.post}" onclick="fun(msg7)"  onblur="show(msg7)"/>
      </td>
       <td width=180> 
        <div  id=msg7 style="color:#ff0000;display:none;">Enter your postal code, please fill carefully</div>
      </td>
    </tr>
    <tr>
    <td height=30>Shipping Address:</td>
      <td width=100> 
        <input id="address" type="text" name="user.address" size="20" value="${sessionScope.user.address}" onclick="fun(msg5)"  onblur="show(msg5)"/>
      </td>
       <td width=180> 
        <div  id=msg5 style="color:#ff0000;display:none;">Enter your shipping address, please fill carefully</div>
      </td>
    </tr>
    <tr> 
      <td height=30>Email:</td>
      <td width=100> 
        <input id="email" type="text" name="user.email" size="20" value="${sessionScope.user.email}" onclick="fun(msg6)"  onblur="show(msg6)"/>
      <input type="hidden" name="user.money" value="${sessionScope.user.money}"/>
      </td>
      <td width=180> 
        <div  id=msg6 style="color:#ff0000;display:none;">Enter email address like 111111@163.com</div>
      </td>
    </tr>
  <tr><td></td><td> <input type="submit" name="submit1" value="Submit" />
    <input type="button" name="Submit2" onclick="javascript:history.back(-1);" value="Back" /></td>
  </tr>
  <tr> 
      <td height=30>You can also:</td>
      <td width=100> 
        <a href="updatePass.jsp">Change Password</a>
      </td>
      <td width=180> 
       </td>
    </tr>
    <tr>
  <td></td><td height="30px"> ${updatemessage} </td>
  </tr>
  <tr>
  <td height="30px" colspan="3"><font color="red">Reminder:</font>If you modify the information, after submitting, log in again to display the updated information </td>
  </tr>
  </table>
</form>
       </c:if> 
	</td>
    
    <td width=20%></td>
    </tr>
    </table>
  
 
  <div class="footer" align="center"><br/>&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All rights reserved&nbsp;|&nbsp;Online Mall System<br/><a href="admin/login.jsp">Admin Management</a></div>

</div>

</body>
</html>
