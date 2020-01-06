import std;

void quicksort(T)(T ary)
{
    if (ary.length <= 1)
        return;
        
    long left, right = ary.length - 2;
    auto pivot = ary.length - 1;
    while (1)
    {
        while (left < pivot && ary[left] <= ary[pivot])
            left++;
        while (right > 0 && ary[right] >= ary[pivot])
            right--;
        if (left < right)
            swap(ary[left], ary[right]);
        else
            break;
    }
    swap(ary[left], ary[pivot]);
    quicksort(ary[0 .. left]);
    quicksort(ary[left .. $]);
}

void main()
{
    auto ary = readln.split().to!(long[]);
    ary.quicksort();
    ary.writeln();
}
