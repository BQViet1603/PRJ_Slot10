<%-- 
    Document   : viewCart
    Created on : Dec 25, 2022, 10:26:30 PM
    Author     : Teacher
--%>

<%@page import="java.util.Map"%>
<%@page import="hoan.session.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book store</title>
    </head>
    <body>
        <h1>Your Cart includes:</h1>     
        <%
            if(session !=null){
                CartObj cart = (CartObj)session.getAttribute("CART");
                if(cart != null){
                    if(cart.getItems() != null){
                    %>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Title</th>
                                <th>Quantity</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <form action="DispatchController">
                            <%
                            Map<String,Integer> items = cart.getItems();
                            int count = 0;
                            for(Map.Entry item : items.entrySet()){
                                %>
                                <tr>
                                    <td>
                                        <%=++count%>   
                                    .</td>
                                    <td>
                                        <%=item.getKey()%>
                                    </td>
                                    <td>
                                        <%=item.getValue()%>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="chkItem" value="<%=item.getKey()%>" />                               
                                    </td>
                                </tr> 
                                <%
                            } //end for
                            %>
                            <tr>
                                <td colspan="3">
                                    <a href="bookStore.html">Add more Items to your Cart</a>
                                </td>
                                <td>
                                    <input type="submit" value="Remove selected Items" name="btAction" />
                                </td>
                            </tr>
                        </form>
                        </tbody>
                    </table>

                    
                    
                    <%
                        return;
                    }           
                }// end if cart
            }//end if session
        %>
        
        <h1>No cart exited</h1>
    </body>
</html>
