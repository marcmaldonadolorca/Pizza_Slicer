package pizza.pizzaslicer;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.util.Collections;
import java.util.List;

public class Cliente {

	public static String getIPAddress(boolean useIPv4) {
		try {
			List<NetworkInterface> interfaces = Collections.list(NetworkInterface.getNetworkInterfaces());
			for (NetworkInterface intf : interfaces) {
				List<InetAddress> addrs = Collections.list(intf.getInetAddresses());
				for (InetAddress addr : addrs) {
					if (!addr.isLoopbackAddress()) {
						String sAddr = addr.getHostAddress();
						//boolean isIPv4 = InetAddressUtils.isIPv4Address(sAddr);
						boolean isIPv4 = sAddr.indexOf(':')<0;

						if (useIPv4) {
							if (isIPv4)
								return sAddr;
						} else {
							if (!isIPv4) {
								int delim = sAddr.indexOf('%'); // drop ip6 zone suffix
								return delim<0 ? sAddr.toUpperCase() : sAddr.substring(0, delim).toUpperCase();
							}
						}
					}
				}
			}
		} catch (Exception ignored) { } // for now eat exceptions
		return "";
	}

	public void enviarDatos(int metodo_corte, int valor_corte, int tipo_pizza) {
		// TODO Auto-generated method stub
		
		final String HOST = "192.168.1.140";
		final int PUERTO = 5000;
		DataOutputStream out;
		
		try {
			Socket socket = new Socket(HOST, PUERTO);

			out = new DataOutputStream(socket.getOutputStream());
			System.out.print("Escribiendo Mensaje\n");
			String msg = metodo_corte + " " + valor_corte + " " + tipo_pizza;
			out.writeUTF(msg);
			
			socket.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}