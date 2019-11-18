package edu.jsu.mcis.cs425.project2;

import java.util.HashMap;

public class BeanApplicant {
    
    private String username;
    private String displayname;
    private int id;
    
    private String[] skills;
    
    public void setUserInfo(){
        Database db = new Database();
        HashMap<String, String> userinfo = db.getUserInfo(username);
        id = Integer.parseInt(userinfo.get("id"));
        displayname = userinfo.get("displayname");
        
        
    
    
    }
    
   public void setSkillsList() {
        Database db = new Database();
        db.setSkillsList(id, skills);
}
   public String getJobsList() {
        Database db = new Database();
        return ( db.getJobsListAsHTML(id) );
}
   
    public String getSkillsList(){
       Database db = new Database();
      return(db.getSkillsListAsHTML(id));
    }

    public String[] getSkills() {
        return skills;
    }

    public void setSkills(String[] skills) {
        this.skills = skills;
    }
    
    
    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
           

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}