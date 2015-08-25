package tf.icec.husavik;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.Socket;

/* renamed from: tf.icec.husavik.b */
public class C0143b extends Thread {
    final MainActivity f3a;

    public C0143b(MainActivity mainActivity) {
        this.f3a = mainActivity;
    }

    public void run() {
        try {
            Socket socket = new Socket("127.0.0.1", 6464);
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(socket.getOutputStream());
            objectOutputStream.writeObject("ZmxhZ193YWl0X3dhc250X2l0X2RhbHZpawo=");
            objectOutputStream.close();
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
