/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Samuel Leandro
 */
@Entity
public class Country implements Serializable, ModelBase{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idCountry;
    private String countryName;  

    public Country(long idCountry, String countryName) {
        this.idCountry = idCountry;
        this.countryName = countryName;
    }

    public Country(String countryName) {
        this.countryName = countryName;
    }

    public Country() {
    }
    
    
    @Override
    public long getId() {
        return idCountry;
    }

    public void setIdCountry(long idCountry) {
        this.idCountry = idCountry;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
    
}
