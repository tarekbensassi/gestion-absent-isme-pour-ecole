package Pojo;
// Generated 12 avr. 2014 14:58:19 by Hibernate Tools 3.6.0



/**
 * DocumentCours generated by hbm2java
 */
public class DocumentCours  implements java.io.Serializable {


     private Integer idDocCours;
     private String nom;
     private String fichierJointe;
     private String description;
     private String dateAjout;
     private String idMatiers;
     private int niveau;
     private String filliere;
     private int idEnseignant;

    public DocumentCours() {
    }

    public DocumentCours(String nom, String fichierJointe, String description, String dateAjout, String idMatiers, int niveau, String filliere, int idEnseignant) {
       this.nom = nom;
       this.fichierJointe = fichierJointe;
       this.description = description;
       this.dateAjout = dateAjout;
       this.idMatiers = idMatiers;
       this.niveau = niveau;
       this.filliere = filliere;
       this.idEnseignant = idEnseignant;
    }
   
    public Integer getIdDocCours() {
        return this.idDocCours;
    }
    
    public void setIdDocCours(Integer idDocCours) {
        this.idDocCours = idDocCours;
    }
    public String getNom() {
        return this.nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getFichierJointe() {
        return this.fichierJointe;
    }
    
    public void setFichierJointe(String fichierJointe) {
        this.fichierJointe = fichierJointe;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getDateAjout() {
        return this.dateAjout;
    }
    
    public void setDateAjout(String dateAjout) {
        this.dateAjout = dateAjout;
    }
    public String getIdMatiers() {
        return this.idMatiers;
    }
    
    public void setIdMatiers(String idMatiers) {
        this.idMatiers = idMatiers;
    }
    public int getNiveau() {
        return this.niveau;
    }
    
    public void setNiveau(int niveau) {
        this.niveau = niveau;
    }
    public String getFilliere() {
        return this.filliere;
    }
    
    public void setFilliere(String filliere) {
        this.filliere = filliere;
    }
    public int getIdEnseignant() {
        return this.idEnseignant;
    }
    
    public void setIdEnseignant(int idEnseignant) {
        this.idEnseignant = idEnseignant;
    }




}


