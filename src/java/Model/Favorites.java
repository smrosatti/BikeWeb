/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author Samuel Leandro
 */
@NamedQueries(
 @NamedQuery(name = "Bikefood.bikeLoc", query = "select i from Bikefood i where i.idUser = :idUser")
)
@Embeddable
public class Favorites implements Serializable {
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

    public Userr getIdUser() {
        return idUser;
    }

    public void setIdUser(Userr idUser) {
        this.idUser = idUser;
    }
}
