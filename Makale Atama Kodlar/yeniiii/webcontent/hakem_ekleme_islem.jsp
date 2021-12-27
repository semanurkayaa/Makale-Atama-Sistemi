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
String hocakullaniciadi=request.getParameter("hocakullaniciadi");
String hocasifre=request.getParameter("hocasifre");
String hocamail=request.getParameter("hocamail");

System.out.println(hocakullaniciadi);
System.out.println(hocasifre);
System.out.println(hocamail);
System.out.println();

sayiNesnesi.sethocakullaniciadi(hocakullaniciadi);
sayiNesnesi.sethocasifre(hocasifre);
sayiNesnesi.sethocamail(hocamail);

sonuc = sayiCrud.hakemekle(sayiNesnesi);

if (sonuc == true)
	out.println("Veriler kaydedildi...");
response.sendRedirect("hakem_giris.jsp");
%>
