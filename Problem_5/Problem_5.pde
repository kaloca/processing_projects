int sum;

void start() {
  for (int i = 1; true; i++) {
    for (int j = 1; j <= 20; j++) {
      if (i % j == 0){
        sum++;
        //println(sum);
        if (sum > 19){
          print(i);
        }
      }
    }
    sum = 0;
  }
}
