package Model;
// Generated Apr 1, 2016 10:18:00 AM by Hibernate Tools 4.3.1



/**
 * Matiere generated by hbm2java
 */
public class Matiere  implements java.io.Serializable {


     private Integer idMatiere;
     private String libelle;
     private int idModule;

    public Matiere() {
    }

    public Matiere(String libelle, int idModule) {
       this.libelle = libelle;
       this.idModule = idModule;
    }
   
    public Integer getIdMatiere() {
        return this.idMatiere;
    }
    
    public void setIdMatiere(Integer idMatiere) {
        this.idMatiere = idMatiere;
    }
    public String getLibelle() {
        return this.libelle;
    }
    
    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    public int getIdModule() {
        return this.idModule;
    }
    
    public void setIdModule(int idModule) {
        this.idModule = idModule;
    }




}


