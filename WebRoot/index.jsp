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
<style>
    .banner {
        width: 1000px;
        height: 300px;
        position: relative;
        margin: auto;
    }
    .banner .wrap {
        width: 100%;
    }
    .banner .wrap .item {
        width: 100%;
    }
    .item img {
        width: 1000px;
        height: 300px;
        vertical-align: top;
        position: absolute;
    }
    .div1 {
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        width: 41px;
        height: 69px;
        font-size: 30px;
        line-height: 70px;
        text-align: center;
        color: #D6D8D4;
        background-color: rgba(0, 0, 0, 0.3);
    }
    .div2 {
        position: absolute;
        right: 0;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        width: 41px;
        height: 69px;
        font-size: 30px;
        line-height: 70px;
        text-align: center;
        color: #D6D8D4;
        background-color: rgba(0, 0, 0, 0.3);
    }
    .pagenation {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        bottom: 40px;
    }
    .pagenation>div {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background-color: white;
        margin-right: 10px;
        cursor: pointer;
    }
    .pagenation>div:last-child {
        margin-right: 0;
    }
</style>
</head>

<body>
<s:if test="#request.listCommodityClasses">
    
<div id="main_container">
  <div class="top_bar"></div>
	<div id="header">
	
	 <div id="divstr"><br/><h2>Welcome to the Online Mall</h2><h3>
	<script language=JavaScript>
        var today = new Date();
        var strDate = ( today.getFullYear() + " Year " + (today.getMonth() + 1) + " Month " + today.getDate() + " Day");
        var n_day = today.getDay();
        var daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        strDate = "Today is: " + daysOfWeek[n_day];
        document.write(strDate);
    </script></h3></div>
	  <!-- end of header content -->
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

<!-- Banner section -->
<div class="banner">
    <div class="wrap">
        <div class="item"><img src="images/image1.jpg" alt=""></div>
        <div class="item"><img src="images/image2.jpg" alt=""></div>
        <div class="item"><img src="images/image3.jpg" alt=""></div>
    </div>
    <div class="div1"><</div> 
    <div class="div2">></div>
    <div class="pagenation">
        <div id="pagenation-item0"></div>
        <div id="pagenation-item1"></div>
        <div id="pagenation-item2"></div>
    </div>
</div>
<!-- End of Banner section -->

<div class="crumb_navigation">
    Navigation: <span class="current"><a href="GoIndexAction.action">Home</a></span>
</div> 

<div align="right">
    <form name="searchform" action="CommodityAction!findCommodityByName.action" method="post">
        <input id="commodity.commodityName" name="commodity.commodityName" 
            style="font-size: 10pt; color: rgb(85, 85, 85);" 
            onfocus="if(this.value=='Enter the product name you want to search'){this.value='';}" 
            onblur="if(this.value==''){this.value='Enter the product name you want to search';}" 
            value="Enter the product name you want to search" size="25" maxlength="30" type="text" />
        <input name="search" type="submit" value="Search" />
    </form>
</div>

<table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" height="400px">
    <tr>
        <td class="left_content">
            <table>
                <tr><td class="title_box">Product Categories</td></tr>
                <tr>
                    <td> 
                        <ul class="left_menu">
                            <s:iterator value="#request.listCommodityClasses" status="stu" id="classes">
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
                            </s:iterator>
                        </ul><br/>
                    </td>
                </tr>
            </table>
        </td>
        
        <td class="center_content" width="100%" height="400px">
            <iframe class="main_iframe" id="frmright" name="frmright" frameborder="0" scrolling="auto" src="product.jsp"></iframe>
        </td>
        
        <td class="right_content">
            <table>
                <tr>
                    <td class="shopping_cart">
                        <table>
                            <tr><td class="cart_title">Shopping Cart</td></tr>
                            <tr><td class="cart_icon">
                                <a href="showCar.jsp" title=""><img src="images/shoppingcart.png" alt="" title="" width="48" height="48" border="0" /></a>
                            </td></tr>
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
                                    <p><input name="submit" type="submit" value="Login" /><input name="reset" type="reset" value="Reset" /></p>
                                    <p align="center">[<a href="register.jsp">New User Registration</a>] &nbsp;[<a href="findPass.jsp" >Forgot Password</a>]</p>
                                </div>  
                            </form> 
                        </c:if>
                        <c:if test="${!empty sessionScope.user.username}">
                            <div class="title_box">User Information</div>  
                            <div class="border_box">
                                <br/>
                                <p>Welcome: ${sessionScope.user.username}</p><br/>
                                <p>[<a href="OrderFormAction!findOrderFormByUserName.action?orderForm.username=${sessionScope.user.username}">My Orders</a>] &nbsp;&nbsp; [<a href="updatePass.jsp" >Change Password</a>]</p>
                                <p>[<a href="userInfo.jsp">Personal Information</a>] &nbsp;&nbsp; [<a href="UserAction!logout.action"  onclick="return confirm('Are you sure you want to log out?')" >Logout</a>]</p>
                            </div>
                        </c:if> 
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<div class="footer" align="center">
    <br/>&copy;&nbsp;&nbsp;|&nbsp;XXXX&nbsp;|&nbsp;All Rights Reserved&nbsp;|&nbsp;Online Mall System<br/>
    <a href="admin/login.jsp">Admin Login</a>
</div>

</div>
</s:if>

<s:else>
    <s:action name="GoIndexAction" executeResult="true"></s:action>
</s:else>

</body>
<script>
    // Carousel functionality
    var index = 0;
    var banner = document.getElementsByClassName("banner")[0];
    var itemList = document.getElementsByClassName("item");
    var pagenationList = document.querySelectorAll(".pagenation>div");
    var pagenation = document.querySelector(".pagenation");
    itemList[0].style.opacity = 1;
    pagenationList[0].style.background = "blue";
    var up = document.getElementsByClassName("div1")[0];
    var next = document.getElementsByClassName("div2")[0];

    function nextFn() {
        index = index >= itemList.length - 1 ? 0 : ++index;
        for (var i = 0; i < itemList.length; i++) {
            itemList[i].style.opacity = 0;
            pagenationList[i].style.background = "white";
        }
        itemList[index].style.transition = "opacity 1s ease .2s";
        itemList[index].style.opacity = 1;
        pagenationList[index].style.background = "blue";
    }
    next.onclick = nextFn;

    up.onclick = function () {
        index = index <= 0 ? itemList.length - 1 : --index;
        for (var i = 0; i < itemList.length; i++) {
            itemList[i].style.opacity = 0;
            pagenationList[i].style.background = "white";
        }
        itemList[index].style.transition = "opacity 1s ease .2s";
        itemList[index].style.opacity = 1;
        pagenationList[index].style.background = "blue";
    }

    var t1 = setInterval(nextFn, 2000);
    banner.onmouseover = function () {
        clearInterval(t1);
    }
    banner.onmouseout = function () {
        t1 = setInterval(nextFn, 2000);
    }

    pagenation.onclick = function (event) {
        event = window.event || event;
        if (event.target.className != "pagenation") {
            var id = event.target.id;
            var photoIndex = null;
            for (var i = 0; i < pagenationList.length; i++) {
                pagenationList[i].style.background = "white";
                if (id.indexOf(i) >= 0) {
                    photoIndex = i;
                }
            }
            event.target.style.background = "blue";
            index = photoIndex;
            for (var i = 0; i < itemList.length; i++) {
                itemList[i].style.opacity = 0;
            }
            itemList[index].style.transition = "opacity 1s ease .2s";
            itemList[photoIndex].style.opacity = 1;
        }
    }
</script>
</html>
