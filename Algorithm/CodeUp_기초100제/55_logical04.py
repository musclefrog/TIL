# 2개의 정수값이 입력될 때, 
# 그 불 값이 하나라도 True 일 때에 True 를 출력하는 프로그램을 작성해보자.

# 참고
# or 예약어는 주어진 두 불 값 중에서 하나라도 True 이면 True 로 계산하고, 나머지 경우는 False 로 계산한다.
# 이러한 논리연산을 OR 연산(boolean OR)이라고도 부르고, + 로 표시하거나, 집합 기호 ∪(합집합, union)로 표시하기도 한다. 
# 모두 같은 의미이다. 

a, b = input().split()
print(bool(int(a)) or bool(int(b)))