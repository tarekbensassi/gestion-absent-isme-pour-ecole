/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Pojo.DocumentCours;
import Pojo.DocumentTd;
import Pojo.DocumentTp;
import Pojo.Enseignant;
import Pojo.Etudiant;
import Pojo.HibernateUtil;
import Pojo.Messages;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

public class Editer {

    public Iterator AuthentifactionAdmin(String login, String password) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Admin where login='" + login + "'and password='" + password + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator AuthentifactionEtudiant(String login, String password, int etat) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Etudiant where login='" + login + "'and password='" + password + "' and etat='" + etat + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator AuthentifactionEnseignant(String login, String password, int etat) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Enseignant where login='" + login + "'and password='" + password + "' and etat='" + etat + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public void AjouteCours(String nom, String path, String description, String date_ajout, String matiere, String filliere, int niveau, int id_enseignant) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        DocumentCours ajout_cours = new DocumentCours();
        ajout_cours.setNom(nom);
        ajout_cours.setFichierJointe(path);
        ajout_cours.setDescription(description);
        ajout_cours.setDateAjout(date_ajout);
        ajout_cours.setIdMatiers(matiere);
        ajout_cours.setFilliere(filliere);
        ajout_cours.setNiveau(niveau);
        ajout_cours.setIdEnseignant(id_enseignant);
        session.save(ajout_cours);
        tr.commit();
        session.close();
    }

    public void AjouteTraveauxPratique(String nom, String description, String path, String date_ajout, String matiere, String filliere, int niveau, int id_enseignant) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        DocumentTp ajout_tp = new DocumentTp();
        ajout_tp.setNom(nom);
        ajout_tp.setFichierJointe(path);
        ajout_tp.setDescription(description);
        ajout_tp.setDateAjout(date_ajout);
        ajout_tp.setMatiere(matiere);
        ajout_tp.setFilliere(filliere);
        ajout_tp.setNiveau(niveau);
        ajout_tp.setIdEnseignant(id_enseignant);
        session.save(ajout_tp);
        tr.commit();
        session.close();
    }

    public void AjouteTraveauxDiriges(String nom, String description, String path, String date_ajout, String matiere, String filliere, int niveau, int id_enseignant) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        DocumentTd ajout_td = new DocumentTd();
        ajout_td.setNom(nom);
        ajout_td.setFichierJointe(path);
        ajout_td.setDescription(description);
        ajout_td.setDateAjout(date_ajout);
        ajout_td.setMatiere(matiere);
        ajout_td.setFilliere(filliere);
        ajout_td.setNiveau(niveau);
        ajout_td.setIdEnseignant(id_enseignant);
        session.save(ajout_td);
        tr.commit();
        session.close();
    }

    public void AjouteEtudiant(String nom, String prenom, String adresse, int postale, String tel1, String tel2, String mail, int carteetud, String path, String filliere, String niveau, String login, String password, int etat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Etudiant ajout_Etudiant = new Etudiant();
        ajout_Etudiant.setNom(nom);
        ajout_Etudiant.setPrenom(prenom);
        ajout_Etudiant.setAdresse(adresse);
        ajout_Etudiant.setCodePostale(postale);
        ajout_Etudiant.setTel1(tel1);
        ajout_Etudiant.setTel2(tel2);
        ajout_Etudiant.setEmail(mail);
        ajout_Etudiant.setCarteEtudiant(carteetud);
        ajout_Etudiant.setImage(path);
        ajout_Etudiant.setIdFilliere(filliere);
        ajout_Etudiant.setIdNiveau(niveau);
        ajout_Etudiant.setLogin(login);
        ajout_Etudiant.setPassword(password);
        ajout_Etudiant.setEtat(etat);
        session.save(ajout_Etudiant);
        tr.commit();
        session.close();
    }

    public void AjouteEnseignant(String nom, String prenom, String tel1, String tel2, String mail, String adresse, int postale, String path, String login, String password, int etat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Enseignant ajout_Enseignant = new Enseignant();
        ajout_Enseignant.setNom(nom);
        ajout_Enseignant.setPrenom(prenom);
        ajout_Enseignant.setTel1(tel1);
        ajout_Enseignant.setTel2(tel2);
        ajout_Enseignant.setEmail(mail);
        ajout_Enseignant.setAdresse(adresse);
        ajout_Enseignant.setCodePostale(postale);
        ajout_Enseignant.setImage(path);
        ajout_Enseignant.setLogin(login);
        ajout_Enseignant.setPassword(password);
        ajout_Enseignant.setEtat(etat);
        session.save(ajout_Enseignant);
        tr.commit();
        session.close();
    }

    public Iterator liste_Filiere() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Filiere");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_Filiere_mod_cou(String fil) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Filiere where libelle!='" + fil + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_Matiere() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Matiers");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_Matiere_mod_cou(String nom) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Matiers where nom!='" + nom + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator Etudiant_connecte(int id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Etudiant where idEtudiant='" + id + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator Enseignant_connecte(int id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Enseignant where idEnseignant='" + id + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator Admin_connecte(int id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Admin where idAdmin='" + id + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_cours_prof(int iduser) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentCours where idEnseignant= " + iduser + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator cours_mod(int idudoc) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentCours where idDocCours= " + idudoc + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator td_mod(int idudoc) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentTd where idDocumentTd= " + idudoc + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator tp_mod(int idudoc) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentTp where idDocumentTp= " + idudoc + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_Message_recus_prof(int iduser, int type) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Messages where idDestinataire= " + iduser + " and typeDestinataire=" + type + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator det_Message_recus(int iduser, int type, int idmsg) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Messages where idDestinataire= " + iduser + " and typeDestinataire=" + type + " and idMessages=" + idmsg + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_Message_envoyer_prof(int iduser, int type) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Messages where idExpideteur= " + iduser + " and typeExpideteur=" + type + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_cours_niveau_filliere(int niveau, String filiere) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentCours where niveau= " + niveau + " and filliere='" + filiere + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_tous_cours() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentCours");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_tous_enseignant() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Enseignant");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_tous_etudiant() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Etudiant");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_tous_TP() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentTp");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_tous_TD() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentTd");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_TP(int iduser) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentTp where idEnseignant= " + iduser + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_tp_niveau_filliere(int niveau, String filiere) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentTp where niveau= " + niveau + " and filliere='" + filiere + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_Enseignant(int etat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Enseignant where etat=" + etat + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_TD(int iduser) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentTd where idEnseignant= " + iduser + "");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_td_niveau_filliere(int niveau, String filiere) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from DocumentTd where niveau= " + niveau + " and filliere='" + filiere + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public void EnvoyerMessage(String titre, String contenu, String dateaj, int id_destin, int id_expideteur, int ty_destin, int ty_expideteur, int etat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();
        Messages ajout_msg = new Messages();
        ajout_msg.setTitre(titre);
        ajout_msg.setContenu(contenu);
        ajout_msg.setDate(dateaj);
        ajout_msg.setIdDestinataire(id_destin);
        ajout_msg.setIdExpideteur(id_expideteur);
        ajout_msg.setTypeDestinataire(ty_destin);
        ajout_msg.setTypeExpideteur(ty_expideteur);
        ajout_msg.setEtat(etat);
        session.save(ajout_msg);
        tr.commit();
        session.close();
    }

    public void Modifier_message(Integer id, int etat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Messages mod_msg = (Messages) session.get(Messages.class, id);
            mod_msg.setEtat(etat);
            session.update(mod_msg);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void Modifier_etudiant(Integer id, String nom, String prenom, String adresse, int postale, String tel1, String tel2, String mail, String pwd) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Etudiant mod_et = (Etudiant) session.get(Etudiant.class, id);
            mod_et.setNom(nom);
            mod_et.setPrenom(prenom);
            mod_et.setAdresse(adresse);
            mod_et.setCodePostale(postale);
            mod_et.setTel1(tel1);
            mod_et.setTel2(tel2);
            mod_et.setEmail(mail);
            mod_et.setPassword(pwd);
            session.update(mod_et);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    public void Modifier_enseignant(Integer id, String nom, String prenom,String tel1, String tel2,String mail, String adresse, int postale,String pwd) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Enseignant mod_enseignant = (Enseignant) session.get(Enseignant.class, id);
            mod_enseignant.setNom(nom);
            mod_enseignant.setPrenom(prenom);
            mod_enseignant.setAdresse(adresse);
            mod_enseignant.setCodePostale(postale);
            mod_enseignant.setTel1(tel1);
            mod_enseignant.setTel2(tel2);
            mod_enseignant.setEmail(mail);
            mod_enseignant.setPassword(pwd);
            session.update(mod_enseignant);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void deleteCours(Integer idof) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            DocumentCours cours = (DocumentCours) session.get(DocumentCours.class, idof);
            session.delete(cours);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void deleteTp(Integer idTp) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            DocumentTp Tp = (DocumentTp) session.get(DocumentTp.class, idTp);
            session.delete(Tp);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void deleteTd(Integer idtd) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            DocumentTd td = (DocumentTd) session.get(DocumentTd.class, idtd);
            session.delete(td);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void deleteMessage(Integer idmsg) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Messages msg = (Messages) session.get(Messages.class, idmsg);
            session.delete(msg);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void deleteEnseignant(Integer idens) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Enseignant ens = (Enseignant) session.get(Enseignant.class, idens);
            session.delete(ens);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void deleteEtudiant(Integer idet) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Etudiant etu = (Etudiant) session.get(Etudiant.class, idet);
            session.delete(etu);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Iterator liste_Demande_etudiant(int etat) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Etudiant where etat='" + etat + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public Iterator liste_Demande_enseignant(int etat) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List list = session.find("from Enseignant where etat='" + etat + "'");
        Iterator it = list.iterator();
        session.close();
        return it;
    }

    public void Modifier_demande_et(Integer id, int etat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Etudiant mod_dem = (Etudiant) session.get(Etudiant.class, id);
            mod_dem.setEtat(etat);
            session.update(mod_dem);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void Modifier_demande_en(Integer id, int etat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Enseignant mod_dem = (Enseignant) session.get(Enseignant.class, id);
            mod_dem.setEtat(etat);
            session.update(mod_dem);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
