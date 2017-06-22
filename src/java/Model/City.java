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
import javax.persistence.OneToOne;

/**
 *
 * @author Samuel Leandro
 */
@Entity
public class City implements Serializable, ModelBase{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idCity;
    private String cityName;
    @OneToOne
    private State idState;

    public City(long idCity, String cityName, State idState) {
        this.idCity = idCity;
        this.cityName = cityName;
        this.idState = idState;
    }

    public City(String cityName, State idState) {
        this.cityName = cityName;
        this.idState = idState;
    }

    public City() {
    }

    @Override
    public long getId() {
        return idCity;
    }

    public void setIdCity(long idCity) {
        this.idCity = idCity;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public State getIdState() {
        return idState;
    }

    public void setIdState(State idState) {
        this.idState = idState;
    }

}
