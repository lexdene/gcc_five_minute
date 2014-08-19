#include <iostream>

using namespace std;

// #define __DEBUG__

void output(int a){
#ifdef __DEBUG__
	cerr<<"this is debug infor : "<<__FUNCTION__<<' '<<a<<endl;
#endif
	cout<<a<<endl;
}

int main(){
	output(10);
	return 0;
}
