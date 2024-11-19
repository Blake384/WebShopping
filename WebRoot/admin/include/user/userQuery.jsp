<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>Welcome to the System Backend</TITLE>
<META http-equiv=Content-Type content="text/html; charset=UTF-8"><LINK 
href="../../images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="../../images/syscome.files/Admin.js"></SCRIPT>

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY><BR>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center 
border=0>
</TABLE><BR>
<form name="myform" method="post" action="UserAction!queryUser.action">
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TH colSpan=9 height=24>【User Query】
    </TH>  
  </TR>
  <TR>
    <TD class=forumrow><div align="right">Username：</div></TD>
    <TD colspan="8" class=forumrowhighlight>
      <input type="text" name="user.username">    </TD>
    </TR>
  <TR>
    <TD class=forumrow>&nbsp;</TD>
    <TD colspan="8" class=forumrowhighlight><input type="submit" name="Submit" value="Submit">
      <input type="reset" name="Submit2" value="Reset"></TD>
  </TR>
  <TR>
    <TD class=forumrow height=24>&nbsp;</TD>
    <TD class=forumrowhighlight
        height=24>${addComessage}</TD>
  </TR>
  </TBODY></TABLE>
</form>  
<BR>
<s:if test="#request.queryUser==null">
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 border=0>

  <TBODY>
  <TR><td colSpan=8 align="center">No relevant information</td></TR></TBODY></TABLE>
</s:if>
 <s:else>
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 border=0>

  <TBODY>
  <TR>
    <TH colSpan=8 height=24>Query Information </TH> 
   </TR>
     <TR>
    <TD class=forumrow align="center" width="8%">User ID</TD>
    <TD class=forumrow align="center" width="15%">Username</TD>
    <TD class=forumrow align="center" width="10%">Name</TD>
    <TD class=forumrow align="center" width="10%">Gender</TD>
    <TD class=forumrow align="center" width="10%">Contact Number</TD>
    <TD class=forumrow align="center" width="18%">Mailing Address</TD>
    <TD class=forumrow align="center" width="12%">Actions</TD>
  </TR>
   
    <s:iterator value="#request.queryUser" id="queryUser" >
    
  <TR>
    <TD class=forumrow height=24 align="center"> <s:property value="#queryUser.userId"/></TD>
    <TD class=forumrowhighlight  height=24 align="center"><s:property value="#queryUser.username"/></TD>
    <TD class=forumrowhighlight  height=24 align="center"><s:property value="#queryUser.name"/></TD>
    <TD class=forumrowhighlight height=24 align="center"> <s:property value="#queryUser.sex"/></TD>
    
    <TD class=forumrowhighlight height=24 align="center"><s:property value="#queryUser.phone"/></TD>
    <TD class=forumrowhighlight  height=24 align="center"><s:property value="#queryUser.address"/></TD>

    
  <TD class=forumrowhighlight height=24 align="center">
  <a href="UserAction!deleteUser.action?user.userId=%{#queryUser.userId}" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a> </TD>   
  </TR>
  </s:iterator>
    <TR>
    <TD class=forumrow height=24 colspan="12" align="center">
    
    </TD>
  </TR>
  </TBODY>
  </TABLE> </s:else>
<TABLE class=tableborder cellSpacing=1 cellPadding=3 width="95%" align=center border=0>
</TABLE><BR>
</BODY></HTML>
