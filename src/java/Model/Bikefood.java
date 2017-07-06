/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Samuel Leandro
 */
@Entity
@NamedQueries({
 @NamedQuery(name = "Bikefood.bikeLoc", query = "select i from Bikefood i where i.idUser = :idUser"),
 @NamedQuery(name = "Bikefood.findByType", query = "select i from Bikefood i where i.type = :type")
})
public class Bikefood implements Serializable, ModelBase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idBikefood;
    private String name;
    @OneToOne
    private Userr idUser;
    @ManyToOne
    private BFType type;
    private String cnpj;
    private String img;
    @OneToMany (targetEntity = Location.class, mappedBy = "idBikefood", cascade = {CascadeType.REFRESH, CascadeType.MERGE, CascadeType.REMOVE}, fetch = FetchType.EAGER)
    private List<Location> locations;
    private String tel;
    
    public Bikefood(long idBikefood, String name, Userr idUser, BFType type, String cnpj, String img, List<Location> locations, String tel) {
        this.idBikefood = idBikefood;
        this.name = name;
        this.idUser = idUser;
        this.type = type;
        this.cnpj = cnpj;
        this.img = img;
        this.locations = locations;
        this.tel = tel;
    }

    public Bikefood(String name, Userr idUser, BFType type, String cnpj, String img, List<Location> locations, String tel) {
        this.name = name;
        this.idUser = idUser;
        this.type = type;
        this.cnpj = cnpj;
        this.img = img;
        this.locations = locations;
        this.tel = tel;
    }

    public Bikefood(String name, Userr idUser, BFType type, String cnpj, String img, String tel) {
        this.name = name;
        this.idUser = idUser;
        this.type = type;
        this.cnpj = cnpj;
        this.img = img;
        this.tel = tel;
    }

    public Bikefood(long idBikefood, String name, Userr idUser, BFType type, String cnpj, String img, String tel) {
        this.idBikefood = idBikefood;
        this.name = name;
        this.idUser = idUser;
        this.type = type;
        this.cnpj = cnpj;
        this.img = img;
        this.tel = tel;
    }

    
    
    public Bikefood() {
    }

    public List<Location> getLocations() {
        return locations;
    }

    public void setLocations(List<Location> locations) {
        this.locations = locations;
    }

    @Override
    public long getId() {
        return idBikefood;
    }

    public void setIdBikefood(long idBikefood) {
        this.idBikefood = idBikefood;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Userr getIdUser() {
        return idUser;
    }

    public void setIdUser(Userr idUser) {
        this.idUser = idUser;
    }

    public BFType getType() {
        return type;
    }

    public void setType(BFType type) {
        this.type = type;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
    
    @Override
    public String toString(){
        return this.name;
    }

}
