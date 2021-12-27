<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sayiCrud" class="yeniiii.kategoriveriler" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="yeniiii.kategoribilgisi" scope="page" ></jsp:useBean>
<%
boolean sonuc=false;
String yazarkullaniciad=request.getParameter("yazarkullaniciad");
String yazarsifre=request.getParameter("yazarsifre");
String yazarmail=request.getParameter("yazarmail");

System.out.println(yazarkullaniciad);
System.out.println(yazarsifre);
System.out.println(yazarmail);
System.out.println();

sayiNesnesi.setyazarkullaniciad(yazarkullaniciad);
sayiNesnesi.setyazarsifre(yazarsifre);
sayiNesnesi.setyazarmail(yazarmail);

sonuc = sayiCrud.yazarekle(sayiNesnesi);

if (sonuc == true)
	out.println("Veriler kaydedildi...");
response.sendRedirect("yazar_giris.jsp");
%>
