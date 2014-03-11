int createNum();
void putNum(int a);
int sum(int a,int b)
{
    return a+b;
}
int main()
{
    int x=createNum();
    int y=createNum();
    int z=sum(x,y);
    putNum( z );
    return 0;
}
