/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Samuel Leandro
 */
@Entity
public class Location implements Serializable, ModelBase{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)        
    private long idLocation;
    private String street;
    private String district;
    @OneToOne
    private Country idCountry;
    @OneToOne
    private State idState;
    @OneToOne
    private City idCity;
    private String number;

    @ManyToOne (cascade = {CascadeType.REFRESH, CascadeType.REMOVE, CascadeType.MERGE}, fetch = FetchType.EAGER)
    private Bikefood idBikefood;
    
    @Temporal(TemporalType.DATE) 
    private Date ldstart;
   
    @Temporal(TemporalType.DATE) 
    private Date ldend;

    public Location(long idLocation, String street, String district, Country idCountry, State idState, City idCity, String number, Bikefood idBikefood, Date start, Date end) {
        this.idLocation = idLocation;
        this.street = street;
        this.district = district;
        this.idCountry = idCountry;
        this.idState = idState;
        this.idCity = idCity;
        this.number = number;
        this.idBikefood = idBikefood;
        this.ldstart = start;
        this.ldend = end;
    }

    public Location(String street, String district, Country idCountry, State idState, City idCity, String number, Bikefood idBikefood, Date start, Date end) {
        this.street = street;
        this.district = district;
        this.idCountry = idCountry;
        this.idState = idState;
        this.idCity = idCity;
        this.number = number;
        this.idBikefood = idBikefood;
        this.ldstart = start;
        this.ldend = end;
    }

    public Location() {
    }
    
    
    @Override
    public long getId() {
        return idLocation;
    }

    public String getStreet() {
        return street;
    }

    public String getDistrict() {
        return district;
    }

    public Country getIdCountry() {
        return idCountry;
    }

    public State getIdState() {
        return idState;
    }

    public City getIdCity() {
        return idCity;
    }

    public String getNumber() {
        return number;
    }

    public Bikefood getIdBikefood() {
        return idBikefood;
    }

    public Date getLdstart() {
        return ldstart;
    }

    public Date getLdend() {
        return ldend;
    }
    
    
    
}
