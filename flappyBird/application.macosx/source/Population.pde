//class Population {
//  Bird[] birds;

//  float fitnessSum;
//  int gen = 1;

//  int bestBird = 0;

//  Population(int size) {
//    birds = new Bird[size];
//    for (int i = 0; i< size; i++) {
//      birds[i] = new Bird();
//    }
//  }

//  //------------------------------------------------------------------------------------------------------------------------------
//  void show() {
//    for (int i = 1; i< birds.length; i++) {
//      birds[i].show();
//    }
//    birds[0].show();
//  }
//  void update() {
//    for (int i = 0; i< birds.length; i++) {
//      birds[i].move();
//    }
//    String genNum = str(gen);
//    textSize(15);
//    text("Generation " + genNum, 20, 20);
//  }
//}

//void calculateFitness() {
//  for (int i = 0; i< dots.length; i++) {
//    dots[i].calculateFitness();
//  }
//}

//boolean allBirdsDead() {
//  for (int i = 0; i< dots.length; i++) {
//    if (!birds[i].dead) { 
//      return false;
//    }
//  }
//  return true;
//}
////------------------------------------------------------------------------------------------------------------------------------
//void evolution() {
//  Bird[] newBirds = new Bird[birds.length];//next gen
//  setBestBird();
//  calculateFitnessSum();

//  //the champion lives on 
//  newBirds[0] = birds[bestBird].gimmeBaby();
//  newBirds[0].isBest = true;
//  for (int i = 1; i< newBirds.length; i++) {
//    //select parent based on fitness
//    Bird parent = selectParent();

//    //get baby from them
//    newBirds[i] = parent.gimmeBaby();
//  }
//  birds = newBirds.clone();
//  gen ++;
//}
//void calculateFitnessSum() {
//  fitnessSum = 0;
//  for (int i = 0; i< dots.length; i++) {
//    fitnessSum += dots[i].fitness;
//  }
//}

////-------------------------------------------------------------------------------------------------------------------------------------

//Bird selectParent() {
//  float rand = random(fitnessSum);


//  float runningSum = 0;

//  for (int i = 0; i< birds.length; i++) {
//    runningSum+= birds[i].fitness;
//    if (runningSum > rand) {
//      return birds[i];
//    }
//  }

//  //should never get to this point

//  return null;
//}

////------------------------------------------------------------------------------------------------------------------------------------------

//void mutateBabies() {
//  for (int i = 1; i< birds.length; i++) {
//    birds[i].brain.mutate();
//  }
//}

////---------------------------------------------------------------------------------------------------------------------------------------------

//void setBestBird() {
//  float max = 0;
//  int maxIndex = 0;
//  for (int i = 0; i< birds.length; i++) {
//    if (birds[i].fitness > max) {
//      max = birds[i].fitness;
//      maxIndex = i;
//    }
//  }

//  bestBird = maxIndex;
  
//  }
//}
