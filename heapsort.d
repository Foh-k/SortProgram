import std;

class Heap
{
    private const ulong capacity = 100_000;
    private long[] heap;
    private ulong begin, end;
    this()
    {
        this.heap = new long[](this.capacity);
        this.begin = this.end = 1;
    }

    this(long[] ary)
    {
        this.heap = new long[](this.capacity);
        this.begin = this.end = 1;
        foreach (e; ary)
            this.insert(e);
    }

    public void insert(long num)
    {
        assert(this.end < this.capacity);

        this.heap[end] = num;
        long iter = this.end;
        while (iter > 1 && this.heap[iter] > this.heap[iter / 2])
        {
            swap(this.heap[iter], this.heap[iter / 2]);
            iter /= 2;
        }
        this.end++;
    }

    public void insert(long[] num)
    {
        foreach (e; num)
            this.insert(e);
    }

    public void removeFront()
    {
        assert(!this.heap.empty);

        swap(this.heap[this.begin], this.heap[this.end]);
        long iter = this.begin;
        this.end--;
        while (iter < this.end)
        {
            auto right = min(2 * iter, end);
            auto left = min(2 * iter + 1, end);
            auto maxidx = this.heap[right] > this.heap[left] ? right : left;
            if (this.heap[iter] < heap[maxidx])
                swap(heap[iter], heap[maxidx]);
            else
                break;

            iter = maxidx;
        }
    }

    public void removeBack()
    {
        assert(!this.heap.empty);

        this.end--;
    }

    long popFront()
    {
        assert(!this.heap.empty);

        auto ret = this.heap[this.begin];
        this.removeFront();
        return ret;
    }

    long popBack()
    {
        assert(!this.heap.empty);

        auto ret = this.heap[end];
        this.removeBack();
        return ret;
    }

    public void writeheap()
    {
        writeln(this.heap[1 .. end]);
    }
}

void main()
{
    auto ary = readln.split.to!(long[]);
    auto a = new Heap(ary);
    a.writeheap();
    foreach (_; iota(ary.length))
        a.popFront.writeln();
}
