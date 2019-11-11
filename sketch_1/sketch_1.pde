int start = 0;
int end = 1000;
int sum;

void start(){

  for (int i = start; i < end; i++) {
  if (i % 3 == 0 || i % 5 == 0) {
    sum += i;
    println(sum);
  }
}
  
}
