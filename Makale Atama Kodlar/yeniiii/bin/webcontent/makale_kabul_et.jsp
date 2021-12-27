<%@page import="yeniiii.kategoriveriler"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
LocalDate bugun=LocalDate.now(); 
int makaleId=Integer.parseInt(request.getParameter("id"));
System.out.print("makale id "+makaleId );
kategoriveriler kt = new  kategoriveriler();
 Boolean b =   kt.ogretmenmakaleKabulEt(makaleId);
 if(b){
	System.out.print("MAKALE REDDEDİLME İŞLEMİ BAŞARILI");
}
else {
	System.out.print("MAKALE REDDEDİLME İŞLEMİ BAŞARISIZ");
}
%>



</body>
</html>