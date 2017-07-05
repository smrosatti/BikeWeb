/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import javafx.geometry.Pos;
import javafx.util.Duration;
import org.controlsfx.control.Notifications;

/**
 *
 * @author Samuel Leandro
 */
public class NotificationFactory {
    
    public void alertCenter(String title, String text) {
        Notifications nb = Notifications.create()
                .title(title)
                .text(text)
                .graphic(null)
                .position(Pos.CENTER)
                .hideAfter(Duration.seconds(4));
        nb.show();
        
    }
    
    public void openAndClose(Class classe){
        
        
    }

}
