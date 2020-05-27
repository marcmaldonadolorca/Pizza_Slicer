package pizza.pizzaslicer;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

public class IngredientActivity extends AppCompatActivity {

    private ImageView img1, img2, img3, img4;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ingredient);

        img1 = (ImageView) findViewById(R.id.imageView);
        img1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MainActivity.cliente.enviarDatos(1, 1, MainActivity.tipoPizza);
                startActivity(new Intent(IngredientActivity.this, WaitingActivity.class));
            }
        });

        img2 = (ImageView) findViewById(R.id.imageView2);
        img2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MainActivity.cliente.enviarDatos(1, 2,MainActivity.tipoPizza);
                startActivity(new Intent(IngredientActivity.this, WaitingActivity.class));
            }
        });

        img3 = (ImageView) findViewById(R.id.imageView3);
        img3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MainActivity.cliente.enviarDatos(1, 3,MainActivity.tipoPizza);
                startActivity(new Intent(IngredientActivity.this, WaitingActivity.class));
            }
        });

        img4 = (ImageView) findViewById(R.id.imageView4);
        img4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MainActivity.cliente.enviarDatos(1, 4,MainActivity.tipoPizza);
                startActivity(new Intent(IngredientActivity.this, WaitingActivity.class));
            }
        });

    }
}
