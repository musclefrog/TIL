# 정수가 입력되었을 때, True/False 로 평가해주는 프로그램을 작성해보자. 

# 참고 
# bool( ) 을 이용하면 입력된 식이나 값을 평가해 불 형의 값(True 또는 False)을 출력해준다.
# 식이나 값을 계산해서 결과값이 만들어지는 것을 평가(evaluate)라고 한다. 

# python 언어에서 정수값 0은 False(거짓)로 평가되고, 그 외의 값들은 모두 True(참)로 평가된다. 

n = input()
n = int(n)
print(bool(n))