package Model;
// Generated Apr 15, 2016 8:15:25 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Absence generated by hbm2java
 */
public class Absence  implements java.io.Serializable {


     private Integer idabs;
     private int idetudiant;
     private int idmat;
     private Date datemat;
     private int idsems;

    public int getIdsems() {
        return idsems;
    }

    public void setIdsems(int idsems) {
        this.idsems = idsems;
    }

    public Absence() {
    }

    public Absence(int idetudiant, int idmat, Date datemat,int idsems) {
       this.idetudiant = idetudiant;
       this.idmat = idmat;
       this.datemat = datemat;
        this.idsems = idsems;
    }
   
    public Integer getIdabs() {
        return this.idabs;
    }
    
    public void setIdabs(Integer idabs) {
        this.idabs = idabs;
    }
    public int getIdetudiant() {
        return this.idetudiant;
    }
    
    public void setIdetudiant(int idetudiant) {
        this.idetudiant = idetudiant;
    }
    public int getIdmat() {
        return this.idmat;
    }
    
    public void setIdmat(int idmat) {
        this.idmat = idmat;
    }
    public Date getDatemat() {
        return this.datemat;
    }
    
    public void setDatemat(Date datemat) {
        this.datemat = datemat;
    }




}

