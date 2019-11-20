package edu.jsu.mcis.cs425.project2;

import java.sql.Connection;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.*;

public class JobReport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        
        response.setContentType("application/pdf");
        
        try {
            
            /* Create Parameter Collection for JasperReports */
            
            HashMap<String, Integer> params = new HashMap<>();
            
            /* Acquire Servlet Context, Output Stream, and Report File Name */
            
            ServletContext context = getServletContext();
            ServletOutputStream out = response.getOutputStream();
            String reportFile = context.getRealPath("/main/reports/JobReport.jasper");
            
            /* Acquire Session Bean */
            
            BeanApplicant applicant = (BeanApplicant)request.getSession().getAttribute("applicant");
            
            /* Acquire Database Connection from JDBC Pool */
            
            Database db = new Database();
            Connection conn = db.getConnection();
            
            /* Add JasperReport Parameter(s) */
            
            int userid = applicant.getId();
            params.put("userid", userid);
            
            /* Generate Report Data (PDF) Using JasperReports */
        
            byte[] byteStream = JasperRunManager.runReportToPdf(reportFile, params, conn);
            
            /* Send Report Data to Client */
            
            response.setContentLength(byteStream.length);
            out.write(byteStream, 0, byteStream.length);
            
        }
        
        catch (Exception e) { e.printStackTrace(); }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        
        doGet(request, response);
        
    }

    @Override
    public String getServletInfo() {
        
        return "Job Report Servlet";
        
    }

}