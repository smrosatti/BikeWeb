/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Pane;

/**
 *
 * @author Aluno
 */
public class ComponentFactory {

    public Pane createComponent(String img, String title, String address) {

        Pane pane = new Pane();

        pane.setPrefSize(210, 180);

        ImageView imageView = new ImageView();

        imageView.setFitHeight(120);
        imageView.setFitWidth(160);

        imageView.setPreserveRatio(false);
        imageView.setImage(new Image(img)); 

        Label label = new Label();
        Label label1 = new Label();

        label.setText(title);
        label1.setText(address);

        pane.getChildren().addAll(imageView, label, label1);

        imageView.setLayoutX(25);
        imageView.setLayoutY(7);

        label.setLayoutX(32);
        label.setLayoutY(133);
        label1.setLayoutX(32);
        label1.setLayoutY(158);
        pane.getStylesheets().add("/br/com/bikefood/view/style.css");
        pane.getStyleClass().add("pane");

        return pane;
    }

    public Pane componentEmp(String img, String title, String address, String tel) {
        Pane pane = new Pane();
        pane.setPrefSize(320, 320);

        ImageView imageView = new ImageView();
        imageView.setPreserveRatio(false);
        imageView.setFitWidth(200);
        imageView.setFitHeight(150);
        imageView.setLayoutX(60);
        imageView.setLayoutY(14);
        
        imageView.setImage(new Image(img)); 
        Label name = new Label();
        name.setText(title);
        name.setLayoutX(146);
        name.setLayoutY(197);
        
        Label addres = new Label();
        addres.setText(address);
        addres.setLayoutX(146);
        addres.setLayoutY(223);

        Label end = new Label();
        end.setText("Endereço:");
        end.setLayoutX(60);
        end.setLayoutY(223);

        Label tele = new Label();
        tele.setText(tel);
        tele.setLayoutX(146);
        tele.setLayoutY(260);
        
        Label cont = new Label();
        cont.setText("Contato");
        cont.setLayoutX(60);
        cont.setLayoutY(260);
        
        pane.getChildren().addAll(imageView,name, addres, end, tele, cont);
        return pane;
    }
}
