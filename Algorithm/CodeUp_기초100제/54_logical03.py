# 2개의 정수값이 입력될 때, 
# 그 불 값이 모두 True 일 때에만 True 를 출력하는 프로그램을 작성해보자. 

# 참고
# and 예약어는 주어진 두 불 값이 모두 True 일 때에만 True 로 계산하고, 나머지 경우는 False 로 계산한다.
# 이러한 논리연산을 AND 연산(boolean AND)이라고도 부르고, · 으로 표시하거나 생략하며, 집합 기호 ∩(교집합, intersection)로 표시하기도 한다.  
# 모두 같은 의미이다. 

a, b = input().split()
print(bool(int(a)) and bool(int(b)))