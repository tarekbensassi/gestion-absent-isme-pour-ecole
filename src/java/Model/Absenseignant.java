package Model;
// Generated May 8, 2016 4:55:56 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Absenseignant generated by hbm2java
 */
public class Absenseignant  implements java.io.Serializable {


     private Integer idAbs;
     private int idEnseignant;
     private Date dateseance;

    public Absenseignant() {
    }

    public Absenseignant(int idEnseignant, Date dateseance) {
       this.idEnseignant = idEnseignant;
       this.dateseance = dateseance;
    }
   
    public Integer getIdAbs() {
        return this.idAbs;
    }
    
    public void setIdAbs(Integer idAbs) {
        this.idAbs = idAbs;
    }
    public int getIdEnseignant() {
        return this.idEnseignant;
    }
    
    public void setIdEnseignant(int idEnseignant) {
        this.idEnseignant = idEnseignant;
    }
    public Date getDateseance() {
        return this.dateseance;
    }
    
    public void setDateseance(Date dateseance) {
        this.dateseance = dateseance;
    }




}


