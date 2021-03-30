
    unsigned  gcd(   unsigned   int  // Euclids algorithm
      x,unsigned   y) {
   	while ( /* hello */  x != y ){
		if (x < y)
		 y = y -x ;
		else
		 x = x -y;
	}
	return y ;
	}


 int main(){
	return gcd(6,12);
}
