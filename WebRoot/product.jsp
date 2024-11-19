<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
  <head>
    <title>Product Information</title>
  </head>
  <link rel="stylesheet" type="text/css" href="js/style.css" />
  <body>
  
  <div class="center_content">
   	<div class="center_title_bar">Latest Products</div>
    	 	<div class="prod_box">
	        	<div class="top_prod_box"></div>
	            <div class="center_prod_box">            
	                 <div class="product_title"> <a href="CommodityAction!findCommodityById.action?commodity.commodityId=1" target="_top">Vegetable</a></div>
	                 <div class="product_img"><a href="CommodityAction!findCommodityById.action?commodity.commodityId=1" target="_top"><img src="product/download.jpg" alt="Vegetable" title="" border="0" /></a></div>
	                 <div class="prod_price"><span class="reduce">$30</span> <span class="price">$20</span></div>                        
	            </div>
	            <div class="bottom_prod_box"></div>             
	            <div class="prod_details_tab">
	            <a href="AddToCarAction?commodity.commodityId=1" title="header=[Add to Cart] body=[&nbsp;] fade=[on]" target="_top"><img src="images/cart.gif" alt="Add to Cart" title="Add to Cart" border="0" class="left_bt" /></a>          
	            <a href="CommodityAction!findCommodityById.action?commodity.commodityId=1" class="prod_details" target="_top">Details</a></div>                     
	        </div>
	        
   </div>
  </body>
</html>
