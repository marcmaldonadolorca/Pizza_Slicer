package pizza.pizzaslicer;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class Cliente {

	public void enviarDatos(int metodo_corte, int valor_corte) {
		// TODO Auto-generated method stub
		
		final String HOST = "192.168.1.132";
		final int PUERTO = 5000;
		DataOutputStream out;
		
		try {
			Socket socket = new Socket(HOST, PUERTO);

			out = new DataOutputStream(socket.getOutputStream());
			System.out.print("Escribiendo Mensaje\n");
			String msg = metodo_corte + " " + valor_corte;
			out.writeUTF(msg);
			
			socket.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}