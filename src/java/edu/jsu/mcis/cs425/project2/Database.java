
package edu.jsu.mcis.cs425.project2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;

public class Database {
    
    
    
    private int userid ;
    
    private Connection getConnection() {
        Connection conn = null;
        try {
            
           Context  envContext = new InitialContext();
           Context initContext  = (Context)envContext.lookup("java:/comp/env");
           DataSource ds = (DataSource)initContext.lookup("jdbc/db_pool");
           conn = ds.getConnection();
            
        }
        
        catch (Exception e) {
            e.printStackTrace();
        } 
        
        return conn;
    }
    
    public HashMap getUserInfo(String username){ 
        HashMap<String, String> results = null;
    
        try{
               Connection conn = getConnection();
               
               String query = "SELECT * FROM 'user' WHERE username = ?";
               PreparedStatement pstatement = conn.prepareStatement(query);
               pstatement.setString(1, username);
               
               boolean hasresults = pstatement.execute();
               
               if( hasresults){
                   ResultSet resultset = pstatement.getResultSet();
                   
                   if(resultset.next()){
                       //Initialize Hashmap; add user data from resultset
                       //use key name "id" for the ID, and "displayname" for the
                       //displayname
                       results = new HashMap<>();
                       String id = String.valueOf(resultset.getInt("id"));
                       String displayname = resultset.getString("displayname");
                       results.put("id", id);
                       results.put("displayname",displayname);
                       
                       
                       
                       
                   }
               }
        }
        
        catch(Exception e){
            e.printStackTrace();
        }
        return results; //needs to return the HashMap
    
    }
}
    
    

