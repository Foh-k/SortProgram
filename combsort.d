import std;
enum DIV = 1.3;
void main()
{
    auto ary = readln.split().to!(long[]);
    auto h = (ary.length / DIV).floor.to!(long);
    while(1)
    {
        long flag;
        foreach (i; iota(ary.length - h))
        {
            if(ary[i] > ary[i + h])
                swap(ary[i], ary[i + h]), flag++;
        }
        if(h == 1)
        {
            if(!flag)
                break;
        }
        else
        {
            h /= DIV;
        }
    }
    ary.writeln();
}