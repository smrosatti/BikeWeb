/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author Samuel Leandro
 */
@NamedQueries({
 @NamedQuery(name = "Favorites.findByUser", query = "select i from Favorites i where i.idUser = :idUser")
})
@Entity
public class Favorites implements Serializable, ModelBase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idFavorites;
    @ManyToOne
    @JoinColumn (name = "idbikefood", nullable = false)
    private Bikefood idBikefood;
    @ManyToOne
    @JoinColumn (name = "iduser", nullable = false)
    private Userr idUser;

    public Favorites(Bikefood idBikefood, Userr idUser) {
        this.idBikefood = idBikefood;
        this.idUser = idUser;
    }

    public Favorites() {
    }
    
    public Bikefood getIdBikefood() {
        return idBikefood;
    }

    public void setIdBikefood(Bikefood idBikefood) {
        this.idBikefood = idBikefood;
    }

    @Override
    public long getId() {
        return getIdFavorites();
    }

    
    
    public Userr getIdUser() {
        return idUser;
    }

    public void setIdUser(Userr idUser) {
        this.idUser = idUser;
    }

    public long getIdFavorites() {
        return idFavorites;
    }

    public void setIdFavorites(long idFavorites) {
        this.idFavorites = idFavorites;
    }

    @Override
    public String toString() {
        int i = idBikefood.getLocations().size();
        return "Nome : "+idBikefood.getName()+"         Localização Atual:  "+idBikefood.getLocations().get( i - 1).getStreet();
    }
    
    
}

