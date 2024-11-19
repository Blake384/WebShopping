<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>Welcome to the System Backend</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=UTF-8">
    <LINK href="../../images/syscome.files/Admin.css" rel="stylesheet">
    <SCRIPT language="javascript" src="../../images/syscome.files/Admin.js"></SCRIPT>

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

<form name="form1" method="post" action="MessageAction!queryMessage.action" onsubmit="return check();">
    <TABLE cellSpacing="1" cellPadding="3" width="95%" align="center" bgColor="#6ab6b6" border="0">
        <TBODY>
            <TR>
                <TH colSpan="9" height="24">【Message Query】</TH>
            </TR>
            <TR>
                <TD class="forumrow">
                    <div align="right">User:</div>
                </TD>
                <TD colspan="8" class="forumrowhighlight">
                    <input type="text" name="message.username">
                </TD>
            </TR>
            <TR>
                <TD class="forumrow">
                    <div align="right">Title:</div>
                </TD>
                <TD colspan="8" class="forumrowhighlight">
                    <input type="text" name="message.messagetitle">
                </TD>
            </TR>
            <TR>
                <TD class="forumrow">&nbsp;</TD>
                <TD colspan="8" class="forumrowhighlight">
                    <input type="submit" name="mysubmit" value="Submit">
                    <input type="reset" name="Submit2" value="Reset">
                </TD>
            </TR>
        </TBODY>
    </TABLE>
</form>

<s:if test="#request.queryMessage == null">
    <TABLE cellSpacing="1" cellPadding="3" width="95%" align="center" bgColor="#6ab6b6" border="0">
        <TBODY>
            <TR>
                <TD colSpan="8" align="center">No relevant information!</TD>
            </TR>
        </TBODY>
    </TABLE>
</s:if>

<s:else>
    <TABLE cellSpacing="1" cellPadding="3" width="95%" align="center" bgColor="#6ab6b6" border="0">
        <TBODY>
            <TR>
                <TH colSpan="10" height="24">【Message List】</TH>
            </TR>
            <TR>
                <TD class="forumrow" align="center" width="8%">Message ID</TD>
                <TD class="forumrow" align="center">User</TD>
                <TD class="forumrow" align="center">Time</TD>
                <TD class="forumrow" align="center">Title</TD>
                <TD class="forumrow" align="center">Content</TD>
                <TD class="forumrow" align="center">Action</TD>
            </TR>
            <s:iterator value="#request.queryMessage" id="queryMessage">
                <TR>
                    <TD class="forumrow" height="24" align="center"><s:property value="#queryMessage.messageId"/></TD>
                    <TD class="forumrowhighlight" height="24" align="center"><s:property value="#queryMessage.username"/></TD>
                    <TD class="forumrowhighlight" height="24" align="center"><s:property value="#queryMessage.messagetime"/></TD>
                    <TD class="forumrowhighlight" height="24" align="center"><s:property value="#queryMessage.messagetitle"/></TD>
                    <TD class="forumrowhighlight" height="24" align="center"><s:property value="#queryMessage.messagetext"/></TD>
                    <TD class="forumrowhighlight" height="24" align="center">
                        <s:a href="MessageAction!deleteMessage.action?message.messageId=%{#queryMessage.messageId}" onclick="return confirm('Are you sure you want to delete?')">Delete</s:a>
                    </TD>
                </TR>
            </s:iterator>
        </TBODY>
    </TABLE>
</s:else>

<BR>
<TABLE class="tableborder" cellSpacing="1" cellPadding="3" width="95%" align="center" border="0">
</TABLE>
<BR>
</BODY>
</HTML>
