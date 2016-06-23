package ru.coolooc.ejb;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ru.coolooc.model.SotrydnikOiz;

/**
 * Session Bean implementation class SotrydnikOizEJB
 */
@Stateless
@LocalBean
public class SotrydnikOizEJB {

	@PersistenceContext
	private EntityManager em;
	
    /**
     * Default constructor. 
     */
    public SotrydnikOizEJB() {
        // TODO Auto-generated constructor stub
    }

    public List<SotrydnikOiz> getAll() {
		Query query = em.createNamedQuery("SotrydnikOiz.findAll");
		return (List<SotrydnikOiz>) query.getResultList();
	}
    
    public SotrydnikOiz findByLoginAndPassword(String login, String password) {
		Query query = em.createQuery("SELECT s FROM SotrydnikOiz s WHERE s.login = :login and s.password = :password");		
		query.setParameter("login", login);
		query.setParameter("password", password);
		return (SotrydnikOiz) query.getSingleResult();
	}
}
