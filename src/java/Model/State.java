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
public class State implements Serializable, ModelBase{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idState;
    private String stateName;
    @OneToOne
    private Country idCountry;

    public State(long idState, String stateName, Country idCountry) {
        this.idState = idState;
        this.stateName = stateName;
        this.idCountry = idCountry;
    }

    public State(String stateName, Country idCountry) {
        this.stateName = stateName;
        this.idCountry = idCountry;
    }

    public State() {
    }
    @Override
    public long getId() {
        return idState;
    }

    public void setIdState(long idState) {
        this.idState = idState;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public Country getIdCountry() {
        return idCountry;
    }

    public void setIdCountry(Country idCountry) {
        this.idCountry = idCountry;
    }
}
