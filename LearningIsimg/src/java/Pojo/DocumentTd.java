package Pojo;
// Generated 12 avr. 2014 14:58:19 by Hibernate Tools 3.6.0



/**
 * DocumentTd generated by hbm2java
 */
public class DocumentTd  implements java.io.Serializable {


     private Integer idDocumentTd;
     private String nom;
     private String description;
     private String fichierJointe;
     private String dateAjout;
     private String matiere;
     private int niveau;
     private String filliere;
     private int idEnseignant;

    public DocumentTd() {
    }

    public DocumentTd(String nom, String description, String fichierJointe, String dateAjout, String matiere, int niveau, String filliere, int idEnseignant) {
       this.nom = nom;
       this.description = description;
       this.fichierJointe = fichierJointe;
       this.dateAjout = dateAjout;
       this.matiere = matiere;
       this.niveau = niveau;
       this.filliere = filliere;
       this.idEnseignant = idEnseignant;
    }
   
    public Integer getIdDocumentTd() {
        return this.idDocumentTd;
    }
    
    public void setIdDocumentTd(Integer idDocumentTd) {
        this.idDocumentTd = idDocumentTd;
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
    public String getFichierJointe() {
        return this.fichierJointe;
    }
    
    public void setFichierJointe(String fichierJointe) {
        this.fichierJointe = fichierJointe;
    }
    public String getDateAjout() {
        return this.dateAjout;
    }
    
    public void setDateAjout(String dateAjout) {
        this.dateAjout = dateAjout;
    }
    public String getMatiere() {
        return this.matiere;
    }
    
    public void setMatiere(String matiere) {
        this.matiere = matiere;
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


