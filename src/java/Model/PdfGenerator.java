/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;


import Dal.Dal;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Aluno
 */
public class PdfGenerator {

    public File menuGenerator(File a, Bikefood bike) throws BadElementException, IOException {
        try {
            Document doc = new Document();
            PdfWriter.getInstance(doc, new FileOutputStream(a.getAbsolutePath()));

            doc.open();

            doc.add(new Paragraph("Cardápio do Bike Food: " + bike.getName()));
            doc.add(new Paragraph("Especialidade em: " + bike.getType().getType()));
            doc.add(new Paragraph("\n"));
            doc.add(new Paragraph("\n"));

            Dal dal = new Dal();

            List<Product> cardapio = dal.getProducts((int) bike.getId());

            for (int x = 0; x < cardapio.size(); x++) {
                
                String image;
                
                if (cardapio.get(x).getImg().contains("br/com/bikefood")) {
                    image = "C:\\Users\\Aluno\\Documents\\NetBeansProjects\\Bikefood\\src\\br\\com\\bikefood\\image\\product.png";
                    
                } else {
                    image = cardapio.get(x).getImg();
                    
                }
                
                Image img = Image.getInstance(image);
                img.scaleAbsolute(125, 125);
                doc.add(img);
                
                doc.add(new Paragraph("Nome do Prato: " + cardapio.get(x).getName()));
                doc.add(new Paragraph("Preço do Prato: " + cardapio.get(x).getPrice()));
                doc.add(new Paragraph("Ingredientes: " + cardapio.get(x).getIngredients()));
                doc.add(new Paragraph("\n"));
                System.out.println(cardapio.get(x).getImg());
            }

            doc.close();

            return a;

        } catch (FileNotFoundException ex) {
            Logger.getLogger(PdfGenerator.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ee) {
            Logger.getLogger(PdfGenerator.class.getName()).log(Level.SEVERE, null, ee);
        }

        return a;
    }

}
