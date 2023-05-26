# Chapter 6. 흐름 제어

- 조건문 - 특정 조건에서 코드를 실행하거나 실행하지 않음
- 반복문 - 특정 명령어를 반복해서 실행함

❕스위프트의 흐름 제어 구문에서는 소괄호() 를 대부분 생략할 수 있고, 중괄호{}는 생략할 수 없다.

## 6.1 조건문

### 6.1.1 if 구문

❗️스위프트의 if 구문은 조건의 값이 꼭 Bool 타입이어야 한다.

```swift
let first: Int = 5
let second: Int = 7

if first > second {
		print("first > second")
} else if first < second {
		print("first < second")
} else {
		print("first == second")
}

// first < second
```

- else if는 몇 개가 이어져도 상관없으며 else 블록은 없어도 상관없다. 물론 else if도 생략 가능하다.
- if 뒤에 따라오는 조건수식을 소괄호로 감싸주는 것은 선택 사항이다.

### 6.1.2 switch 구문

- switch 구문도 소괄호()를 생략할 수 있다.
- break 사용은 선택 사항이다. 즉 case 내부의 코드를 모두 실행하면 break 없이도 switch 구문이 종료된다는 뜻이다.
- switch 구문의 case를 연속 실행하려면 `fallthrough` 키워드를 사용한다.
- C언어에서는 정수 타입만 들어갈 수 있었으나 스위프트에서는 switch 구문의 조건에 다양한 값이 들어갈 수 있다.
- 각 case에 들어갈 비교 값은 입력 값과 데이터 타입이 같아야 한다.
- 비교될 값이 명확히 한정적인 값(열거형 값 등)이 아닐 때는 default를 꼭 작성해줘야 한다.
- case에는 범위 연산자를 사용할 수도, where 절을 사용하여 조건을 확장할 수도 있다.

```swift
switch 입력 값 {
case 비교 값 1:
		실행 구문
case 비교 값 2:
		실행 구문
		// 이번 case를 마치고 switch 구문을 탈출하지 않는다. 아래 case로 넘어간다.
		fallthrough
case 비교 값 3, 비교 값 4, 비교 값 5: // 한 번에 여러 값과 비교할 수 있다.
		실행 구문
		break // break 키워드를 통한 종료는 선택 사항이다.
default:  // 한정된 범위가 명확지 않다면 default는 필수이다.
		실행 구문
}
```

- case에 범위 연산자를 사용할 수도 있다.

```swift
let integerValue: Int = 5

switch integerValue {
case 0:
		print("Value == zero")
case 1...10:
		print("Value == 1~10")
		fallthrough
case Int.min..<0, 101..<Int.max:
		print("Value < 0 or Value > 100")
		break
default:
		print("10 < Value <= 100")
}

// 결과
// Value == 1~10
// Value < 0 or Value > 100
```

- switch 구문의 입력 값으로 숫자 표현이 아닌 문자, 문자열, 열거형, 튜플, 범위, 패턴이 적용된 타입 등 다양한 타입의 값도 사용 가능하다.

```swift
// string

let stringValue: String = "Liam Neeson"

switch stringValue {
case "yagom":
		print("He is yagom")
case "Jay":
		print("He is Jay")
case "Jenny", "Joker", "Nova":
		print("He or She is \(stringValue)")
default:
		print("\(stringValue) said 'I don't know who you are'")
}

// Liam Neeson said 'I don't know who you are'
```

```swift
// tuple

typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("yagom", 99)

switch tupleValue {
case ("yagom", 99):
		print("정확히 맞췄습니다!")
default:
		print("누굴 찾나요?")
}

// 정확히 맞췄습니다!
```

- 와일드카드 식별자 _ 를 사용한 튜플 switch case 구성

```swift
typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("yagom", 99)

switch tupleValue {
case ("yagom", 50):
		print("정확히 맞췄습니다!")
case ("yagom", _):
		print("이름만 맞았습니다. 나이는 \(tupleValue.age)입니다.")
case (_, 99):
		print("나이만 맞았습니다. 이름은 \(tupleValue.name)입니다.")
default:
		print("누굴 찾나요?")
}

// 이름만 맞았습니다. 나이는 99입니다.
```

와일드카드 식별자를 사용하면 무시된 값을 직접 가져와야 하는 불편함도 생긴다. 그래서 미리 지정된 조건 값을 제외한 다른 값은 실행문 안으로 가져올 수 있다. 그때 let을 붙인 값 바인딩을 사용한다.

- 값 바인딩을 사용한 튜플 switch case 구성

