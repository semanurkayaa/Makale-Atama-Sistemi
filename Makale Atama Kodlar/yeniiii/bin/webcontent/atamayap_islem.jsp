 <%@page import="yeniiii.kategoriveriler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<%@page import="java.sql.ResultSet"%> 
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,javax.mail.*"%> 
<%@ page import="javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  int makaleid=(int ) session.getAttribute("makaleid");
  out.print("SEÇİLEN MAKALENİN İD Sİ "+makaleid); 
  int hocaid= Integer.parseInt( request.getParameter("item")) ; 
  kategoriveriler kt = new kategoriveriler();
    Boolean b = kt.makaleOgretmenAta(makaleid, hocaid);
    if(b){
    	out.print("MAKALE ATANDI");
    	
    	String result;

    	  // Get recipient's email-ID, message & subject-line from index.html page

    	   final String to = ogretmenMail;

    	   final String subject = "Makale Değerlendirme Sistemi";

    	   final String messg = "Bir hafta süreniz kalmıştır. Lütfen değerlendirmenizi yapın.";

    	 
    	   // Sender's email ID and password needs to be mentioned


    	   final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
    	   // Get a Properties object
    	      Properties props = System.getProperties();
    	      props.setProperty("mail.smtp.host", "smtp.gmail.com");
    	      props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
    	      props.setProperty("mail.smtp.socketFactory.fallback", "false");
    	      props.setProperty("mail.smtp.port", "465");
    	      props.setProperty("mail.smtp.socketFactory.port", "465");
    	      props.put("mail.smtp.auth", "true");
    	      props.put("mail.debug", "true");
    	      props.put("mail.store.protocol", "pop3");
    	      props.put("mail.transport.protocol", "smtp");
    	      final String username = "yalcinylde@gmail.com";//
    	      final String password = "";
    	      try{
    	   	   
    	   	   Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

    	   	        @Override

    	   	        protected PasswordAuthentication getPasswordAuthentication() {

    	   	            return new PasswordAuthentication(username, password);

    	   	        }

    	   	    });
    	   	   
    	   	  

    	     // -- Create a new message --
    	        Message msg = new MimeMessage(mailSession);
    	 
    	     // -- Set the FROM and TO fields --
    	        msg.setFrom(new InternetAddress("yalcinylde@gmail.com"));
    	        msg.setRecipients(Message.RecipientType.TO, 
    	                          InternetAddress.parse(to,false));
    	        msg.setSubject(subject);
    	        msg.setText(messg);
    	        msg.setSentDate(new Date());
    	        Transport.send(msg);
    	        response.sendRedirect("yonetici_mail_islemleri.jsp");
    	        System.out.println("Message sent.");
    	      }catch (MessagingException e){ 
    	        System.out.println("Erreur d'envoi, cause: " + e);
    	      }
    	 
    }
    else {
    	out.print("MAKALE ATANAMADI");
    }
   
%>
</body>
</html>