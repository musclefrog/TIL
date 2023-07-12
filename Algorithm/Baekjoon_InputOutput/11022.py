n = int(input())

for i in range(n):
    x, y = input().split()
    x = int(x)
    y = int(y)
    sum = x + y
    
    print("Case #%d:"%(i+1), "%d"%x, "+ %d"%y, "= %d"%sum)