
   
//INSERT YOUR FLOAT HERE

double trs = 1E-5;
void setup(){

  size(300,300);

}

class num 
{
  
  void repeat(float yourFloat)
  {
      for (int i = 2; i != 0; i++)
      {
   
        float var = yourFloat; 
        //float division = i/yourFloat;
        yourFloat += var;
        float result = var*i;
   print("debug");
        if (i != 2 && result - yourFloat < trs && result == (int)result)
          {
            //String upNum = str(result);
            //String downNum = str(i);
            print(var + " times " + i + " equals " + result);
      

            break; 
          } 
            
  
         else 
         {
        
           println(yourFloat + " " + var * i);
           println(var * i - yourFloat + " "+ trs);
         }
           //textSize(15);
          // text(upNum, 40, 40);  
      }
      return;
  }

}
num number = new num();
void draw(){
  number.repeat(0.5f);
  
}
