package tf.icec.husavik;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy.Builder;
import android.view.View;
import java.net.ServerSocket;

public class MainActivity extends Activity {
    Thread f0a;
    Thread f1b;
    ServerSocket f2c;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(C0142R.layout.activity_main);
        StrictMode.setThreadPolicy(new Builder().permitAll().build());
        this.f0a = new Thread(new C0144c(this));
        this.f0a.start();
        this.f1b = new Thread(new C0143b(this));
        this.f1b.start();
    }

    public void red(View view) {
        startActivity(new Intent(this, RedHerring.class));
    }
}
