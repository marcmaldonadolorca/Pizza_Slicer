package pizza.pizzaslicer;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class WaitingActivity extends AppCompatActivity {

    //Servidor servidor = new Servidor();
    //String msg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_waiting);

        /*msg = servidor.crearServidor();

        //ventana emergente que muestre el msg
        AlertDialog.Builder alerta = new AlertDialog.Builder(WaitingActivity.this);
        alerta.setMessage(msg).setCancelable(false).setPositiveButton("Aceptar", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                startActivity(new Intent(WaitingActivity.this, MainActivity.class));
            }
        });

        AlertDialog titulo = alerta.create();
        titulo.setTitle("Mensage del PizzaSlicer");
        titulo.show();*/
    }
}
