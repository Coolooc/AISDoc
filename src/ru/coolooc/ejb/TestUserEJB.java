package ru.coolooc.ejb;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ru.coolooc.model.TestUser;

/**
 * Session Bean implementation class TestUserEJB
 */
@Stateless
@LocalBean
public class TestUserEJB {
	
	@PersistenceContext
	private EntityManager em;

    /**
     * Default constructor. 
     */
    public TestUserEJB() {
        // TODO Auto-generated constructor stub
    }
    
    public List<TestUser> getAll() {
		Query query = em.createNamedQuery("TestUser.findAll");
		return (List<TestUser>) query.getResultList();
	}
    
//    public TestUser findById(int id) {
//		Query query = em.createQuery("SELECT u FROM User u WHERE u.id = :id");		
//		query.setParameter("id", id);
//		return (TestUser) query.getSingleResult();
//	}
    
    public TestUser findByLogin(String login) {
		Query query = em.createNamedQuery("TestUser.findByName");		
		query.setParameter("login", login);
		return (TestUser) query.getSingleResult();
	}
        
    public String sayHello() {
		return "Hello";
	}

}
