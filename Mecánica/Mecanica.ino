#include <Stepper.h>
#include <Servo.h>
#define STEPS 20 //Ponemos el número de pasos que necesita para dar una vuelta. 200 en nuestro caso
 
int sensor1 = 4;
int sensor2 = 2;
Stepper stepper(STEPS, 6, 9, 10, 11); //Stepper nombre motor (número de pasos por vuelta, pins de control)
Servo servo;

void setup()
{
  // Velocidad del motor en RPM
  stepper.setSpeed(300);
  Serial.begin(9600);
  servo.attach(7);
  servo.write(0);
  pinMode(sensor1, INPUT);
  pinMode(sensor2, INPUT);
}
 


void cortar_y_trocear()
{
  while(digitalRead(sensor1) == LOW)
  {
  stepper.step(1);
  delay(500); //Pequeña pausa
  }
  delay(500); //Pequeña pausa
  while(digitalRead(sensor2) == LOW)
  {
  stepper.step(-1);
  delay(500); //Pequeña pausa
  }
  delay(500);    
  }

void ingrediente(double y, double z)
{
  if(y < 0)
  {
    y = y + 180;
  }
  
  if(z < 0)
  {
    z = z + 180;
  }
        servo.write(y);
        delay(100);
    	cortar_y_trocear();
    	delay(10);
        servo.write(z);
        delay(100);
      	cortar_y_trocear();
    	delay(10);
        servo.write(0);
        delay(100);
}

void cortes(int x)
{
  switch(x)
  {
    case 2:
  		cortar_y_trocear();
    break;
    case 4:
  		cortar_y_trocear();
        delay(10);
        servo.write(90);
        delay(100);
    	cortar_y_trocear();
    	delay(10);
        servo.write(0);
        delay(100);

    break;
    case 6:
  		cortar_y_trocear();
        delay(10);
        servo.write(60);
        delay(100);
    	cortar_y_trocear();
    	delay(10);
        servo.write(120);
        cortar_y_trocear();
    	delay(10);
        servo.write(0);
        delay(100);
    
    
    break;
    case 8:
  		cortar_y_trocear();
        delay(10);
        servo.write(45);
        delay(100);
    	cortar_y_trocear();
    	delay(10);
        servo.write(90);
        cortar_y_trocear();
    	delay(10);
        servo.write(135);
        cortar_y_trocear();
    	delay(10);
        servo.write(0);
    	delay(100);
    
    break;
    
    delay(5000);
  }
}


void loop()
{
  if (Serial.available()){
    int c = Serial.read();
  if(c = 1)
  {
    double a = Serial.read();
    double b = Serial.read();
    ingrediente(a,b);
  } else {
    int a = Serial.read();
    cortes(a);
  }
  }
}
