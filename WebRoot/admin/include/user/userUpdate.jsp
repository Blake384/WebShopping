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
<form name="myform" method="post" action="UserAction!updateUser1.action">
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TH colSpan=9 height=24>【Edit User】
    </TH>  
  </TR>
  <TR>
    <TD class=forumrow><div align="right">Username：</div><input type="hidden" name="user.userId" value="${sessionScope.UserById.userId}"></TD>
    <TD colspan="8" class=forumrowhighlight>
      <input type="text" name="user.username" value="${sessionScope.UserById.username}" readonly="readonly">  </TD>
    </TR>
  <TR>
    <TD class=forumrow><div align="right">Password：</div></TD>
    <TD colspan="8" class=forumrowhighlight>
      <input type="text" name="user.password" value="${sessionScope.UserById.password}">  </TD>
  </TR>
  <TR>
  <TR>
    <TD class=forumrow><div align="right">Name：</div></TD>
    <TD colspan="8" class=forumrowhighlight>
      <input type="text" name="user.name" value="${sessionScope.UserById.name}"> </TD>
  </TR>
  <TR>
    <TD class=forumrow><div align="right">Gender：</div></TD>
    <TD colspan="8" class=forumrowhighlight>
      <select name="user.sex">
        <option value="${sessionScope.UserById.sex}" selected>${sessionScope.UserById.sex}</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option></select>
    </TD>
  </TR>
  <TR>
    <TD class=forumrow><div align="right">Phone：</div></TD>
    <TD colspan="8" class=forumrowhighlight>
      <input type="text" name="user.phone" value="${sessionScope.UserById.phone}"> </TD>
  </TR>
  <TR>
    <TD class=forumrow><div align="right">Address：</div></TD>
    <TD colspan="8" class=forumrowhighlight>
      <input type="text" name="user.address" value="${sessionScope.UserById.address}"> </TD>
  </TR>
  <TR>
    <TD class=forumrow><div align="right">Email：</div></TD>
    <TD colspan="8" class=forumrowhighlight>
      <input type="text" name="user.email" value="${sessionScope.UserById.email}"> </TD>
  </TR>
  <TR>
    <TD class=forumrow><div align="right">Balance：</div></TD>
    <TD colspan="8" class=forumrowhighlight>
      <input type="text" name="user.money" value="${sessionScope.UserById.money}" readonly="readonly"> </TD>
  </TR>
  <TR>
    <TD class=forumrow>&nbsp;</TD>
    <TD colspan="8" class=forumrowhighlight><input type="submit" name="Submit" value="Submit">
      <input type="reset" name="Submit2" value="Reset"></TD>
  </TR>

  </TBODY></TABLE>
</form>  

</BODY></HTML>
