//g++ -Wuninitialized uninitialized.cpp
int fun(){
    int a;
    return a;
}
int main(){
    fun();
}