```swift
typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("yagom", 99)

switch tupleValue {
case ("yagom", 50):
		print("정확히 맞췄습니다!")
case ("yagom", let age):
		print("이름만 맞았습니다. 나이는 \(age)입니다.")
case (let name, 99):
		print("나이만 맞았습니다. 이름은 \(name)입니다.")
default:
		print("누굴 찾나요?")
}

// 이름만 맞았습니다. 나이는 99입니다.
```

- where 키워드를 사용하여 case의 조건을 확장할 수 있다.

```swift
let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
case "사원" where 인턴인가 == true:
		print("인턴입니다.")
case "사원" where 연차 < 2 && 인턴인가 == false:
		print("신입사원입니다.")
case "사원" where 연차 > 5:
		print("연식 좀 된 사원입니다.")
case "사원":
		print("사원입니다.")
case "대리":
		print("대리입니다.")
default:
		print("사장입니까?")
}

// 신입사원입니다.
```

- 열거형을 입력 값으로 받는 switch 구문

열거형과 같이 한정된 범위의 값을 입력 값으로 받게 될 때 값에 대응하는 각 case를 구현한다면 default를 구현하지 않아도 된다. 만약 값에 대응하는 각 case를 구현하지 않는다면 default는 필수이다.

```swift
enum School {
		case primary, elementary, middle, high, college, university, graduate
}

let 최종학력: School = School.university

switch 최종학력 {
case .primary:
		print("최종학력은 유치원입니다.")
case .elementary:
		print("최종학력은 초등학교입니다.")
case .middle:
		print("최종학력은 중학교입니다.")
case .high:
		print("최종학력은 고등학교입니다.")
case .college, .university:
		print("최종학력은 대학(교)입니다.")
case .graduate:
		print("최종학력은 대학원입니다.")
}

// 최종학력은 대학(교)입니다.
```

**unknown**

- 열거형에 case가 추가될 가능성이 있다면 switch 구문에서는 어떻게 대비해야 할까?
- 나중에 열거형에 case를 추가하면 기존의 switch 구문은 컴파일 오류가 발생할 것이다. `unknown`이라는 속성은 이런 문제를 대처할 수 있도록 도와준다.

```swift
enum Menu {
		case chicken
		case pizza
}

let lunchMenu: Menu = .chicken

switch lunchMenu {
case .chicken:
		print("반반 무많이")
case .pizza:
		print("핫소스 많이 주세요")
case _: // case default: 와 같은 표현
		print("오늘 메뉴가 뭐죠?")
}
```

- Menu라는 열거형은 나중에 case를 추가할 것 같다는 예상을 했다. 그래서 마지막 case로 와일드카드 case(case_)를 미리 추가해뒀다. 그러면 나중에 Menu 열거형에 case를 추가해도 switch 구문에서 컴파일 오류가 발생하지 않을 것이다.
- 만약 Menu 열거형에 새로운 case를 추가했다고 생각해보자. 그리고 깜빡하고 switch 구문의 내부 코드는 수정하지 않았다면? 문법적으로는 오류가 없지만 논리적 오류가 발생할 수 있는 여지가 충분히 생긴다. 이런 문제를 방지하기 위해서 unknown 속성을 사용할 수 있다.

```swift
enum Menu {
		case chichken
		case pizza
		case hamburger
}

let lunchMenu: Menu = .chicken

switch lunchMenu {
case .chicken:
		print("반반 무많이")
case .pizza:
		print("핫소스 많이 주세요")
@unknown case _:
		print("오늘 메뉴가 뭐죠?")
}
```

- Menu 열거형에 hamburger case를 추가했고, case _: 앞에 unknown 속성을 붙여줬다. unknown 속성을 부여하면 case _에서 “Switch must be exhaustive” 라는 컴파일러 경고가 발생한다. 이와 같은 경고를 통해서 해당 switch 구문이 모든 case에 대응하지 않는다는 사실을 다시 상기할 수 있다.
- 이처럼 논리적인 오류에 대해 도움을 받을 수 있는 unknown 속성을 부여할 수 있는 case는 case _ 혹은 default case 뿐이다. 또, unknown 속성을 부여한 case는 switch 구문의 가장 마지막 case로 작성해야 한다.

## 6.2 반복문

: 같거나 비슷한 명령을 반복 실행할 때. 특히 배열과 같은 순서가 있는 데이터를 편리하게 처리할 수 있다.

### 6.2.1 for-in 구문

- for-in 반복 구문은 반복적인 데이터나 시퀀스를 다룰 때 많이 사용한다.

```swift
for 임시 상수 in 시퀀스 아이템 {
		실행 코드
}
```

