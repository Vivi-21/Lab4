/*
 * UTN/FICA/CITEL/SISTEMAS EMBEBIDOS
 * Nombre: Yucailla Viviana 
 * Fecha: 19/01/2021
 */
 
import processing.serial.*;

Serial port; //Objeto para puerto com
int dato=0; // Variable de rx de datos
int aux;

float [][] matriz ={
{(170-154.37)*40.0078064,475-67*5},
{(180-154.37)*40.0078064,475-80*5},
{(170-154.37)*40.0078064,475-65*5},
{(178-154.37)*40.0078064,475-75*5},
{(160-154.37)*40.0078064,475-55*5},
{(163-154.37)*40.0078064,475-60*5},
{(165-154.37)*40.0078064,475-63*5},
{(170-154.37)*40.0078064,475-70*5},
{(164-154.37)*40.0078064,475-62*5},
{(176-154.37)*40.0078064,475-77*5},
{(164-154.37)*40.0078064,475-60*5},
{(170-154.37)*40.0078064,475-76*5},
{(170-154.37)*40.0078064,475-56*5},
{(168-154.37)*40.0078064,475-60*5},
};


float sep,sep2;
int k=150;
int m=100;
float x=152,y,y1;

void setup() {
  port=new Serial(this,"COM12",9600);
  background(255);
  size(1290,550);
  sep=200;
  sep2=50;
  planoF();
  stroke(0);
  fill(#9B7610);  
  textSize(18);
  text("Puntos del conjunto de entrenamiento correspondientes a la regresión lineal",250,18);
  fill(0); 
  text("Eje Altura en cm ",550,520);
  text("E",1250,100);
  text("j",1253,120);
  text("e",1250,140);
  text("P",1250,185);
  text("e",1250,205);
  text("s",1250,225);
  text("o",1250,245);
  text("e",1250,290);
  text("n",1250,310);
  text("K",1250,350);
  text("g",1250,370);
  textSize(13);
  text("Laboratorio 3",20,525);
  text("Yucailla Viviana",20,545);
  fill(#F0C105);
  stroke(0);
  rect(120,310,180,55);
  fill(0);
  //textSize(14);
  textSize(14);
  text("y=1,18x-133,39",150,330);
  textSize(14);  
  text("R^2 = 0,7036",170,355);
}

void draw() {
  if(dato>0){
    y1 = 1.18*dato-133.39;
    fill(255,0,0);
    stroke(0);
    ellipse((dato-154.37)*40.0078064,475-y1*5,10,10);
  }
  
}

void planoF(){
  strokeWeight(1);
  rect(25,25,1200,450);
  for(float i=25;i<=1200;i+=sep){
    line(i,25,i,475);
    k=k+5;
    fill(0);  
    textSize(10);
    text(k,i,490); 
  }
    for(float j=25;j<=450;j+=sep2){
    line(25,j,1225,j);
    m=m-10;
    fill(0);  
    textSize(10);
    text(m,10,j);
  }
    for(int c=0;c<14;c++){
    fill(#E8B936);
    stroke(0);
    ellipse(matriz[c][0],matriz[c][1],10,10);
    }
    
    for(float v=225;v<=1025;v+=10){
    x++;
    y=1.18*x-133.39;
    fill(0);
    stroke(0);
    ellipse(v,250-y,7,5);
    }
}

void serialEvent(Serial port){
  
  dato=port.read();
  aux=int(dato); //Convertir de string a int
  println(dato);    

}
