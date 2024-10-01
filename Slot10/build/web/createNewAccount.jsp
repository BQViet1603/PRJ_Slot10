<%-- 
    Document   : createNewAccount
    Created on : Dec 26, 2022, 4:11:30 PM
    Author     : Teacher
--%>

<%@page import="hoan.registration.RegistrationInsertError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Account</title>
    </head>
    <body>
        <h1>Create new Account:</h1>
        <form action="DispatchController" method="POST">
            Username*<input type="text" name="txtUsername" value="<%= request.getParameter("txtUsername") %>" />(6 - 20 chars)<br/>
            <font color ="red">
            <% 
                RegistrationInsertError errors = (RegistrationInsertError)request.getAttribute("INSERTERR");
                if(errors != null){
                    if(errors.getUsernameLengthErr() != null){
                        %>
                        <%= errors.getUsernameLengthErr() %><br/>
                        <%
                    }
                }//end if errors
            %>
            </font>
            Password*<input type="password" name="txtPassword" value="" />(6 - 30 chars)<br/>
            <font color ="red">
            <%
                if (errors != null) {
                    if (errors.getPasswordLengthErr() != null) {
                        %>
                        <%= errors.getPasswordLengthErr()%><br/>
                        <%
                    }
                }//end if errors
            %>
            </font>
            Confirm*<input type="password" name="txtConfirm" value="" /><br/>
            <font color ="red">
            <%
                if (errors != null) {
                    if (errors.getConfirmNotMatch() != null) {
                        %>
                        <%= errors.getConfirmNotMatch()%><br/>
                        <%
                    }
                }//end if errors
            %>
            </font>
            Full name<input type="text" name="txtFullname" value="<%= request.getParameter("txtFullname")  %>" />(6 - 50 chars)<br/>
            <font color ="red">
            <%
                if (errors != null) {
                    if (errors.getFullNameLengthErr() != null) {
                        %>
                        <%= errors.getFullNameLengthErr()%><br/>
                        <%
                    }
                }//end if errors
            %>
            </font>            
            <input type="submit" value="Create new Account" name="btAction" />
            <input type="reset" value="Reset" />
            <font color ="red">
            <%
                if (errors != null) {
                    if (errors.getUsernameIsExited() != null) {
                        %>
                        <%= errors.getUsernameIsExited()%><br/>
                        <%
                    }
                }//end if errors
            %>
            </font>            
        </form>
    </body>
</html>
