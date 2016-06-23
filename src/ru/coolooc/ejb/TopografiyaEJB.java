package ru.coolooc.ejb;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ru.coolooc.model.Topografiya;

/**
 * Session Bean implementation class TopografiyaEJB
 */
@Stateless
@LocalBean
public class TopografiyaEJB {

	@PersistenceContext
	private EntityManager em;
	
    public TopografiyaEJB() {
    	
    }
    
    public String say() {
		return "TopografiyaEJB";
	}
    
    public List<Topografiya> getAll() {
		Query query = em.createNamedQuery("Topografiya.findAll");
		return (List<Topografiya>) query.getResultList();
	}
    
    public Topografiya findDelo(String nomerFond, String nomerOpis, String nomerDela) {
    	String delo = nomerFond + nomerOpis + nomerDela;
		Query query = em.createQuery("SELECT t FROM Topografiya t WHERE t.nomerDela = :nomerDela");		
		query.setParameter("nomerDela", Integer.valueOf(delo));
		return (Topografiya) query.getSingleResult();
	}
    
    public void addDelo(String nazvanieFonda, String nomerFond, String nomerOpis,
    					String nomerHranilishe, String nomerEtaj, String nomerStellaj,
    					String nomerPolka, String nomerDela, String zagolovokDela) {
    	Topografiya topografiya = new Topografiya();
    	topografiya.setNazvanieFonda(nazvanieFonda);
    	topografiya.setNomerFond(Integer.valueOf(nomerFond));
    	topografiya.setNomerOpis(Integer.valueOf(nomerOpis));
    	topografiya.setNomerHranilishe(Integer.valueOf(nomerHranilishe));
    	topografiya.setNomerEtaj(Integer.valueOf(nomerEtaj));
    	topografiya.setNomerStellaj(Integer.valueOf(nomerStellaj));
    	topografiya.setNomerPolka(Integer.valueOf(nomerPolka));
    	String delo = nomerFond + nomerOpis + nomerDela;
    	topografiya.setNomerDela(Integer.valueOf(delo));
    	topografiya.setZagolovokDela(zagolovokDela);
    	em.persist(topografiya);
	}
    
    public Long getCountByNomerFond(String nomerFond) {
    	//SELECT t.nomer_fond ,COUNT(t.nomer_dela) FROM topografiya t GROUP by t.nomer_fond
    	Query query = em.createQuery("SELECT COUNT(t.nomerDela) FROM Topografiya t WHERE t.nomerFond = :nomerFond");
    	query.setParameter("nomerFond", Integer.valueOf(nomerFond));
    	return (long) query.getSingleResult();
	}
    
    public List<Integer> findNomerFond(){//(String nomerFond) {
		Query query = em.createQuery("SELECT t.nomerFond FROM Topografiya t GROUP BY t.nomerFond");		
		//query.setParameter("nomerFond", nomerFond);
		return (List<Integer>) query.getResultList();
	}
    
    public List<Object[]> getCountNomerDelaFromNomerFonda() {
    	Query query = em.createQuery("SELECT t.nomerFond, COUNT(t.nomerDela) FROM Topografiya t GROUP BY t.nomerFond");
    	return (List<Object[]>) query.getResultList();
	}
    
    public Long getCountNomerHranilisheFromNomerFonda232323(String nomerFond) {
    	Query query = em.createQuery("SELECT COUNT(t.nomerHranilishe) FROM Topografiya t WHERE t.nomerFond = :nomerFond");
    	query.setParameter("nomerFond", Integer.valueOf(nomerFond));
    	return (long) query.getSingleResult();
	}
    
    public List<Object[]> getCountNomerHranilisheFromNomerFonda(String nomerFond) {
    	Query query = em.createQuery("SELECT t.nomerHranilishe, COUNT(t.nomerDela) FROM Topografiya t WHERE t.nomerFond = :nomerFond GROUP BY t.nomerHranilishe");
    	query.setParameter("nomerFond", Integer.valueOf(nomerFond));
    	return (List<Object[]>) query.getResultList();
	}
    
    public List<Object[]> getCountNomerDeloFromNomerFonda(String nomerFond) {
    	Query query = em.createQuery("SELECT t.nomerDela, COUNT(t.nomerDela) FROM Topografiya t WHERE t.nomerFond = :nomerFond GROUP BY t.nomerDela");
    	query.setParameter("nomerFond", Integer.valueOf(nomerFond));
    	return (List<Object[]>) query.getResultList();
	}

}
