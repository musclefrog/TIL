# Quarter = 25센트
# Dime = 10센트
# Nickel = 5센트
# Penny = 1센트

# 124센트의 경우
# 124/25 = 4 이므로 4쿼터
# 124%25 = 24이고 24/10 = 2이므로 2다임
# 24%10 = 4이고 4%5 = 0이므로 0니켈
# 4/1 = 4이므로 4페니

n = int(input())

for i in range(n):
    change = int(input())
    
    quarter = int(change / 25)
    dime = int(change % 25 / 10)
    nickel = int(change % 25 % 10 / 5)
    penny = int(change % 25 % 10 % 5 / 1)
    
    print(quarter, dime, nickel, penny)

