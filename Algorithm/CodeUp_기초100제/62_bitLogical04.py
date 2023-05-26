# 입력된 정수 두 개를 비트단위로 xor 연산한 후 그 결과를 정수로 출력해보자. 
# 비트단위(bitwise) 연산자 ^(xor, circumflex/caret, 서컴플렉스/카릿)를 사용하면 된다.

# ** 주의 ^은 수학식에서 거듭제곱(power)을 나타내는 기호와 모양은 같지만,
# C언어에서는 전혀 다른 배타적 논리합(xor, 서로 다를 때 1)의 의미를 가진다.


a, b = input().split()
a = int(a)
b = int(b)
print(a^b)