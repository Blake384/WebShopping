<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>Welcome to the System Backend</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=UTF-8">
    <LINK href="<%=basePath %>admin/images/syscome.files/Admin.css" rel=stylesheet>
    <SCRIPT language=javascript src="<%=basePath %>images/syscome.files/Admin.js"></SCRIPT>

    <STYLE type=text/css>.STYLE1 { FONT-WEIGHT: bold; COLOR: #0099ff }</STYLE>
    <META content="MSHTML 6.00.2900.5726" name=GENERATOR>
</HEAD>
<BODY><BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center border=0>
</TABLE><BR>
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 border=0>

  <TBODY>
  <TR>
    <TH colSpan=8 height=24>【User List】<a href="include/user/userQuery.jsp">Click to Query User</a></TH>
  </TR>
     <TR>
    <TD class=forumrow align="center" width="8%">User ID</TD>
    <TD class=forumrow align="center" width="15%">Username</TD>
    <TD class=forumrow align="center" width="10%">Name</TD>
    <TD class=forumrow align="center" width="10%">Gender</TD>
    <TD class=forumrow align="center" width="10%">Contact Number</TD>
    <TD class=forumrow align="center" width="18%">Mailing Address</TD>
    <TD class=forumrow align="center" colspan="2" width="12%">Actions</TD>
  </TR>
   <s:if test="#request.listUsers.isEmpty">
 <div><h3>No relevant information found!</h3></div> 
  </s:if><s:else>
    <s:iterator value="#request.listUsers" id="listUsers">
  <TR>
    <TD class=forumrow height=24 align="center"><s:property value="#listUsers.userId"/></TD>
    <TD class=forumrowhighlight  height=24 align="center"><s:property value="#listUsers.username"/></TD>
    <TD class=forumrowhighlight  height=24 align="center"><s:property value="#listUsers.name"/></TD>
    <TD class=forumrowhighlight height=24 align="center"><s:property value="#listUsers.sex"/></TD>
    <TD class=forumrowhighlight height=24 align="center"><s:property value="#listUsers.phone"/></TD>
    <TD class=forumrowhighlight  height=24 align="center"><s:property value="#listUsers.address"/></TD>
  <TD class=forumrowhighlight height=24 align="center">
  <s:a href="UserAction!deleteUser.action?user.userId=%{#listUsers.userId}" onclick="return confirm('Are you sure you want to delete this user?')">Delete</s:a></TD>
    <TD class=forumrowhighlight  height=24 align="center"><s:a href="UserAction!upUser.action?user.userId=%{#listUsers.userId}">Edit</s:a></TD>
  </TR>
  </s:iterator></s:else>
  
    <TR>
    <TD class=forumrow height=24 colspan="12" align="center">
    
    </TD>
  </TR>
  </TBODY>
  </TABLE>
<BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center border=0>
</TABLE><BR>
</BODY></HTML>
