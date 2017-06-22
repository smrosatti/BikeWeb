/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author Samuel Leandro
 */
@Entity

public class Product implements Serializable, ModelBase{
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)            
    private long idProduct;
    @ManyToOne
    private Bikefood idBikefood;
    private String name;
    private String ingredients;
    private String img;
    
    private BigDecimal price;

    public Product(long idProduct, Bikefood idBikefood, String name, String ingredients, String img, BigDecimal price) {
        this.idProduct = idProduct;
        this.idBikefood = idBikefood;
        this.name = name;
        this.ingredients = ingredients;
        this.img = img;
        this.price = price;
    }

    public Product(Bikefood idBikefood, String name, String ingredients, String img, BigDecimal price) {
        this.idBikefood = idBikefood;
        this.name = name;
        this.ingredients = ingredients;
        this.img = img;
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Product() {
    }
    @Override
    public long getId() {
        return idProduct;
    }

    public void setIdProduct(long idProduct) {
        this.idProduct = idProduct;
    }

    public Bikefood getIdBikefood() {
        return idBikefood;
    }

    public void setIdBikefood(Bikefood idBikefood) {
        this.idBikefood = idBikefood;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
}
