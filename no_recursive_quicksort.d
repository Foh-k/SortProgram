import std;

// 半開区間
alias Range = Tuple!(long, "begin", long, "end");

void quicksort(T)(T ary)
{
    auto stack = DList!(Range)();
    stack.insertBack(Range(0, ary.length));
    while (!stack.empty)
    {
        auto r = stack.front();
        stack.removeFront();
        if (abs(r.end - r.begin) <= 1)
            continue;

        auto left = r.begin, right = r.end - 2, pivot = r.end - 1;
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
        stack.insertBack(Range(r.begin, left));
        stack.insertBack(Range(left, r.end));
    }
}

void main()
{
    auto ary = readln.split().to!(long[]);
    ary.quicksort();
    ary.writeln();
}
