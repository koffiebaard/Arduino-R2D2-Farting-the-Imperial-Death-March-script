int speaker = 3;
int pot1 = 0;
int pot2 = 1;
float tempo = 0;
float maatfix = 0;
long bitches[] = {0};


//octaaf 0
int C0 = 122324;
int Cis0 = 115473;
int D0 = 108992;
int Dis0 = 102881;
int E0 = 97087;
int F0 = 91659;
int Fis0 = 86505;
int G0 = 81666;
int Gis0 = 77071;
int A0 = 72727;
int Ais0 = 68658;
int Bi0 = 64809;

//octaaf 1
int C1 = 61162;
int Cis1 = 57737;
int D1 = 54496;
int Dis1 = 51427;
int E1 = 48544;
int F1 = 45819;
int Fis1 = 43253;
int G1 = 40825;
int Gis1 = 38528;
int A1 = 36364;
int Ais1 = 34323;
int Bi1 = 32399;

//octaaf 2
int C2 = 30581;
int Cis2 = 28864;
int D2 = 27244;
int Dis2 = 25714;
int E2 = 24272;
int F2 = 22910;
int Fis2 = 21624;
int G2 = 20410;
int Gis2 = 19268;
int A2 = 18182;
int Ais2 = 17167;
int B2 = 16207;

//octaaf 3
int C3 = 15291;
int Cis3 = 14440;
int D3 = 13624;
int Dis3 = 12862;
int E3 = 12136;
int F3 = 11455;
int Fis3 = 10817;
int G3 = 10209;
int Gis3 = 9634;
int A3 = 9091;
int Ais3 = 8584;
int B3 = 8100;

//octaaf 4
int C4 = 7645;
int Cis4 = 7218;
int D4 = 6812;
int Dis4 = 6429;
int E4 = 6068;
int F4 = 5727;
int Fis4 = 5407;
int G4 = 5103;
int Gis4 = 4816;
int A4 = 4545;
int Ais4 = 4291;
int B4 = 4050;

//octaaf 5
int C5 = 3823;
int Cis5 = 3608;
int D5 = 3405;
int Dis5 = 3214;
int E5 = 3034;
int F5 = 2864;
int Fis5 = 2703;
int G5 = 2551;
int Gis5 = 2408;
int A5 = 2273;
int Ais5 = 2145;
int B5 = 2025;






//imperial march  (werkt)  tempo is 0.5
long pauses[] = {100, 100, 200, 200, 200, 100, 200, 200, 20, 400, 200, 200, 200, 200, 20, 200, 200, 20, 400, 20, 20, 20, 200, 20, 20, 20, 20, 600, 200, 200, 20, 20, 20, 20, 600, 200, 200, 20, 100, 200, 20, 20, 400};
long toonlengtes[] =   {60,  60,  60,  40,  10,  60,  40,  20,  120,  60,  60,  60,  40,  20,  60,  40,  20,  120,  80,  60,  20,  60,  60,  20,  20,  20,  20,  20,  60,  60,  20,  20,  20,  20,  20,  60,  60,  10,  60,  60,  20,  120};
long toonhoogtes[] = {G3, G3, G3, E3, B3, G3, E3, B3, G3, D4, D4, D4, E4, B3, G3, E3, B3, G3, G4, G3, G3, G4, F4, F4, E4, E4, F4, A3, D4, C4, B3, B3, A3, B3, E3, G3, E3, G3, B3, G3, B3, D4};



int countMelodie = sizeof(toonlengtes) / sizeof(unsigned long);



void setup () {
    
  Serial.begin(9600);
    pinMode(speaker, OUTPUT);
}



void loop () {

    for (int cur = 0; cur < countMelodie; cur++) {
      bringonthebeep(speaker, toonhoogtes[cur], toonlengtes[cur]);
      tempo = analogRead(pot1)/100;
      maatfix =  analogRead(pot2)/100;
      Serial.print("maatfix: ");
      Serial.print(maatfix);
      Serial.print("\n tempo: ");
      Serial.print(tempo);
      
      if (pauses[cur] < 100) {
       
        Serial.print(toonhoogtes[cur] );
        Serial.print(" - ");
        Serial.print(cur);
        Serial.print("\n");
      }

      delay(pauses[cur] * tempo);

    }
    
    delay(1000);
}




void bringonthebeep(int pin, int hoogte, int lenkte) {
   
      lenkte = lenkte / maatfix; //naar ms secondes
       
        //for (int booya = delaygodver; booya < delayOfAwesome; booya = booya + delaygodver) {
	int booya = lenkte/(hoogte);
                     
	while (booya < lenkte) {
      
         
       digitalWrite(pin, HIGH);
       delayMicroseconds(hoogte);
       digitalWrite(pin, LOW);
       delayMicroseconds(hoogte);
       booya++;
    }
}

