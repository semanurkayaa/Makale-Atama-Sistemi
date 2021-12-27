<%@page import="yeniiii.kategoriveriler"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
 
<html>
    <head>
        <title>File Upload</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    <%
       
    int yazarid=(int) session.getAttribute("yazarid");
    System.out.println("yazarid = "+yazarid);
 
    
    %>

        <form method="POST" action="pdfyukleme" enctype="multipart/form-data" >

    </div>
     <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
         
           <label for="uname"><b>BAŞLIK</b></label>
           <br><br>
           <input type="text"  name="baslik" id="baslik" class="form-control" required>
           <br><br><br>

           <label for="uname"><b>İÇERİK</b></label>
           <br><br>
           <textarea type="text" id="icerik" name="icerik" rows="4" cols="50" style="width: 400px; height: 200px;" required="required"> </textarea>
           <br>
           <li class="w3-light-grey w3-padding-24">
           <br>
<label>Kategori</label>  
<div> 
     <br>
       <select id="idkategori" name ="kategori" style="width: 400px; height: 40px;" > 
   		<% 

   	  
   	    kategoriveriler kt = new kategoriveriler();
   	    ResultSet rs =  kt.kategoriGetir();  
  	while(rs.next()) 
  	{
  		%> 
  		
     <option value="<%=rs.getString("kategoriadi")%>"><%=rs.getString("kategoriadi")%></option>
  	<%
  	}
  	%>
  	</select>
<script>
$(function(){
$("#idkategori").change(function() {
var deger = $(this).val();
$("#kategorisec").val(deger);
});
})
</script><br><br>

<table> 

         
        <tr><td>PDF SEÇ</td>
            <td><input type="file" name="file" id="file" /> </td>
        </tr>
        
        
   </table>
           <br>
           <tr><br>
        <td colspan="2">
            <input type="submit" value="Upload" name="upload" id="upload" /> </td>
        </tr>
          </li>
        </ul>
           <br>
    
   </div>
  
   
   
   
   
   
   
   
   
        </form>
    </body>
</html>