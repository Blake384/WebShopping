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
    <LINK href="<%=basePath %>admin/images/syscome.files/Admin.css" rel="stylesheet">
    <SCRIPT language="javascript" src="<%=basePath %>images/syscome.files/Admin.js"></SCRIPT>

    <STYLE type="text/css">
        .STYLE1 {
            FONT-WEIGHT: bold;
            COLOR: #0099ff;
        }
    </STYLE>
    <script language="javascript">
        function check() {
            var name = document.getElementById("name").value;
            if (name == null || name == '') {
                alert("Category name cannot be empty!");
                return false;
            }
        }
    </script>
    <META content="MSHTML 6.00.2900.5726" name="GENERATOR">
</HEAD>
<BODY>
<BR>
<TABLE class="tableborder" cellSpacing="1" cellPadding="3" width="95%" align="center" border="0">
</TABLE>
<BR>
<form action="CommodityClassAction!updateCommodityClass.action" method="post" onsubmit="return check();">
    <TABLE cellSpacing="1" cellPadding="3" width="95%" align="center" bgColor="#6ab6b6" border="0">
        <TBODY>
            <TR>
                <TH colSpan="2" height="24">【Edit Category Name】</TH>
            </TR>
            <TR>
                <TD class="forumrow" width="30%" height="24"><div align="right">Category ID:</div></TD>
                <TD class="forumrowhighlight" width="70%" height="24">
                    <input type="text" name="commodityClass.commodityClassId" id="id" value="${sessionScope.commodityClassById.commodityClassId}" readonly="readonly">
                </TD>
            </TR>
            <TR>
                <TD class="forumrow" width="30%" height="24"><div align="right">Category Name:</div></TD>
                <TD class="forumrowhighlight" width="70%" height="24">
                    <input type="text" name="commodityClass.commodityClassName" id="name" value="${sessionScope.commodityClassById.commodityClassName}">
                </TD>
            </TR>
            <TR>
                <TD class="forumrow" height="24"></TD>
                <TD class="forumrowhighlight" height="24">
                    <span class="forumrow">
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                    </span>
                </TD>
            </TR>
            <TR>
                <TD align="center" colSpan="2" height="24px" class="forumrow">
                    <div id="message">${message}</div>
                </TD>
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
