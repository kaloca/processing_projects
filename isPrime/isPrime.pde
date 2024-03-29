boolean isPrime(int n){
    //Returns True if n is prime.//
    if (n == 2)
        return true;
    if (n == 3)
        return true;
    if (n % 2 == 0)
        return false;
    if (n % 3 == 0)
        return false;

    int i = 5;
    int w = 2;

    while (i * i <= n){
        if (n % i == 0)
            return false;

        i += w;
        w = 6 - w;
    }
    
    return true;
}
