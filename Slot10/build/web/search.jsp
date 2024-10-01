<%-- 
    Document   : search
    Created on : Dec 22, 2022, 7:03:20 PM
    Author     : Teacher
--%>

<%@page import="hoan.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <%
        Cookie[] cookies =request.getCookies();
            if(cookies != null){
                String username = cookies[cookies.length - 1].getName();
            %>
            <h1><font color = "red">Wellcome, <%=username%></font></h1>
            <%
        }
        %>
        <div>Search</div>
        <form action="DispatchController">
            Search Value: <input type="text" name="txtSearchValue" value="<%= request.getParameter("txtSearchValue")%>" /></br>
            <input type="submit" value="Search" name="btAction" />
        </form>
        <%
            String searchValue = request.getParameter("txtSearchValue");
            if (searchValue != null) {
                List<RegistrationDTO> result = (List<RegistrationDTO>) request.getAttribute("SEARCHRESULT");
                if (result != null) {
                    %>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Full name</th>
                                <th>Role</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            int count = 0;
                            for (RegistrationDTO dto: result){
                                %>
                                <form action="DispatchController">
                                <tr>
                                    <td>
                                        <%= ++count %>
                                    </td>
                                    <td>
                                        <%= dto.getUsername() %>
                                        <input type="hidden" name="txtUsername" value="<%= dto.getUsername() %>" />
                                    </td>
                                    <td>
                                        <input type="password" name="txtPassword" value="<%= dto.getPassword() %>" />   
                                    </td>
                                    <td>
                                        <%= dto.getFullName() %>
                                    </td>
                                    <%if(dto.isRole()){%>
                                    <td>
                                        <input type="checkbox" name="chkAdmin" value="ADMIN" checked="checked" />
                                    </td>                              
                                    <%}
                                    else{%>
                                     <td>
                                        <input type="checkbox" name="chkAdmin" value="ADMIN"/>
                                    </td>
                                    <%}%>
                                    <% String urlRewriting = "DispatchController?btAction=del&pk=" 
                                            + dto.getUsername() + "&lastSearchValue="
                                            + request.getParameter("txtSearchValue");                                   
                                    %>
                                    <td>
                                        <a href="<%= urlRewriting %>">Delete</a>                                     
                                    </td>
                                    <td>
                                        <input type="submit" value="Update" name="btAction" />
                                        <input type="hidden" name="lastSearchValue" value="<%=searchValue%>" />
                                        
                                    </td>
                                </tr>
                                </form>

                                <%
                            } //end for traversing dto   
                            %>
                        </tbody>
                    </table>

                    <%
                } 
                else {
                    %>
                    <h2>
                        No record is matched!!
                    </h2>
                    <%
                }
            } //check first time for search value
        %>

    </body>
</html>
