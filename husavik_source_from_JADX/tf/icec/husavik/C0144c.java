package tf.icec.husavik;

import java.io.IOException;
import java.net.ServerSocket;

/* renamed from: tf.icec.husavik.c */
public class C0144c extends Thread {
    final MainActivity f4a;

    public C0144c(MainActivity mainActivity) {
        this.f4a = mainActivity;
    }

    public void run() {
        try {
            this.f4a.f2c = new ServerSocket(6464);
            while (true) {
                this.f4a.f2c.accept();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
