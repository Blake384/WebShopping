<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>Welcome to the System Backend</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=UTF-8">
    <LINK href="<%=basePath %>admin/images/syscome.files/Admin.css" rel=stylesheet>
    <SCRIPT language=javascript src="<%=basePath %>images/syscome.files/Admin.js"></SCRIPT>

    <STYLE type="text/css">
        .STYLE1 {
            FONT-WEIGHT: bold;
            COLOR: #0099ff;
        }
    </STYLE>
    <script language="javascript">
        function check() {
            var name = document.getElementById("name").value;
            var manufacturer = document.getElementById("manufacturer").value;
            var Image = document.getElementById("Image").value;
            var commodityDepict = document.getElementById("commodityDepict").value;
            var commodityPrice = document.getElementById("commodityPrice").value;
            var webPrice = document.getElementById("webPrice").value;
            var commodityAmount = document.getElementById("commodityAmount").value;

            if (name == null || name == '') {
                alert("Product name cannot be empty!");
                return false;
            }
            if (manufacturer == null || manufacturer == '') {
                alert("Manufacturer cannot be empty!");
                return false;
            }
            if (Image == null || Image == '') {
                alert("Product image cannot be empty!");
                return false;
            }
            if (commodityDepict == null || commodityDepict == '') {
                alert("Product description cannot be empty!");
                return false;
            }
            if (commodityPrice == null || commodityPrice == '') {
                alert("Product price cannot be empty!");
                return false;
            }
            if (webPrice == null || webPrice == '') {
                alert("Web price cannot be empty!");
                return false;
            }
            if (commodityAmount == null || commodityAmount == '') {
                alert("Total product quantity cannot be empty!");
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        function change(aa) {
            document.getElementById("commodityLeaveNum").value = aa;
        }
    </script>

    <META content="MSHTML 6.00.2900.5726" name=GENERATOR>
</HEAD>
<BODY>
<BR>
<TABLE class="tableborder" cellSpacing="1" cellPadding="3" width="95%" align="center" border="0">
</TABLE>
<BR>
<form action="CommodityAction!addCommodity.action" method="post" enctype="multipart/form-data" name="myform" onsubmit="return check();">
    <TABLE cellSpacing="1" cellPadding="3" width="95%" align="center" bgColor="#6ab6b6" border="0">
        <TBODY>
            <TR>
                <TH colSpan="2" height="24">【Add New Product】</TH> 
            </TR>
            <TR>
                <TD class="forumrow" width="30%" height="24"><div align="right">Product Name:</div></TD>
                <TD class="forumrowhighlight" width="70%" height="24"><input type="text" name="commodity.commodityName" id="name"></TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"><div align="right">Product Category:</div></TD>
                <TD class="forumrowhighlight" height="24">
                    <select name="commodity.commodityClass.commodityClassId">
                        <s:iterator value="#request.commodityClasses" status="stuts" id="test">
                            <option value="<s:property value='#test.commodityClassId'/>"><s:property value="#test.commodityClassName"/></option>
                        </s:iterator>
                    </select>
                </TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"><div align="right">Manufacturer:</div></TD>
                <TD class="forumrowhighlight" height="24"><input type="text" name="commodity.manufacturer" id="manufacturer"/></TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"><div align="right">Product Image:</div></TD>
                <TD class="forumrowhighlight" height="24"><input type="file" name="image" id="Image" /></TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"><div align="right">Product Description:</div></TD>
                <TD class="forumrowhighlight" height="24"><textarea name="commodity.commodityDepict" cols="50" rows="5" id="commodityDepict"></textarea></TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"><div align="right">Product Price:</div></TD>
                <TD class="forumrowhighlight" height="24"><input type="text" name="commodity.commodityPrice" id="commodityPrice"></TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"><div align="right">Web Price:</div></TD>
                <TD class="forumrowhighlight" height="24"><input type="text" name="commodity.webPrice" id="webPrice"></TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"><div align="right">Total Product Quantity:</div></TD>
                <TD class="forumrowhighlight" height="24"><input type="text" name="commodity.commodityAmount" id="commodityAmount" onblur="change(this.value)"></TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"><div align="right">Remaining Quantity:</div></TD>
                <TD class="forumrowhighlight" height="24"><input type="text" name="commodity.commodityLeaveNum" id="commodityLeaveNum" readonly="readonly"></TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24">&nbsp;</TD>
                <TD class="forumrowhighlight" height="24">
                    <input type="submit" value="Submit">
                    <input type="reset" value="Reset">
                </TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24">&nbsp;</TD>
                <TD class="forumrowhighlight" height="24">${addComessage}</TD>
            </TR>
        </TBODY>
    </TABLE>
</form>
<BR>
<TABLE class="tableborder" cellSpacing="1" cellPadding="3" width="95%" align="center" border="0">
</TABLE>
<BR>
</BODY>
</HTML>
