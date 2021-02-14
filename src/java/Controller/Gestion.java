

package Controller;
import Model.Absence;
import Model.Absenseignant;
import Model.Authentification;
import Model.Classe;
import Model.Elimine;
import Model.Enseignant;
import Model.Etudiant;
import Model.HibernateUtil;
import Model.Matiere;
import Model.Module;
import Model.Seance;
import Model.Semester;
import Model.Utilisateur;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.hibernate.*;

/**
 *
 * @author ingwa
 */
public class Gestion {
        public Connection con = null;
    Statement st = null;//pou l'execution d'une requète de mise à jour
    ResultSet rs = null;//type de retour d'une requète de sélèction
    PreparedStatement ps = null;//pour l'execution d'une reqète qui possède "?"
//connexion bd

    public Gestion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("erreue" + e);
        }

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/absisimg", "root", "");
            st = con.createStatement();
        } catch (SQLException e1) {
            System.out.println("errreur" + e1);
        }

    }
    
 

  

    public void AjouterUser(String nom, String prenom, String adresse, int tel, String mail, int type) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Utilisateur ajout_user = new Utilisateur();

        ajout_user.setNom(nom);
        ajout_user.setPrenom(prenom);
        ajout_user.setAdresse(adresse);
        ajout_user.setTel(tel);
        ajout_user.setEmail(mail);
        ajout_user.setIdType(type);

        session.save(ajout_user);
        tr.commit();
        session.close();
    }
     public void absenceenseignant(int abs,Date dateseance) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Absenseignant ajout_abs = new Absenseignant();

        ajout_abs.setIdEnseignant(abs);
        ajout_abs.setDateseance(dateseance);
        

        session.save(ajout_abs);
        tr.commit();
        session.close();
    }

    public void AjouterEnseignant(String matricule, int user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Enseignant ajout_prof = new Enseignant();

        ajout_prof.setMatricule(matricule);
        ajout_prof.setIdUtilisateur(user);

        session.save(ajout_prof);
        tr.commit();
        session.close();
    }

    public void AjouterEuthentification(String login, String pwd, int user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Authentification ajout_auth = new Authentification();

        ajout_auth.setLogin(login);
        ajout_auth.setPwd(pwd);
        ajout_auth.setIdUtilisateur(user);

        session.save(ajout_auth);
        tr.commit();
        session.close();
    }

    public Integer max_User() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = null;
        Query hibernateQuery = session.createQuery("select Max(idUtilisateur) from Utilisateur");
        list = hibernateQuery.list();
        String st = String.valueOf(list);
        String chaine = st.substring(0, st.length() - 1);
        String chaine1 = chaine.substring(1);
        Integer a = Integer.valueOf(chaine1);
        session.close();
        return a;
    }

    public Integer max_Etudiant() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = null;
        Query hibernateQuery = session.createQuery("select Max(idEtudiant) from Etudiant");
        list = hibernateQuery.list();
        String st = String.valueOf(list);
        String chaine = st.substring(0, st.length() - 1);
        String chaine1 = chaine.substring(1);
        Integer a = Integer.valueOf(chaine1);
        session.close();
        return a;
    }

    public void AjouterListeSeance(int id_et,int id_mat, int nbAbsCr, int nbAbsTp, int nbAbsTd,  int id_sem) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Elimine ajout_el = new Elimine();

        ajout_el.setIdEtudiant(id_et);
        ajout_el.setIdMatiere(id_mat);
         ajout_el.setNdAbscr(nbAbsCr);
        ajout_el.setNdAbstd(nbAbsTp);
        ajout_el.setNdAbstp(nbAbsTd);
        ajout_el.setIdSemester(id_sem);
       

        session.save(ajout_el);
        tr.commit();
        session.close();
    }

    public Iterator listeUtilisateur(int type) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Utilisateur where idType=" + type + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator listeEnseignant(int ens) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Enseignant where idUtilisateur=" + ens + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
     public Iterator listeabsEnseignant(int ens) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Absenseignant where idEnseignant=" + ens + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
     public Iterator listeEnseignant1(int ens) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Enseignant where idEnseignant=" + ens + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public void AjouterClasse(String libelle) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Classe ajout_classe = new Classe();

        ajout_classe.setLibelle(libelle);

        session.save(ajout_classe);
        tr.commit();
        session.close();
    }

    public Iterator listeClasse() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Classe");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
    public Iterator listeClasse1() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Classe WHERE libelle LIKE '___%' ");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator listeModule() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Module");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
  

    public Iterator listeModuleClasse(int id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Module where idClasse=" + id + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
      public Iterator listeModuleClasseSemes1(int sem) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Module where  idSemester="+sem+"");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
    public Iterator listeModuleClasseSemes(int id,int sem) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Module where idClasse=" + id + " and idSemester="+sem+"");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
    public Integer nbr_seance(int mat, int classe) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = null;
        Query hibernateQuery = session.createQuery("select count(idSeance) from Seance  where idMatiere=" + mat + " and idClasse="+classe+"");
        list = hibernateQuery.list();
        String st = String.valueOf(list);
        String chaine = st.substring(0, st.length() - 1);
        String chaine1 = chaine.substring(1);
        Integer a = Integer.valueOf(chaine1);
        session.close();
        return a;
    }
    public Integer nbr_seance1(int mat, String classe) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = null;
        Query hibernateQuery = session.createQuery("select count(idSeance) from Seance  where idMatiere=" + mat + " and idClasse="+classe+"");
        list = hibernateQuery.list();
        String st = String.valueOf(list);
        String chaine = st.substring(0, st.length() - 1);
        String chaine1 = chaine.substring(1);
        Integer a = Integer.valueOf(chaine1);
        session.close();
        return a;
    }

    public void AjouterModule(String module, int semestre,int  classe) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Module ajout_module = new Module();

        ajout_module.setLibelle(module);
        ajout_module.setIdSemester(semestre);
        ajout_module.setIdClasse(classe);
        
        session.save(ajout_module);
        tr.commit();
        session.close();
    }

    public void AjouterMatiere(String matiere, int module) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Matiere ajout_matiere = new Matiere();

        ajout_matiere.setLibelle(matiere);
        ajout_matiere.setIdModule(module);

        session.save(ajout_matiere);
        tr.commit();
        session.close();
    }

    public Iterator listeMatiere() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Matiere");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator listeMatiereModule(int mod) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Matiere where idModule=" + mod + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator listeModuleMatiere(int mod) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Module where idModule=" + mod + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
     public Iterator Authentification() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Authentification");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
       public Iterator Authentification1(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Authentification where idUtilisateur=" + id + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
      public Iterator listuser(int id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Utilisateur where idUtilisateur=" + id + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public void AjouterEtudiant(String carte, int classe, int user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Etudiant ajout_et = new Etudiant();

        ajout_et.setCarteEtudiant(carte);
        ajout_et.setIdClasse(classe);
        ajout_et.setIdUtilisateur(user);
        
        

        session.save(ajout_et);
        tr.commit();
        session.close();
    }

    public Iterator listeEtudiant(int user) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Etudiant where idUtilisateur=" + user + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
        public void Modifier_Etudiant(int id, String carte, int cl ,int ur) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Etudiant et = (Etudiant) session.get(Etudiant.class, id);

            et.setCarteEtudiant(carte);
            et.setIdClasse(cl);
            et.setIdUtilisateur(ur);
           
            session.update(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
        public void Suppsemes(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Semester et = (Semester) session.get(Semester.class, id);
            
            et.setIdSemester(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
           public void SuppAbsEng(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Absenseignant et = (Absenseignant) session.get(Absenseignant.class, id);
            
            et.setIdAbs(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
          public void SuppModule(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Module et = (Module) session.get(Module.class, id);
            
            et.setIdModule(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
           public void SuppMatiere(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Matiere et = (Matiere) session.get(Matiere.class, id);
            
            et.setIdMatiere(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
           public void Suppclasse(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Classe et = (Classe) session.get(Classe.class, id);
            
            et.setIdClasse(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
           public void SuppUtilisateur(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Utilisateur et = (Utilisateur) session.get(Utilisateur.class, id);
            
            et.setIdUtilisateur(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
           public void SuppEnseignant(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Enseignant et = (Enseignant) session.get(Enseignant.class, id);
            
            et.setIdEnseignant(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
             public void SuppEtudiant(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Etudiant et = (Etudiant) session.get(Etudiant.class, id);
            
            et.setIdEtudiant(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
      public void SuppAuth(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Authentification et = (Authentification) session.get(Authentification.class, id);
            
            et.setIdAuth(id);
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
      public void SuppAbsEt(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Absence et = (Absence) session.get(Absence.class, id);
            
            et.getIdabs();
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
       public void SuppElimineEt(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Elimine et = (Elimine) session.get(Elimine.class, id);
            
            et.getIdElimine();
            
            session.delete(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
       
             
           
            public void Modifier_Enseignant(int id, String mat,int ur) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Enseignant et = (Enseignant) session.get(Enseignant.class, id);

            et.setMatricule(mat);
            et.setIdUtilisateur(ur);
            
           
            session.update(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
               public void ModifierMat(int id, String mat,int ur) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Matiere et = (Matiere) session.get(Matiere.class, id);

            et.setLibelle(mat);
            et.setIdModule(ur);
            
           
            session.update(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
       public void Modifiermod(int id, String mat,int cl,int semes) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Module et = (Module) session.get(Module.class, id);

            et.setLibelle(mat);
            et.setIdClasse(id);
            et.setIdSemester(semes);
            
           
            session.update(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
            
  public void Modifier_auth(int id, String user,String pwd,int ur) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Authentification et = (Authentification) session.get(Authentification.class, id);

            et.setLogin(user);
            et.setPwd(pwd);
            et.setIdUtilisateur(ur);
            
           
            session.update(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
          public void Modifier_User(int id, String nom, String prenom,String adresse,int tel,String email,int idType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Utilisateur et = (Utilisateur) session.get(Utilisateur.class, id);

            et.setNom(nom);
            et.setPrenom(prenom);
            et.setAdresse(adresse);
            et.setTel(tel);
            et.setEmail(email);
            et.setIdType(idType);
           
            session.update(et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
    
      public Iterator listeEtudiantClass1(int user) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Etudiant where idUtilisateur=" + user + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
    public Iterator listeEtudiantClass(int user, int classe) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Etudiant where idUtilisateur=" + user + " and idClasse=" + classe + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator listeClasseEt(int id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Classe where idClasse=" + id + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public void AjouterSemestre(int semestre, Date debut, Date fin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Semester ajout_sem = new Semester();

        ajout_sem.setNumsemester(semestre);
        ajout_sem.setDatedebutSemester(debut);
        ajout_sem.setDatefinSemester(fin);

        session.save(ajout_sem);
        tr.commit();
        session.close();
    }

    public Iterator listeSem() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Semester");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public void AjouterAbsence(int id_etudiant, int matiere, int abscr, int abstp, int abstd, int semestre) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Elimine ajout_absence = new Elimine();

        ajout_absence.setIdEtudiant(id_etudiant);
        ajout_absence.setIdMatiere(matiere);
        ajout_absence.setNdAbscr(abscr);
        ajout_absence.setNdAbstp(abstp);
        ajout_absence.setNdAbstd(abstd);
        ajout_absence.setIdSemester(semestre);

        session.save(ajout_absence);
        tr.commit();
        session.close();
    }

    public void AjouterSeance(int matiere,int classe, int type, Date dat, int ense, int semes) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Seance ajout_seance = new Seance();

        ajout_seance.setIdMatiere(matiere);
        ajout_seance.setIdClasse(classe);
        ajout_seance.setIdType(type);
        ajout_seance.setDateSeance(dat);
        ajout_seance.setIdEnseignant(ense);
        ajout_seance.setIdSemester(semes);

       
         session.save(ajout_seance);
        tr.commit();
        session.close();
    }
     public void Ajouteabsence(int idetd,int idmat, Date dat,int idsems) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Absence ajout_abs = new Absence();

       ajout_abs.setIdetudiant(idetd);
       ajout_abs.setIdmat(idmat);
       ajout_abs.setDatemat(dat);
        ajout_abs.setIdsems(idsems);
        

        session.save(ajout_abs);
        tr.commit();
        session.close();
    }
    public Iterator listeSeance(int id_et, int idMat, int idSem) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Elimine where idEtudiant=" + id_et + " and idMatiere=" + idMat + " and idSemester=" + idSem + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }
     public Iterator listeabsence(int id_et, int idMat, int idSem) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query req = session.createQuery("from Absence where idetudiant=" + id_et + " and idmat=" + idMat + " and idsems=" + idSem + "");
        List list = req.list();
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public void Modifier_Absence_cours(int id, int count, int type) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Elimine mod_elem = (Elimine) session.get(Elimine.class, id);

            mod_elem.setNdAbscr(count);
            session.update(mod_elem);
            tx.commit();

        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }

    public void Modifier_Absence_Tp(int id, int count, int type) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Elimine mod_elem = (Elimine) session.get(Elimine.class, id);

            mod_elem.setNdAbstp(count);
            session.update(mod_elem);
            tx.commit();

        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }

    public void Modifier_Absence_Td(int id, int count, int type) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Elimine mod_elem = (Elimine) session.get(Elimine.class, id);

            mod_elem.setNdAbstd(count);
            session.update(mod_elem);
            tx.commit();

        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }
}
