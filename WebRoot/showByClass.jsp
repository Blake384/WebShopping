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
var strDate = ( today.getYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate() );

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
}
strDate="Today is: " + ww;
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
    Navigation:  <span class="current"><a href="GoIndexAction.action">Home</a>&gt;&gt;${searchClassMessage} </span>
    
    </div>
    <div align="right">
    <form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
    <input id="commodity.commodityName" name="commodity.commodityName" style="font-size: 10pt; color: rgb(85, 85, 85);" onfocus="if(this.value=='Enter the product name you are looking for'){this.value='';}" onblur="if(this.value==''){this.value='Enter the product name you are looking for';}" value="Enter the product name you are looking for" size="25" maxlength="30" type="text" />
    <input name="Search" type="submit" value="Search" />
    </form></div>
          
    <table width=100%  align="center">
    <tr>
	<td class="left_content" valign="top">
    <table>
    <tr>
    <td class="title_box">Product Categories</td></tr>
    <tr><td>
    <ul class="left_menu">
    <s:iterator value="#request.listCommodityClasses"  status="stu" id="classes">
        	<s:if test="#stu.odd==true">
        		<li class="odd">
        			<s:a href="CommodityAction!findCommodityByClass.action?commodityClassId=%{#classes.commodityClassId}">
        				<s:property value="#classes.commodityClassName"/>
        			</s:a>
        		</li>
        	</s:if>
        	<s:else>
        		<li class="even">
        			<s:a href="CommodityAction!findCommodityByClass.action?commodityClassId=%{#classes.commodityClassId}">
        				<s:property value="#classes.commodityClassName"/>
        			</s:a>
        		</li>
        	</s:else>	
        </s:iterator></ul><br/></td>
     </tr>
          
    </table>
    </td>
    
    <td valign="top" align="left"> 
     <div class="center_content">
   	<div class="center_title_bar">${searchClassMessage}</div>
   	<s:if test="#request.commodityByClass.isEmpty">
   	<div><h3>Sorry, this category is currently empty!</h3>
   	</div>
   	</s:if><s:else>
   	    	<s:iterator value="#request.commodityByClass" var="commodityByClass">
    		<div class="prod_box">
	        	<div class="top_prod_box"></div>
	            <div class="center_prod_box">            
	                 <div class="product_title"><s:a href="CommodityAction!findCommodityById.action?commodity.commodityId=%{#commodityByClass.commodityId}"><s:property value="#commodityByClass.commodityName" /></s:a></div>
	                 <div class="product_img"><s:a href="CommodityAction!findCommodityById.action?commodity.commodityId=%{#commodityByClass.commodityId}"><img src="product/<s:property value='#commodityByClass.image' />" 
	                 alt="<s:property value='#commodityByClass.commodityName' />" title="<s:property value='#commodityByClass.commodityName' />" border="0"  width="144px" height="144px"/></s:a></div>
	                 <div class="prod_price"><span class="reduce">¥<s:property value="#commodityByClass.commodityPrice"/></span> <span class="price">¥<s:property value="#commodityByClass.webPrice"/></span></div>                        
	            </div>
	            <div class="bottom_prod_box"></div>             
	            <div class="prod_details_tab">
	            <a href="AddToCarAction?commodity.commodityId=<s:property value='#commodityByClass.commodityId'/>" title="header=[Add to Cart] body=[&nbsp;] fade=[on]"><img src="images/cart.gif" alt="" title="" border="0" class="left_bt" /> </a>      
	           <a href="CommodityAction!findCommodityById.action?commodity.commodityId=<s:property value='#commodityByClass.commodityId'/>" class="prod_details">Details</a> </div>                     
	        </div>
	        </s:iterator></s:else>
    	</div>
     </td>
     
     
   <td class="right_content"></td>
     </tr>
    </table>
    
  <div class="footer" align="center"><br />&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All Rights Reserved&nbsp;|&nbsp;Online Mall System<br/><a href="admin/login.jsp">Admin Panel</a></div>
</div>

</body>
</html>
