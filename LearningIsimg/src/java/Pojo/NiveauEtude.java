package Pojo;
// Generated 12 avr. 2014 14:58:19 by Hibernate Tools 3.6.0



/**
 * NiveauEtude generated by hbm2java
 */
public class NiveauEtude  implements java.io.Serializable {


     private Integer idNiveau;
     private String nom;
     private String description;

    public NiveauEtude() {
    }

    public NiveauEtude(String nom, String description) {
       this.nom = nom;
       this.description = description;
    }
   
    public Integer getIdNiveau() {
        return this.idNiveau;
    }
    
    public void setIdNiveau(Integer idNiveau) {
        this.idNiveau = idNiveau;
    }
    public String getNom() {
        return this.nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }




}

