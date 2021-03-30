#define ZERO 0

    unsigned  gcd(   unsigned   int  // Euclids algorithm
      x,unsigned   y) {   while ( /* hello */  x>   ZERO
   ){unsigned temp=y;x=y   %x;y  = temp ;}return y ;}

 int main(){
	return gcd(6,12);
}
