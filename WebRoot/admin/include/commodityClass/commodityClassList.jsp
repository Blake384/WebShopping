<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>Welcome to the System Backend</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK href="<%=basePath %>admin/images/syscome.files/Admin.css" rel="stylesheet">
    <SCRIPT language="javascript" src="<%=basePath %>images/syscome.files/Admin.js"></SCRIPT>

    <STYLE type="text/css">
        .STYLE1 {
            FONT-WEIGHT: bold;
            COLOR: #0099ff;
        }
    </STYLE>
    <META content="MSHTML 6.00.2900.5726" name="GENERATOR">
</HEAD>
<BODY>
<BR>
<TABLE class="tableborder" cellSpacing="1" cellPadding="3" width="95%" align="center" border="0">
</TABLE>
<BR>
<TABLE cellSpacing="1" cellPadding="3" width="95%" align="center" bgColor="#6ab6b6" border="0">
    <TBODY>
        <TR>
            <TH colSpan="4" height="24">【Product Category List】<s:a href="include/commodityClass/commodityClassAdd.jsp">Click to Add Category</s:a></TH>
        </TR>
        <TR>
            <TD class="forumrow" width="20%" height="24">
                <div align="center">Category ID</div>
            </TD>
            <TD class="forumrowhighlight" width="40%" height="24">
                <div align="center">Category Name</div>
            </TD>
            <TD class="forumrowhighlight" width="20%" height="24">
                <div align="center">Delete</div>
            </TD>
            <TD class="forumrowhighlight" width="20%" height="24">
                <div align="center">Edit</div>
            </TD>
        </TR>
        <s:iterator value="#request.listCommodityClasses" id="listCommodityClasses">
            <TR>
                <TD class="forumrow" height="24" align="center"><s:property value="#listCommodityClasses.commodityClassId" /></TD>
                <TD class="forumrowhighlight" height="24" align="center"><s:property value="#listCommodityClasses.commodityClassName" /></TD>
                <TD class="forumrowhighlight" height="24" align="center">
                    <s:a href="CommodityClassAction!deleteCommodityClass.action?commodityClass.commodityClassId=%{#listCommodityClasses.commodityClassId}" onclick="return confirm('Are you sure you want to delete this category?')">Delete</s:a>
                </TD>
                <TD class="forumrowhighlight" height="24" align="center">
                    <s:a href="CommodityClassAction!upCommodityClass.action?commodityClass.commodityClassId=%{#listCommodityClasses.commodityClassId}">Edit</s:a>
                </TD>
            </TR>
        </s:iterator>
    </TBODY>
</TABLE>
<BR>
<TABLE class="tableborder" cellSpacing="1" cellPadding="3" width="95%" align="center" border="0">
</TABLE>
<BR>
</BODY>
</HTML>
