class num 
{   
    double trs = 1E-4;
    float result;
    int res;
    int lower;
    float var;
   // int rslt;
   
    
  void repeat(float yourFloat)
  {
    var = yourFloat;
    
    for (int i = 2; i !=0 ; i++)
      {        
       
       
        yourFloat += var;
        result = var*i;
        // print("debug");
        
        if (i != 2 && result - yourFloat < trs && result == (int)result)
          {
           //String upNum = str(result);
           //String downNum = str(i);
           res = (int)result;
           println(var + " times " + i + " equals " + res);
           println(" ");
           println(res+ " over "+ i + " is " + var);
           
           lower = (int)i;
          // rslt = (int)var;      
           i = 0;
           break; 
          } 
            
  
         else 
          {
        //------------------DEBUG-----------------------// 
        //  println(yourFloat + " " + var * i);
        //   println(var * i - yourFloat + " "+ trs);
        //   println("var: " + var + "  yourFloat: " + yourFloat); 
     /*  println("PROCESSING  ...              PROCESSING");
         println("PROCESSING      ...          PROCESSING");
         println("PROCESSING          ...      PROCESSING");
         println("PROCESSING              ...  PROCESSING"); */
          }
     
     }
   }
   
   void update()
   {
     int length = String.valueOf(res).length();
     
     textSize(40);
     text(res,30,120);
     text(lower,30,170);
     text(var,175,145);
     
     stroke(255);
     rect(30,129,25*length,2);
     rect(148,123,27,2);
     rect(148,138,27,2);
     
   }
   
}   
