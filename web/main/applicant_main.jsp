<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="applicant" class="edu.jsu.mcis.cs425.project2.BeanApplicant" scope="session" />
<jsp:setProperty name="applicant" property="username" value="<%= request.getRemoteUser() %>" />
<% applicant.setUserInfo(); %>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applicant Welcome Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="main/applicantcss.css">
    </head>
    
    <body>
        
        <header>
            <h1>Hello, <jsp:getProperty name="applicant" property="displayname" />!</h1>
        </header>
        
            <a href="<%= request.getContextPath() %>/main/applicant_skills.jsp">Skills List</a><br>
            <a href="<%= request.getContextPath() %>/public/logout.jsp" target="_self">Log Out</a>
        </div
    </body>
    
</html>