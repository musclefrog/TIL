# 월이 입력될 때 계절 이름이 출력되도록 해보자. 

month = int(input())

if month // 3 == 0:
    print("winter")
elif month // 3 == 1:
    print("spring")
elif month // 3 == 2:
    print("summer")
elif month // 3 == 3:
    print("fall")
elif month // 3 == 4:
    print("winter")