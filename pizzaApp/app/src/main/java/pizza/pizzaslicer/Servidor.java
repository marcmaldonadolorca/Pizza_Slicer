package pizza.pizzaslicer;

import java.io.DataInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Servidor {

    public String crearServidor() {

        ServerSocket servidor = null;
        Socket socket = null;
        final int PUERTO = 6000;
        DataInputStream in;
        String msg = "No ha recibido nada del PizzaSlicer";

        try {

            servidor = new ServerSocket(PUERTO);

            socket = servidor.accept();
            in = new DataInputStream(socket.getInputStream());

            msg = in.readUTF();

            socket.close();

            servidor.close();

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return msg;
    }

}