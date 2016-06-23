package ru.coolooc.ejb;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ru.coolooc.model.SotrydnikOyd;

/**
 * Session Bean implementation class SotrydnikOydEJB
 */
@Stateless
@LocalBean
public class SotrydnikOydEJB {

	@PersistenceContext
	private EntityManager em;
	
    /**
     * Default constructor. 
     */
    public SotrydnikOydEJB() {
        // TODO Auto-generated constructor stub
    }

    public List<SotrydnikOyd> getAll() {
		Query query = em.createNamedQuery("SotrydnikOyd.findAll");
		return (List<SotrydnikOyd>) query.getResultList();
	}
    
    public SotrydnikOyd findByLoginAndPassword(String login, String password) {
		Query query = em.createQuery("SELECT s FROM SotrydnikOyd s WHERE s.login = :login and s.password = :password");		
		query.setParameter("login", login);
		query.setParameter("password", password);
		return (SotrydnikOyd) query.getSingleResult();
	}
}
