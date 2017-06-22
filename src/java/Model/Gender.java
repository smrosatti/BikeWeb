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
public class Gender implements Serializable, ModelBase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)     
    private long idGender;
    private String type;

    public Gender(long idGender, String type) {
        this.idGender = idGender;
        this.type = type;
    }

    public Gender(String type) {
        this.type = type;
    }

    public Gender() {
    }
    
    
    @Override
    public long getId() {
        return idGender;
    }

    public void setIdGender(long idGender) {
        this.idGender = idGender;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
