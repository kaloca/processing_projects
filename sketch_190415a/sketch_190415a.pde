float a = 0;   //Distance to Closest Station
float b = 5;   //Distance to Furthest Station
float c = 10;   //Liters per Km
float d = 20; //Distance to Destiny
float e = 3; //1st Station Price
float f = 2.85;//2nd Station Price


void setup() {

  isItWorthIt(a, b, c, d, e, f);
}


void isItWorthIt(float distance1, float distance2, float consumption, float destinyDist, float price1, float price2) {

  float tripCost1 = (distance1 + destinyDist) / consumption * price1;
  float tripCost2 = (distance2 + destinyDist) / consumption * price2;



  // float priceAtStation = price * tankSize;

  if (tripCost1 > tripCost2) {
    print("It is worth it. You will save at least "+ (tripCost1 - tripCost2) + " dollars.");
  } else if (tripCost1 == tripCost2) {
    print("It would cost the same, go to the closest one.");
  } else {
    print("It is not worth it. You will loose at least "+ (tripCost2 - tripCost1) + " dollars.");
  }
}
