/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dal.Dal;
import Model.Bikefood;
import Model.Favorites;
import Model.Product;
import Model.Userr;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import javax.imageio.ImageIO;

/**
 *
 * @author SARA
 */
public class CarregaImagem {

    public void carregabf(Userr u) {
        try {
            Dal dal = new Dal();
            ArrayList<Bikefood> bikes = new ArrayList(dal.getBikes(1));
            for (int x = 0; x < bikes.size(); x++) {
                String path = bikes.get(x).getImg();
               if(path.contains("br/com/bikefood/image")){
                    path = "C:\\Users\\Aluno\\Documents\\NetBeansProjects\\Bikefood\\src\\br\\com\\bikefood\\image\\bfpadrao.jpg";            
                }else{
                    path = bikes.get(x).getImg(); 
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                 BufferedImage imagem = ImageIO.read(new File(path));

                ImageIO.write(imagem, "JPEG", new File("C:\\Users\\Aluno\\Documents\\NetBeansProjects\\BikeWeb\\web\\ImageBikes\\bk"+bikes.get(x).getId()+".jpg" ));
            
            }
        } catch (Exception ee) {
            ee.printStackTrace();
        }
    }
    
    public void carregaCard(Bikefood bkf){
         try {
            Dal dal = new Dal();
            ArrayList<Product> bikes = new ArrayList(dal.getProducts((int) bkf.getId()));
            for (int x = 0; x < bikes.size(); x++) {
                String path = bikes.get(x).getImg();
                if(path.contains("br/com/bikefood/image")){
                    path = "C:\\Users\\Aluno\\Documents\\NetBeansProjects\\Bikefood\\src\\br\\com\\bikefood\\image\\product.jpg";            
                }else{
                    path = bikes.get(x).getImg(); 
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                 BufferedImage imagem = ImageIO.read(new File(path));

                ImageIO.write(imagem, "JPEG", new File("C:\\Users\\Aluno\\Documents\\NetBeansProjects\\BikeWeb\\web\\ImageCardapios\\product"+bikes.get(x).getId()+".jpg" ));
            }
        } catch (Exception ee) {
            ee.printStackTrace();
        }
    }
    
    public void carregaFav(Userr u){
        try {
            
             Dal dal = new Dal();
            ArrayList<Favorites> bikes = new ArrayList(dal.getFav(u));
            for (int x = 0; x < bikes.size(); x++) {
                String path = bikes.get(x).getIdBikefood().getImg();
                if(path.contains("br/com/bikefood/image")){
                    path = "C:\\Users\\Aluno\\Documents\\NetBeansProjects\\Bikefood\\src\\br\\com\\bikefood\\image\\bfpadrao.jpg";            
                }else{
                    path = bikes.get(x).getImg(); 
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                 BufferedImage imagem = ImageIO.read(new File(path));

                ImageIO.write(imagem, "JPEG", new File("C:\\Users\\Aluno\\Documents\\NetBeansProjects\\BikeWeb\\web\\ImageBikes\\bikef"+bikes.get(x).getId()+".jpg" ));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    

}
