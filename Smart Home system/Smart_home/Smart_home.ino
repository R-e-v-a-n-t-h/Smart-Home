#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  for (int i = 2;i<=13;i++){
    pinMode(i,OUTPUT);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  
  if (Serial.available()>0){
    String msg = Serial.readString();
    unsigned int len = msg.length();
    int mid = len/2;
    for (int i=0, j=mid+1; i<mid && j<len ; i++, j++){
      int x;
      switch(msg[i]){
        case '0':
                 x=2;
                 break;
        case '1':
                 x=3;
                 break;
        case '2':
                 x=4;
                 break;
        case '3':
                 x=5;
                 break;
        case '4':
                 x=6;
                 break;
        case '5':
                 x=7;
                 break;
        case '6': 
                x=8;
                break;
        case '7':
                 x=9;
                 break;
        case '8':
                x=10;
                break;
        case '9':
                x=11;
                break;
        };
      if (msg[j]=='1')
        digitalWrite(x,HIGH);
      else
        digitalWrite(x,LOW);
    }
  }

}
