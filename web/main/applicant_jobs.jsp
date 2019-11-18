<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="applicant" class="edu.jsu.mcis.cs425.project2.BeanApplicant" scope="session" />
<jsp:setProperty name="applicant" property="*" />
<%
   if (applicant.getSkills() != null) {
      applicant.setSkillsList();
   }
%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Select Jobs</title>
   </head>
   <body>
      <form id="jobsform" name="jobsform" method="post" action="applicant_report.jsp">
         <fieldset>
            <legend>Select Your Job(s):</legend>
            <jsp:getProperty name="applicant" property="jobsList" />
            <input type="submit" value="Submit" />
         </fieldset>
      </form>
   </body>
</html>