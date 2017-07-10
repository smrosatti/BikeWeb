
package Model;

import Dal.Dal;

/**
 *
 * @author Samuel Leandro
 */
public class InsertClass {

    public static void main(String[] args) {
        Dal dal = new Dal();
        
        BFType bt = new BFType();
        bt.setType("Doces");
        dal.create(bt);
        
        dal = new Dal();
        
        BFType bt2 = new BFType();
        bt2.setType("Cafés");
        dal.create(bt2);
        
        dal = new Dal();
        
        BFType bt3 = new BFType();
        bt3.setType("Lanches em Geral");
        dal.create(bt3);
        
        dal = new Dal();
        
        BFType bt4 = new BFType();
        bt4.setType("Salgados");
        dal.create(bt4);
        
        dal = new Dal();
        
        BFType bt5 = new BFType();
        bt5.setType("Comida Estrangeira");
        dal.create(bt5);
        
        dal = new Dal();
        
        BFType bt6 = new BFType();
        bt6.setType("Outros");
        dal.create(bt6);
        
        dal = new Dal();
        
        Country c1 = new Country();
        c1.setCountryName("Brasil");
        dal.create(c1);
        
        dal = new Dal();
        
        State s = new State();
        s.setStateName("Paraná");
        s.setIdCountry(c1);
        dal.create(s);
        
        dal = new Dal();
        
        City c = new City();
        c.setCityName("Curitiba");
        c.setIdState(s);
        dal.create(c);
        
        dal = new Dal();
        
         City ci1 = new City();
        ci1.setCityName("Quatro Barras");
        ci1.setIdState(s);
        dal.create(ci1);
        
        dal = new Dal();
        
         City ci2 = new City();
        ci2.setCityName("Campina");
        ci2.setIdState(s);
        dal.create(ci2);
        
        dal = new Dal();
        
         City ci3 = new City();
        ci3.setCityName("Piraquara");
        ci3.setIdState(s);
        dal.create(ci3);
        
        dal = new Dal();
        
         City ci4 = new City();
        ci4.setCityName("Colombo");
        ci4.setIdState(s);
        dal.create(ci4);
        
        dal = new Dal();

        UserType adm = new UserType();
        adm.setUserType("Admin");
        dal.create(adm);
        
        dal = new Dal();
        
        UserType defaultt = new UserType();
        defaultt.setUserType("Default");
        dal.create(defaultt);
        
        dal = new Dal();
        
        UserType emp = new UserType();
        emp.setUserType("Emp");
        dal.create(emp);
        
        dal = new Dal();
                
        Gender male = new Gender();
        male.setType("Male");
        dal.create(male);
        
        dal = new Dal();
        
        Gender female = new Gender();
        female.setType("Female");
        dal.create(female);
    
    }
}
