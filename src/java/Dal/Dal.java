package Dal;

import Model.BFType;
import Model.Bikefood;
import Model.Favorites;
import Model.ModelBase;
import Model.Product;
import Model.Userr;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;

/**
 *
 * @author Samuel Leandro
 */
public class Dal implements Serializable {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("bikefoodPU");

    ;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public <G> boolean create(G g) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(g);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeAll(em);
        }

    }

    public <G> boolean edit(G g) {
        EntityManager em = getEntityManager();;
        try {
            em.getTransaction().begin();
            em.merge(g);
            em.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            closeAll(em);
        }
    }

    public boolean remove(ModelBase M, Long id) {
        EntityManager em = getEntityManager();;
        try {
            ModelBase modelbase = em.find(M.getClass(), id);
            em.getTransaction().begin();
            em.remove(modelbase);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            closeAll(em);
        }
    }

    public <T> List<T> getList(ModelBase m) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(m.getClass()));
            Query q = em.createQuery(cq);
            return q.getResultList();
        } catch (Exception e) {
            return null;

        } finally {
            closeAll(em);
        }
    }

    public List<Bikefood> getBikes(int u) {
        EntityManager em = getEntityManager();
        try {
            String sql = "select t from Bikefood t where t.idUser.idUser = " + u;
            Query query = getEntityManager().createQuery(sql);
            List<Bikefood> list = query.getResultList();
            return list;
        } finally {
            closeAll(em);
        }
    }

    public List<Product> getProducts(int b) {
        EntityManager em = getEntityManager();
        try {
            String sql = "select t from Product t where t.idBikefood.idBikefood = " + b;
            Query query = getEntityManager().createQuery(sql);
            List<Product> list = query.getResultList();
            return list;
        } finally {
            closeAll(em);
        }
    }
    
    public Bikefood findBike(int id) {
        EntityManager em = getEntityManager();
        try {
            String sql = "select t from Bikefood t where t.idBikefood = " + id;
            Query query = getEntityManager().createQuery(sql);
            List<Bikefood> list = query.getResultList();
            Bikefood bf = list.get(0);
            return bf;
        } finally {
            closeAll(em);
        }
    }
    
      public BFType findType(int id) {
        EntityManager em = getEntityManager();
        try {
            String sql = "select t from BFType t where t.idType = " + id;
            Query query = getEntityManager().createQuery(sql);
            List<BFType> list = query.getResultList();
            BFType bf = list.get(0);
            return bf;
        } finally {
            closeAll(em);
        }
    }
    
     public Favorites findFav(int id) {
        EntityManager em = getEntityManager();
        try {
            String sql = "select t from Favorites t where t.idFavorites = " + id;
            Query query = getEntityManager().createQuery(sql);
            List<Favorites> list = query.getResultList();
            Favorites bf = list.get(0);
            return bf;
        } finally {
            closeAll(em);
        }
    }
    
    public Product findProduct(int id) {
        EntityManager em = getEntityManager();
        try {
            String sql = "select t from Product t where t.idProduct = " + id;
            Query query = getEntityManager().createQuery(sql);
            List<Product> list = query.getResultList();
            Product bf = list.get(0);
            return bf;
        } finally {
            closeAll(em);
        }
    }
    
     public ModelBase find(int id, String classe) {
        EntityManager em = getEntityManager();
        try {
            String sql = ("select t from "+ classe +" t where t.id"+ classe +" = " + id);
            Query query = getEntityManager().createQuery(sql);
            List<ModelBase> list = query.getResultList();
            ModelBase bf = list.get(0);
            return bf;
        } finally {
            closeAll(em);
        }
    }

    public List<Favorites> getFavorites(int id) {
        EntityManager em = getEntityManager();
        try {
            String sql = "select t from Favorites t where t.idUser.idUser = " + id;
            Query query = getEntityManager().createQuery(sql);
            List<Favorites> list = query.getResultList();
            return list;
        } finally {
            closeAll(em);
        }
    }

    public List<Bikefood> getBikeLoc(Userr u) {
        EntityManager em = getEntityManager();
        List<Bikefood> list;
        try {
            Query q = em.createNamedQuery("Bikefood.bikeLoc");
            q.setParameter("idUser", u);
            list = q.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            list = new ArrayList();
        } finally {
            closeAll(em);
        }
        return list;
    }

    public List<Favorites> getFav(Userr u) {
        EntityManager em = getEntityManager();
        List<Favorites> list;
        try {
            Query q = em.createNamedQuery("Favorites.findByUser");
            q.setParameter("idUser", u);
            list = q.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            list = new ArrayList();
        } finally {
            closeAll(em);
        }
        return list;
    }

    public boolean save(Bikefood b) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            if ((Long) b.getId() == null) {
                em.persist(b);
            }else{
                if(!em.contains(b)){
                    if(em.find(Bikefood.class, b.getId()) == null){
                    throw new Exception("Erro ao atualizar o bikefood");
                    }
                }
                em.merge(b);
            }

            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeAll(em);
        }

    }

    private void closeAll(EntityManager em) {
        if (em != null) {
            em.close();
        }
        if (emf != null) {
            emf.close();
        }
    }

}
