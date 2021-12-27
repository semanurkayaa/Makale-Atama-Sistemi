<%@page import="java.sql.ResultSet"%>
<%@page import="yeniiii.kategoriveriler"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="atamayap_islem.jsp">
  <select name="item"> 
     <%
     int makaleid=Integer.parseInt( request.getParameter("id"));
     session.setAttribute("makaleid", makaleid);
     kategoriveriler vt= new kategoriveriler();
     ResultSet rs= vt.ogretmenGetir();
     while(rs.next()) {
     int ogretmenId=Integer.parseInt(rs.getString("idhocalar"));
     System.out.print("İD HOCALAR"+ogretmenId);
     %>
     <option value=<%=ogretmenId%>><%=rs.getString("hocadi")%>  <%=rs.getString("puan")%>  </option>
     <%
     }
      %>
  </select>
  <input type="submit" value="Submit">
</form>
</body>
</html>