```swift
for i in 0...5 {
		if i.isMultiple(of: 2) {
				print(i)
				continue // continue 키워드를 사용하면 바로 다음 시퀀스로 건너뛴다.
		}
		print("\(i) == 홀수")
}

// 0
// 1 == 홀수
// 2
// 3 == 홀수
// 4
// 5 == 홀수
```

❗️for 문에서 숫자를 역순으로 돌리려면 `stride(from:to:by:)` 프로토콜을 사용하자!

**stride 프로토콜**

```swift
for i in stride(from: 3, to: 12, by: 3) {
		print(i)
}
// 3, 6, 9

for i in stride(from: 3, through: 12, by: 3) {
		print(i)
}
// 3, 6, 9, 12
```

```swift
// 역순

for index in stride(from: 5, to: 1, by: -1) {
		print(index)
}
// 5, 4, 3, 2

for index in stride(from: 5, through: 1, by: -1) {
		print(index)
}
// 5, 4, 3, 2, 1
```

- 와일드카드 식별자(_) 사용

```swift
// 시퀀스에 해당하는 값이 필요 없다면 와일드카드 식별자(_)를 사용하면 된다.
for _ in 1...3 {
		result *= 10
}

print("10의 3제곱은 \(result)입니다.")

// 10의 3제곱은 1000입니다.
```

- for-in 구문은 스위프트의 기본 **컬렉션 타입**에서도 유용하게 사용할 수 있다. 딕셔너리는 넘겨받는 값의 타입이 튜플로 지정되어 넘어온다.

```swift
// Dictionary
let friends: [String: Int] = ["Jay": 35, "Joe": 29, "Jenny": 31]

for tuple in friends {
		print(tuple)
}

// ("Joe", 29)
// ("Jay", 35)
// ("Jenny", 31)

let 주소: [String: String] =
		["도": "충청북도", "시군구": "청주시 청원구", "동읍면": "율량동"]

for (키, 값) in 주소 {
		print("\(키) : \(값)")
}

// 도 : 충청북도
// 동읍면 : 율량동
// 시군구 : 청주시 청원구
```

```swift
// Set
let 지역번호: Set<String> = ["02", "031", "032", "033", "041", "042", "043", "051", "052", "053", "054", "055", "061", "062", "063", "064"]

for 번호 in 지역번호 {
		print(번호)
}

// 02
// 031
// 032
// ...
```

### 6.2.2 while 구문

: 특정 조건(Bool 타입으로 지정되어야 함)이 성립하는 한 블록 내부의 코드를 반복 실행한다.

- for-in 구문과 마찬가지로 continue, break 등의 제어 키워드 사용이 가능하다.

```swift
var names: [String] = ["Joker", "Jenny", "Nova", "yagom"]

while names.isEmpty == false {
        print("Good bye \(names.removeFirst())")
        // removeFirst()는 요소를 삭제함과 동시에 삭제한 요소를 반환한다.
}

// Good bye Joker
// Good bye Jenny
// Good bye Nova
// Good bye yagom
```

### 6.2.3 repeat-while 구문

: repeat 블록의 코드를 최초 1회 실행한 후, while 다음의 조건이 성립하면 블록 내부의 코드를 반복 실행한다.

- 다른 프로그래밍 언어의 do-while 구문과 크게 다르지 않다.

```swift
var names: [String] = ["John", "Jenny", "Joe", "yagom"]

repeat {
        print("Good bye \(names.removeFirst())")
} while names.isEmpty == false

// Good bye John
// Good bye Jenny
// Good bye Joe
// Good bye yagom
```

## 6.3 구문 이름표

- 반복문을 중첩으로 작성하게 될 때 반복문을 제어하는 키워드(break, continue 등)가 어떤 범위에 적용되어야 하는지 애매하거나 큰 범위의 반목문을 종료하고 싶은데 작은 범위의 반복문만 종료되는 등 예상치 못한 실수를 할 수도 있다.
- 그럴 때 반복문 앞에 이름과 함께 콜론을 붙여 구문의 이름을 지정해주는 **구문 이름표**를 사용하면 좋다!
- 이름이 지정된 구문을 제어하고자 할 때는 제어 키워드와 구문 이름을 함께 써주면 된다.

```swift
var numbers: [Int] = [3, 2342, 6, 3252]

numbersLoop: for num in numbers {
        if num > 5 || num < 1 {
                continue numbersLoop
        }
        
        var count: Int = 0

        printLoop: while true {
    
                print(num)
                count += 1

                if count == num {
                        break printLoop
                }
        }

        removeLoop: while true {
                if numbers.first != num {
                        break numbersLoop
                }
                numbers.removeFirst()
        }
}

// 3
// 3
// 3
// numbers에는 [2342, 6, 3252]가 남는다.
```
