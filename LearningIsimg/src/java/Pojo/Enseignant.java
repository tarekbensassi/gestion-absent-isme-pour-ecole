package Pojo;
// Generated 12 avr. 2014 14:58:19 by Hibernate Tools 3.6.0



/**
 * Enseignant generated by hbm2java
 */
public class Enseignant  implements java.io.Serializable {


     private Integer idEnseignant;
     private String nom;
     private String prenom;
     private String tel1;
     private String tel2;
     private String email;
     private String adresse;
     private int codePostale;
     private String image;
     private String login;
     private String password;
     private int etat;

    public Enseignant() {
    }

    public Enseignant(String nom, String prenom, String tel1, String tel2, String email, String adresse, int codePostale, String image, String login, String password, int etat) {
       this.nom = nom;
       this.prenom = prenom;
       this.tel1 = tel1;
       this.tel2 = tel2;
       this.email = email;
       this.adresse = adresse;
       this.codePostale = codePostale;
       this.image = image;
       this.login = login;
       this.password = password;
       this.etat = etat;
    }
   
    public Integer getIdEnseignant() {
        return this.idEnseignant;
    }
    
    public void setIdEnseignant(Integer idEnseignant) {
        this.idEnseignant = idEnseignant;
    }
    public String getNom() {
        return this.nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return this.prenom;
    }
    
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public String getTel1() {
        return this.tel1;
    }
    
    public void setTel1(String tel1) {
        this.tel1 = tel1;
    }
    public String getTel2() {
        return this.tel2;
    }
    
    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAdresse() {
        return this.adresse;
    }
    
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }
    public int getCodePostale() {
        return this.codePostale;
    }
    
    public void setCodePostale(int codePostale) {
        this.codePostale = codePostale;
    }
    public String getImage() {
        return this.image;
    }
    
    public void setImage(String image) {
        this.image = image;
    }
    public String getLogin() {
        return this.login;
    }
    
    public void setLogin(String login) {
        this.login = login;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public int getEtat() {
        return this.etat;
    }
    
    public void setEtat(int etat) {
        this.etat = etat;
    }




}


