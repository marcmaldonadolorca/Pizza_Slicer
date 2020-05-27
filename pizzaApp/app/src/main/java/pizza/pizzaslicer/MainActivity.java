package pizza.pizzaslicer;

import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    static public Cliente cliente = new Cliente();
    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
    private ImageView img1, img2, img3, img4;
    static public int tipoPizza;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        StrictMode.setThreadPolicy(policy);

        img1 = (ImageView) findViewById(R.id.imageView5);
        img1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                tipoPizza=1;
                startActivity(new Intent(MainActivity.this, CutTypeActivity.class));
            }
        });

        img2 = (ImageView) findViewById(R.id.imageView6);
        img2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                tipoPizza=2;
                startActivity(new Intent(MainActivity.this, CutTypeActivity.class));
            }
        });

        img3 = (ImageView) findViewById(R.id.imageView7);
        img3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                tipoPizza=3;
                startActivity(new Intent(MainActivity.this, CutTypeActivity.class));
            }
        });

        img4 = (ImageView) findViewById(R.id.imageView8);
        img4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                tipoPizza=4;
                startActivity(new Intent(MainActivity.this, CutTypeActivity.class));
            }
        });

    }


}
