package Model;
// Generated Apr 1, 2016 10:18:00 AM by Hibernate Tools 4.3.1



/**
 * Admin generated by hbm2java
 */
public class Admin  implements java.io.Serializable {


     private Integer idAdmin;
     private String matricule;

    public Admin() {
    }

    public Admin(String matricule) {
       this.matricule = matricule;
    }
   
    public Integer getIdAdmin() {
        return this.idAdmin;
    }
    
    public void setIdAdmin(Integer idAdmin) {
        this.idAdmin = idAdmin;
    }
    public String getMatricule() {
        return this.matricule;
    }
    
    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }




}

