package Model;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

/**
 *
 * @author Samuel Leandro
 */
@Entity
public class Userr implements Serializable, ModelBase{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idUser;
    
    private String name;
    private String lastName;
    private String password;
    @OneToOne
    private Gender idGender;
    @OneToOne
    private UserType idType;
    @Column(nullable = true)
    private String cpf;
    @Column(unique = true)
    private String email;
    private LocalDate birthday;
    private String img;
    @Transient
    private static Userr instance;
    

    public Userr(long idUser, String name, String lastName, String password, Gender idGender, UserType idType, String cpf, String email,LocalDate birthday, String img) {
        this.idUser = idUser;
        this.name = name;
        this.lastName = lastName;
        this.password = password;
        this.idGender = idGender;
        this.idType = idType;
        this.cpf = cpf;
        this.email = email;
        this.birthday = birthday;
        this.img = img;
    }

    public Userr(String name, String lastName, String password, Gender idGender, UserType idType, String cpf, String email, LocalDate birthday, String img) {
        this.name = name;
        this.lastName = lastName;
        this.password = password;
        this.idGender = idGender;
        this.idType = idType;
        this.cpf = cpf;
        this.email = email;
        this.birthday = birthday;
        this.img = img;
    }

    public Userr() {
    }
    
    public static void setInstance(Userr userr){
        instance = userr;
    }
    public static Userr getInstance(){
        if(instance == null){
            instance = new Userr();
        }
        return instance;
    }
    
    @Override
    public long getId() {
        return idUser;
    }

    public void setIdUser(long idUser) {
        this.idUser = idUser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Gender getIdGender() {
        return idGender;
    }

    public void setIdGender(Gender idGender) {
        this.idGender = idGender;
    }

    public UserType getIdType() {
        return idType;
    }

    public void setIdType(UserType idType) {
        this.idType = idType;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
    
}
