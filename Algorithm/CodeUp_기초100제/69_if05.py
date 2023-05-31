# 평가를 문자(A, B, C, D, ...)로 입력받아 내용을 다르게 출력해보자. 

grade = input()
grade = str(grade)

if grade == "A":
    print("best!!!")
elif grade == "B":
    print("good!!")
elif grade == "C":
    print("run!")
elif grade == "D":
    print("slowly~")
else:
    print("what?")