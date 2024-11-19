<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>Change Admin Password</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=UTF-8">
    <LINK href="../../images/syscome.files/Admin.css" rel=stylesheet>
    <SCRIPT language=javascript src="../../images/syscome.files/Admin.js"></SCRIPT>

    <STYLE type="text/css">
        .STYLE1 {
            FONT-WEIGHT: bold;
            COLOR: #0099ff;
        }
    </STYLE>
    <script>
        function check() {  
            var newpass = document.getElementById("newpass").value;
            var newrepass = document.getElementById("newrepass").value;

            if (newpass == null || newpass == '') {
                alert("New password cannot be empty!");
                return false;
            }
            if (newrepass == null || newrepass == '') {
                alert("Confirm password cannot be empty!");
                return false;
            }
            if (newpass != newrepass) {
                alert("Passwords do not match!");
                return false;
            }
        }
    </script>
    <META content="MSHTML 6.00.2900.5726" name=GENERATOR>
</HEAD>
<BODY>
<BR>
<TABLE class="tableborder" cellSpacing="1" cellPadding="3" width="95%" align="center" border="0">
</TABLE>
<BR>
<form name="myform" method="post" action="AdminAction!updateAdmin.action" onsubmit="return check();">
    <TABLE cellSpacing="1" cellPadding="3" width="95%" align="center" bgColor="#6ab6b6" border="0">
        <TBODY>
            <TR>
                <TH colSpan="9" height="24">【Change Login Password】
                    <input type="hidden" name="admin.adminId" value="${sessionScope.admin.adminId}"/>
                    <input type="hidden" name="admin.username" value="${sessionScope.admin.username}"/>   
                </TH>  
            </TR>
            <TR>
                <TD class="forumrow"><div align="right">New Password:</div></TD>
                <TD colspan="8" class="forumrowhighlight"><input type="password" name="admin.password" id="newpass"></TD>
            </TR>
            <TR>
                <TD class="forumrow"><div align="right">Confirm Password:</div></TD>
                <TD colspan="8" class="forumrowhighlight"><input type="password" name="repassword" id="newrepass"></TD>
            </TR>
            <TR>
                <TD class="forumrow">&nbsp;</TD>
                <TD colspan="8" class="forumrowhighlight">
                    <input type="submit" name="Submit" value="Submit">
                    <input type="reset" name="Submit2" value="Reset">
                </TD>
            </TR>
            <TR>
                <TD class="forumrow">&nbsp;</TD>
                <TD colspan="8" class="forumrowhighlight"> ${upAdminMessage} </TD>
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
