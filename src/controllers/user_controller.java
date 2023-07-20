package controllers;

// importamos la clase user_model
import models.user;

public class user_controller {

    // usamos el procedimiento almacenado para crear un usuario "create_user", recibimos los parametros name , email, password, phone, address
    // y retornamos un booleano que nos indica si se creo o no el usuario
    public boolean create_user(String name, String email, String password, String phone, String address) {
        // creamos un objeto de la clase user_model
        models.user user = new models.user();
        // llamamos al metodo create_user de la clase user_model y le pasamos los parametros name, email, password, phone, address
        // y guardamos el resultado en la variable result
        boolean result = user.create_user(name, email, password, phone, address);
        // retornamos el resultado
        return result;
    }


    
}
