package Pojo;
// Generated 12 avr. 2014 14:58:19 by Hibernate Tools 3.6.0



/**
 * Messages generated by hbm2java
 */
public class Messages  implements java.io.Serializable {


     private Integer idMessages;
     private String titre;
     private String contenu;
     private String date;
     private int idDestinataire;
     private int idExpideteur;
     private int typeDestinataire;
     private int typeExpideteur;
     private int etat;

    public Messages() {
    }

    public Messages(String titre, String contenu, String date, int idDestinataire, int idExpideteur, int typeDestinataire, int typeExpideteur, int etat) {
       this.titre = titre;
       this.contenu = contenu;
       this.date = date;
       this.idDestinataire = idDestinataire;
       this.idExpideteur = idExpideteur;
       this.typeDestinataire = typeDestinataire;
       this.typeExpideteur = typeExpideteur;
       this.etat = etat;
    }
   
    public Integer getIdMessages() {
        return this.idMessages;
    }
    
    public void setIdMessages(Integer idMessages) {
        this.idMessages = idMessages;
    }
    public String getTitre() {
        return this.titre;
    }
    
    public void setTitre(String titre) {
        this.titre = titre;
    }
    public String getContenu() {
        return this.contenu;
    }
    
    public void setContenu(String contenu) {
        this.contenu = contenu;
    }
    public String getDate() {
        return this.date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    public int getIdDestinataire() {
        return this.idDestinataire;
    }
    
    public void setIdDestinataire(int idDestinataire) {
        this.idDestinataire = idDestinataire;
    }
    public int getIdExpideteur() {
        return this.idExpideteur;
    }
    
    public void setIdExpideteur(int idExpideteur) {
        this.idExpideteur = idExpideteur;
    }
    public int getTypeDestinataire() {
        return this.typeDestinataire;
    }
    
    public void setTypeDestinataire(int typeDestinataire) {
        this.typeDestinataire = typeDestinataire;
    }
    public int getTypeExpideteur() {
        return this.typeExpideteur;
    }
    
    public void setTypeExpideteur(int typeExpideteur) {
        this.typeExpideteur = typeExpideteur;
    }
    public int getEtat() {
        return this.etat;
    }
    
    public void setEtat(int etat) {
        this.etat = etat;
    }




}


