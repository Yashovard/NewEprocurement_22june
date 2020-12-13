<%-- 
    Document   : ChangePassword
    Created on : 26 Jul, 2018, 6:52:30 PM
    Author     : Windows7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset</title>
    </head>
    <body>
        <h1>Password Reset here</h1>
        <table>
        <s:form action="PassChange" modelAttribute="contractor">
            Old Password: <s:password path="password"/></br>
            New Password: <s:password path="newPassword"/></br>
            Confirm Password: <s:password path="currentPassword"/></br>
            </br>
            <tr>
                <s:button>Submit</s:button>
                    </tr>    
        </s:form>
                    </table>
    </body>
</html>