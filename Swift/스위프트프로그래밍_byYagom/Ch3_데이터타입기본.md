# Chapter 3. 데이터 타입 기본

스위프트에서 기본으로 제공하는 데이터 타입에 대해 알아보자.

❗️스위프트의 모든 데이터 타입 이름은 **대문자 카멜케이스**를 사용한다.

## 3.1 Int와 UInt

: 정수 타입

- Int: +, - 부호를 포함한 정수
- UInt: - 부호를 포함하지 않는 0을 포함한 양의 정수
    - 스위프트는 데이터 타입에 굉장히 엄격하다. 같은 정수라 하더라고 Int와 UInt를 완전히 다른 타입으로 인식하기 때문에 두 타입을 모두 사용하면 정수 타입의 변수끼리도 값을 교환할 때 많은 자원을 소모할 수도 있다.
- 각 진수에 따라 정수를 표현하는 방법
    - 2진수: 접두어 0b를 사용하여 표현
    - 8진수: 접두어 0o를 사용하여 표현
    - 16진수: 접두어 0x를 사용하여 표현
    
    ```swift
    let decimalInteger: Int = 28
    let binaryInteger: Int = 0b11100 // 28
    let octalInteger: Int = 0o34 // 28
    let hexadecimalInteger: Int = 0x1C // 28
    ```
    

## 3.2 Bool

: 불리언 타입. 참(true) / 거짓(false)

```swift
var boolean: Bool = true
boolean.toggle() // true - false 반전
let iLoveYou: Bool = true
let isTimeUnlimited: Bool = false
print("시간은 무한합니까?: \(isTimeUnlimited)")
```

## 3.3 Float과 Double

: 부동소수점을 사용하는 실수. 부동소수 타입. 

- 정수 타입보다 훨씬 넓은 범위의 수를 표현할 수 있다.
- Double - 64비트의 부동소수 표현 / 최소 15자리의 십진수 표현
- Float - 32비트의 부동소수 표현 / 6자리의 십진수 표현
- Double과 Float 중 무엇을 사용할지 잘 모르는 상황이라면 Double을 사용해라!

```swift
// Float이 수용할 수 있는 범위를 넘어선다.
// 자신이 감당할 수 있는 만큼만 남기므로 정확도가 떨어진다.
var floatValue: Float = 1234567890.1

// Double은 충분히 수용할 수 있다.
let doubleValue: Double = 1234567890.1

print("floatValue: \(floatValue) doubleValue : \(doubleValue)")

// Float이 수용할 수 있는 범위의 수로 변경한다.
floatValue = 123456.1

// 문자열 보간법을 사용하지 않고 단순히 변수 또는 상수의 값만 보고 싶으면
// print 함수의 전달인자로 변수 또는 상수를 전달하면 된다.
print(floatValue)
```

💁🏻 임의의 수 만들기 `random(in: )`

```swift
Int.random(in: -100...100)
UInt.random(in: 1...30)
Double.random(in: 1.5...4.3)
Float.random(in: -0.5...1.5)
```

## 3.4 Character

: 문자

- 값의 앞뒤에 큰따옴표를 사용하여 표현

```swift
let alphabetA: Character = "A"
print(alphabetA)
```

## 3.5 String

: 문자열

- 값의 앞뒤에 큰따옴표를 사용하여 표현

```swift
// 상수로 선언된 문자열은 변경이 불가능
let name: String = "Suin"

// 이니셜라이저를 사용하여 빈 문자열을 생성할 수 있다.
// var 키워드를 사용하여 변수를 생성했으므로 문자열의 수정 및 변경이 가능하다.
var introduce: String = String()

// append() 메서드를 사용하여 문자열을 이어붙일 수 있다.
introduce.append("제 이름은")

// + 연산자를 통해서도 문자열을 이어붙일 수 있다.
introduce = introduce + " " + name + "입니다."
print(introduce)

// name에 해당하는 문자의 수를 셀 수 있다.
print("name의 글자 수: \(name.count)")

// 빈 문자열인지 확인해볼 수 있다.
print("introduce가 비어있습니까? \(introduce.isEmpty)")

// 유니코드의 스칼라값을 사용하면 값에 해당하는 표현이 출력된다.
let unicodeScalarValue: String = "\u{2665}"
```

- String 타입의 다양한 기능

```swift
// 연산자를 통한 문자열 결합
let hello: String = "Hello"
let suin: String = "suin"
var greeting: String = hello + " " + suin + "!"
print(greeting) // Hello suin!

greeting = hello
greeting += " "
greeting += suin
print(greeting) // Hello suin!

// 연산자를 통한 문자열 비교
var isSameString: Bool = false

isSameString = hello == "Hello"
print(isSameString) // true

isSameString = hello == "hello"
print(isSameString) // false

// 메서드를 통한 접두어, 접미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix) // true

hasPrefix = hello.hasPrefix("HE")
print(hasPrefix) // false

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
print(hasSuffix) // false

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix) // true

// 메서드를 통한 대소문자 변환
var convertedString: String = ""
convertedString = hello.uppercased()
print(convertedString) // HELLO

convertedString = hello.lowercased()
print(convertedString) // hello

// 프로퍼티를 통한 빈 문자열 확인
var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString) // false

greeting = ""
isEmptyString = greeting.isEmpty
print(isEmptyString) // true

// 프로퍼티를 이용해 문자열 길이 확인
print(greeting.count) // 0

greeting = "안녕하세요"
print(greeting.count) // 5

greeting = "안녕!"
print(greeting.count) // 3

// 여러 줄의 문자열 쓰기
greeting = """
안녕하세요 
저는 
OO입니다.
"""
```

### 3.5.1 특수문자

: 문자열 내에서 일정 기능을 한다. (=제어문자)

- 백슬래시(\)에 특정한 문자를 조합하여 사용
- 스위프트에서 많이 사용하는 특수문자
    - `\n` : 줄바꿈 문자
    - `\\` : 문자열 내에서 백슬래시를 표현하고자 할 때
    - `\”`: 문자열 내에서 큰따옴표를 표현하고자 할 때
    - `\t` : 탭 문자. 키보드의 탭키를 눌렀을 때와 같은 효과
    - `\0`: 문자열이 끝났음을 알리는 null 문자
    

## 3.6 Any, AnyObject와 nil

- Any: 스위프트의 모든 데이터 타입을 사용할 수 있다는 뜻
- AnyObject: Any보다는 조금 한정된 의미로 클래스의 인스턴스만 할당할 수 있음

```swift
var someVar: Any = "Suin" // Any로 선언된 변수에는 문자열도
someVar = 50 // 정수도
someVar = 100.1 // 실수, 또는 어떤 타입의 값이라도 할당할 수 있다 !!
```

⚠️ Any와 AnyObject는 될 수 있으면 사용하지 않는 편이 좋다. 타입에 엄격한 스위프트 특성상 매번 타입 확인 및 변환을 해줘야 하는 불편함이 있을뿐더러 예기치 못한 오류의 위험을 증가시키기 때문이다.

- nil: 특정 타입이 아니라 ‘없음’을 나타내는 스위프트의 키워드. 변수 또는 상수에 값이 들어있지 않고 비어있음을 나타내는 데 사용.