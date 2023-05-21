# 정수 2개(a, b) 를 입력받아 a를 b로 나눈 나머지를 출력해보자. 

# 참고
# python 언어에서는 나눈 나머지를 계산하는 연산자(%, remainder)를 제공한다.

a, b = input().split()
c = int(a) % int(b)
print(c)