# 입력된 정수 두 개를 비트단위로 and 연산한 후 그 결과를 정수로 출력해보자. 
# 비트단위(bitwise)연산자 &를 사용하면 된다.(and, ampersand, 앰퍼센드라고 읽는다.)

# ** 비트단위(bitwise)연산자는,
# ~(bitwise not), &(bitwise and), |(bitwise or), ^(bitwise xor),
# <<(bitwise left shift), >>(bitwise right shift)
# 가 있다.

# 예를 들어 3과 5가 입력되었을 때를 살펴보면
# 3       : 00000000 00000000 00000000 00000011
# 5       : 00000000 00000000 00000000 00000101
# 3 & 5 : 00000000 00000000 00000000 00000001
# 이 된다.


a, b = input().split()
a = int(a)
b = int(b)

print(a & b)