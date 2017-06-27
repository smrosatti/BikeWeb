/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dal.Dal;
import Model.Bikefood;
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
            ArrayList<Bikefood> bikes = new ArrayList(dal.getBikes((int) u.getId()));
            for (int x = 0; x < bikes.size(); x++) {
                String path = bikes.get(x).getImg();
               if(path.contains("br/com/bikefood/image")){
                    path = "C:\\Users\\SARA\\Documents\\NetBeansProjects\\Bikefood\\src\\"+bikes.get(x).getImg();            
                }else{
                    path = bikes.get(x).getImg(); 
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                 BufferedImage imagem = ImageIO.read(new File(path));

                ImageIO.write(imagem, "JPEG", new File("C:\\Users\\SARA\\Documents\\NetBeansProjects\\Bikefood-Web\\BikeWeb\\web\\ImageBikes\\bk"+bikes.get(x).getId()+".jpg" ));
            
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
                    path = "C:\\Users\\SARA\\Documents\\NetBeansProjects\\Bikefood\\src\\"+bikes.get(x).getImg();            
                }else{
                    path = bikes.get(x).getImg(); 
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                 BufferedImage imagem = ImageIO.read(new File(path));

                ImageIO.write(imagem, "JPEG", new File("C:\\Users\\SARA\\Documents\\NetBeansProjects\\Bikefood-Web\\BikeWeb\\web\\ImageCardapios\\product"+bikes.get(x).getId()+".png" ));
            }
        } catch (Exception ee) {
            ee.printStackTrace();
        }
    }

    

}
