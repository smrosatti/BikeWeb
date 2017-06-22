/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author Aluno
 */
@Entity
public class BFType implements Serializable, ModelBase{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)        
    private long idType;
    private String type;    
    @OneToMany
    private List<Bikefood> bikes;

    public BFType(long idType, String type, ArrayList<Bikefood> bikes) {
        this.idType = idType;
        this.type = type;
        this.bikes = bikes;
    }

    public BFType() {
    }

    
    public void setIdType(long idType) {
        this.idType = idType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Bikefood> getBikes() {
        return bikes;
    }

    public void setBikes(ArrayList<Bikefood> bikes) {
        this.bikes = bikes;
    }

    @Override
    public long getId() {
        return idType;
    }

    @Override
    public String toString(){
        return this.getType();
    }
    
}
