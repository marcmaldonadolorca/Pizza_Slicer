package pizza.pizzaslicer;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class NumberActivity extends AppCompatActivity {

    private Button btn;
    private Button btn2;
    private Button btn3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_number);
        final MainActivity main = new MainActivity();

        btn = (Button) findViewById(R.id.button3);
        btn2 = (Button) findViewById(R.id.button4);
        btn3 = (Button) findViewById(R.id.button5);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MainActivity.cliente.enviarDatos(2, 4,MainActivity.tipoPizza);
                startActivity(new Intent(NumberActivity.this, WaitingActivity.class));
            }
        });

        btn2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MainActivity.cliente.enviarDatos(2, 6,MainActivity.tipoPizza);
                startActivity(new Intent(NumberActivity.this, WaitingActivity.class));
            }
        });

        btn3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MainActivity.cliente.enviarDatos(2, 8,MainActivity.tipoPizza);
                startActivity(new Intent(NumberActivity.this, WaitingActivity.class));
            }
        });
    }
}
