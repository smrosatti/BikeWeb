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
public class UserType implements Serializable, ModelBase{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idType;
    
    private String userType;

    public UserType(long idType, String userType) {
        this.idType = idType;
        this.userType = userType;
    }

    public UserType(String userType) {
        this.userType = userType;
    }

    public UserType() {
    }
    @Override
    public long getId() {
        return getIdType();
    }

    public void setIdType(long idType) {
        this.idType = idType;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    /**
     * @return the idType
     */
    public long getIdType() {
        return idType;
    }
    
    
}
