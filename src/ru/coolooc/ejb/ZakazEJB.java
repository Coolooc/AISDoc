package ru.coolooc.ejb;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ru.coolooc.model.Zakaz;

/**
 * Session Bean implementation class ZakazEJB
 */
@Stateless
@LocalBean
public class ZakazEJB {

	@PersistenceContext
	private EntityManager em;
	
    /**
     * Default constructor. 
     */
    public ZakazEJB() {
        // TODO Auto-generated constructor stub
    }

    public List<Zakaz> getAll() {
		Query query = em.createNamedQuery("Zakaz.findAll");
		return (List<Zakaz>) query.getResultList();
	}
    
    public List<Zakaz> getAllDateASC() {
    	Query query = em.createQuery("SELECT z FROM Zakaz z ORDER BY z.date ASC");
		return (List<Zakaz>) query.getResultList();
	}
    
}
