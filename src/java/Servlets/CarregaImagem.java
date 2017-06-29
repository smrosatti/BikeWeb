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
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author SARA
 */
public class CarregaImagem {

    //CAMINHO A SER EDITADO
    private String caminho = "C:\\Users\\SARA\\Documents\\NetBeansProjects";

    public String upload(HttpServletRequest request, HttpServletResponse response, int i) {
        try {

            if (ServletFileUpload.isMultipartContent(request)) {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                String img = "C:\\Users\\User\\Desktop\\BikeWeb\\web\\iImage\\user" + i+ ".jpg";

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        item.write(new File(img));
                    }
                }
                System.out.println("FOI");

                return img;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void carregabftodos() {
        try {
            Dal dal = new Dal();
            Bikefood bf = new Bikefood();
            ArrayList<Bikefood> bikes = new ArrayList(dal.getList(bf));
            for (int x = 0; x < bikes.size(); x++) {
                String path = bikes.get(x).getImg();
                if (path.contains("br/com/bikefood/image")) {
                    //CAMINHO PARA IMAGENS
                    path = caminho + "\\BikeWeb\\web\\Image\\bfpadrao.jpg";
                } else {
                    path = bikes.get(x).getImg();
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                BufferedImage imagem = ImageIO.read(new File(path));

                //CAMINHO PARA DOWNLAD DE IMAGENS
                ImageIO.write(imagem, "JPEG", new File(caminho + "\\BikeWeb\\web\\ImageBikes\\bk" + bikes.get(x).getId() + ".jpg"));

            }
        } catch (Exception ee) {
            ee.printStackTrace();
        }
    }

    public void carregabf(Userr u) {
        try {
            Dal dal = new Dal();
            ArrayList<Bikefood> bikes = new ArrayList(dal.getBikes((int) u.getId()));
            for (int x = 0; x < bikes.size(); x++) {
                String path = bikes.get(x).getImg();
                if (path.contains("br/com/bikefood/image")) {
                    //CAMINHO PARA IMAGENS
                    path = caminho + "\\BikeWeb\\web\\Image\\bfpadrao.jpg";
                } else {
                    path = bikes.get(x).getImg();
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                BufferedImage imagem = ImageIO.read(new File(path));

                //CAMINHO PARA DOWNLAD DE IMAGENS
                ImageIO.write(imagem, "JPEG", new File(caminho + "\\BikeWeb\\web\\ImageBikes\\bk" + bikes.get(x).getId() + ".jpg"));

            }
        } catch (Exception ee) {
            ee.printStackTrace();
        }
    }

    public void carregaCard(Bikefood bkf) {
        try {
            Dal dal = new Dal();
            ArrayList<Product> bikes = new ArrayList(dal.getProducts((int) bkf.getId()));
            for (int x = 0; x < bikes.size(); x++) {
                String path = bikes.get(x).getImg();
                if (path.contains("br/com/bikefood/image")) {
                    path = caminho + "\\BikeWeb\\web\\Image\\product.png";
                } else {
                    path = bikes.get(x).getImg();
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                BufferedImage imagem = ImageIO.read(new File(path));

                ImageIO.write(imagem, "JPEG", new File(caminho + "\\BikeWeb\\web\\ImageCardapios\\product" + bikes.get(x).getId() + ".jpg"));
            }
        } catch (Exception ee) {
            ee.printStackTrace();
        }
    }

    public void carregaFav(Userr u) {
        try {

            Dal dal = new Dal();
            ArrayList<Favorites> bikes = new ArrayList(dal.getFavorites((int) u.getId()));
            for (int x = 0; x < bikes.size(); x++) {
                String path = bikes.get(x).getIdBikefood().getImg();
                if (path.contains("br/com/bikefood/image")) {
                    path = caminho + "\\BikeWeb\\web\\Image\\bfpadrao.jpg";
                } else {
                    path = bikes.get(x).getIdBikefood().getImg();
                    path = path.replaceAll("file:///", "");
                }
                System.out.println(path);
                BufferedImage imagem = ImageIO.read(new File(path));

                ImageIO.write(imagem, "JPEG", new File(caminho + "\\BikeWeb\\web\\ImageBikes\\bikef" + bikes.get(x).getIdFavorites() + ".jpg"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
