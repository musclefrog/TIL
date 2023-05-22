# Chapter 5. 연산자

## 5.1 연산자의 종류

### 5.1.1 할당(대입) 연산자

- `A = B`

A에 B의 값을 할당한다. 서로 다른 데이터 타입이라면 오류 발생!

### 5.1.2 산술 연산자

- `A + B` 더하기
- `A - B` 빼기
- `A * B` 곱하기
- `A / B` 나누기
- `A % B` 나머지

### 5.1.3 비교 연산자

- `A == B` 값이 같다.
- `A >= B` 값이 크거나 같다.
- `A <= B` 값이 작거나 같다.
- `A > B` 값이 크다.
- `A < B` 값이 작다.
- `A != B` 값이 같지 않다.
- `A === B` 참조가 같다.
    - 클래스의 인스턴스인 경우에 사용함.
- `A !== B` 참조가 같지 않다.
    - A와 B가 참조(레퍼런스) 타입일 때 A와 B가 같은/같지 않은 인스턴스를 가리키는지 비교함.
- `A ~= B` 패턴 매치
    - A와 B의 패턴이 매치되는지 확인함.

### 5.1.4 삼항 조건 연산자

`Question ? A : B` Question(불리언 값)이 참이면 A, 거짓이면 B 반환

### 5.1.5 범위 연산자

값(수)의 범위를 나타내고자 할 때 사용한다.

- 폐쇄 범위 연산자 `A...B` : A부터 B까지의 수
- 반폐쇄 범위 연산자 `A..<B` : A부터 B 미만까지의 수
- 단방향 범위 연산자
    - `A...` : A 이상의 수
    - `...A` : A 이하의 수
    - `..<A` : A 미만의 수
    

### 5.1.6 부울 연산자

- NOT(부정) 부울 연산자 `!B`
- AND 부울 연산자 `A && B`
- OR 부울 연산자 `A || B`

### 5.1.7 비트 연산자

- NOT(부정) 비트 연산자 `~A`
- AND 비트 연산자 `A & B`
- OR 비트 연산자 `A | B`
- XOR 비트 연산자 `A ^ B`
- 비트 이동 연산자(시프트 연산자) `A >> B` `A << B` : A의 비트를 B만큼 비트를 시프트(이동)한다.
    
    👀 4 << 1 은 4(0100(2))를 왼쪽으로 1 시프트 연산을 했기 때문에 결과는 8(1000(2))이 된다. 
    
    👀 시프트 한 후 빈 자리는 0으로 채워진다. 반대로 시프트 연산을 하면서 비트 범위를 벗어난 비트는 버려진다. 만약 7(0111(2))를 오른쪽 2 시프트 연산을 하면, 결과는 1(0001(2))이 된다.


### 5.1.8 복합 할당 연산자

할당 연산자와 다른 연산자가 하는 일을 한 번에 할 수 있도록 결합한 연산자.

- `A += B` A = A + B
- `A -= B` A = A - B
- `A *= B` A = A * B
- `A /= B` A = A / B
- `A %= B` A = A % B
- `A <<= N` A = A << N
- `A >>= N` A = A >> N
- `A &= B` A = A & B (AND 연산)
- `A |= B` A = A | B (OR 연산)
- `A ^= B` A = A ^ B (XOR 연산)

### 5.1.9 오버플로 연산자

기존 프로그래밍 언어에서는 오버플로(or 언더플로) 가능성이 있는 연산에 대해서는 따로 오버플로에 대한 추가 알고리즘 및 로직 등을 설계하는 것이 일반적이었으나 스위프트에서는 오버플로 연산자를 사용하면 오버플로를 자동으로 처리할 수 있다.

- `&+` 오버플로에 대비한 덧셈 연산을 한다.
- `&-` 오버플로에 대비한 뺄셈 연산을 한다.
- `&*` 오버플로에 대비한 곱셈 연산을 한다.

예를 들어 UInt8 타입은 8비트 정수 타입으로 부호가 없는 양의 정수만을 표현하기 때문에 0 아래로 내려가는 계산을 하면 런타임 오류가 발생한다. 그렇지만 오버플로 빼기 연산을 사용하면 오류 없이 오버플로 처리를 해준다.

```swift
var unsignedInteger: UInt8 = 0
let errorUnderflowResult: UInt8 = unsignedInteger - 1 // 런타임 오류
let underflowedValue: UInt8 = unsignedInteger &- 1 // 255

unsignedInteger = UInt8.max // 255
let errorOverflowResult: UInt8 = unsignedInteger + 1 // 런타임 오류
let overflowedValue: UInt8 = unsignedInteger &+ 1 // 0
```

### 5.1.10 기타 연산자

- `A ?? B` nil 병합 연산자: A가 nil이 아니면 A를 반환하고, A가 nil이면 B를 반환한다.
- `-A` 부호변경 연산자: A(수)의 부호를 변경한다.
- `O!` 옵셔널 강제 추출 연산자: O(옵셔널 개체)의 값을 강제로 추출한다.
- `V?` 옵셔널 연산자: V(옵셔널 값)을 안전하게 추출하거나, V(데이터 타입)가 옵셔널임을 표현한다.

❕nil 병합 연산자는 옵셔널을 사용할 때 아주 안전하고 간단한 방법이다.

```swift
let valueInt: Int = someOptionalInt != nil ? someOptionalInt! : 0
```

```swift
// 위 코드와 같은 결과를 볼 수 있지만 훨씬 안전하게 옵셔널을 다룰 수 있다.
let valueInt: Int = someOptionalInt ?? 0
```

⚠️ 참고로 옵셔널 강제 추출 연산자 사용은 지양하는 편이 좋다.

## 5.2 연산자 우선순위와 결합방향

스위프트 표준 라이브러리의 연산자 정의를 참고하면 기본 연산자들의 우선도와 결합방향을 알아볼 수 있다.

**스위프트 표준 라이브러리의 연산자 우선순위 그룹 우선순위별 정렬(높은 순)**

- DefaultPrecedence
- BitwiseShiftPrecedence
- MultiplicationPrecedence
- AdditionPrecedence
- RangeFormationPrecedence
- CastingPrecedence
- ComparisonPrecedence
- LogicalConjunctionPrecedence
- LogicalDisjunctionPrecedence
- TernaryPrecedence
- AssignmentPrecedence
- FunctionArrowPrecedence

```swift
let intValue: Int = 1
let resultValue1: Int = intValue << 3 + 5 // 8 + 5 => 13
let resultValue2: Int = 1 * 3 + 5 // 3 + 5 >= 8
```

<< 연산은 BitwiseShiftPrecedence, + 연산은 AdditionPrecedence 연산자 우선순위 그룹을 우선순위로 가진다. 따라서 << 연산이 + 연산보다 먼저 실행된다.

* 연산은 MultiplicationPrecedence이므로 + 연산보다 먼저 실행된다.

## 5.3 사용자 정의 연산자

전위 연산자(prefix) `!A`

중위 연산자(infix) `A + B`

후위 연산자(postfix) `O!`

operator: 연산자

associativity: 연산자 결합방향

precedence: 우선순위

- 사용자 정의 연산자는 아스키 문자 /, =, -, +, !, *, <, >, &, |, ^, ?, ~를 결합해서 사용한다.
- 마침표(.)를 사용자 정의 연산자에 사용할 수 있다. 연산자를 표현하는 문자 중 맨 처음의 문자가 마침표일 때만 연산자에 포함된 마침표가 연산자로 인식된다. `.+.` 이런식으로 사용 가능
- 물음표(?)도 사용자 정의 연산자에 포함시킬 수 있지만 물음표 자체만으로는 사용자 정의 연산자를 정의할 수 없다. 더불어 사용자 정의 연산자에 느낌표(!)도 같은 조건으로 포함시킬 수 있다. 단, 전위 연산자는 물음표나 느낌표로 시작하는 사용자 정의 연산자를 정의할 수 없다.
- 토큰으로 사용되는 =, ->, // , /*, */, .과 전위 연산자 <, &, ?, 중위 연산자 ?, 후위 연산자 >, !, ? 등은 이미 스위프트에서 예약한 상태이기 때문에 재정의할 수 없으며 사용자 정의 연산자로 사용될 수도 없다.

### 5.3.1 전위 연산자 정의와 구현

Int 타입의 제곱을 구하는 연산자로 **을 전위 연산자로 사용하려 한다.

```swift
prefix operator ** // 전위 연산자 정의

// 어떤 데이터 타입에 이 연산자가 동작할 것인지 함수를 구현한다.
// 전위 연산자 함수를 구현할 때는 함수 func 키워드 앞에 prefix 키워드를 추가해준다.

prefix func ** (value: Int) -> Int {
        return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive) // 25
```

스위프트 표준 라이브러리에 존재하는 전위 연산자에 기능을 추가할 때는 따로 연산자를 정의하지 않고 함수만 중복 정의하면 된다.

기존에 존재하는 전위 연산자 중 정수에 사용되는 느낌표(!)를 문자열에도 사용하고자 한다. 문자열 앞에 사용하면 문자열이 비어있는지 확인하는 연산자로 사용하기 위해 함수를 중복 정의해보자.

```swift
prefix func ! (value: String) -> Bool {
        return value.isEmpty
}

var stringValue: String = "yagom"
var isEmptyString: Bool = !stringValue

print(isEmptyString) // false

stringValue = ""
isEmptyString = !stringValue

print(isEmptyString) // true
```

앞서 만들어주었던 ** 연산자를 String 타입에서도 동작할 수 있도록 중복 정의해보자.

```swift
prefix operator **

prefix func ** (value: String) -> String {
        return value + " " + value
}

let resultString: String = **"yagom"

print(resultString) // yagom yagom
```

### 5.3.2 후위 연산자 정의와 구현

정수 타입의 값 뒤에 **를 붙이면 10을 더해주는 연산을 구현해보자.

```swift
postfix operator **

postfix func ** (value: Int) -> Int {
        return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five**

print(fivePlusTen) // 15
```

❗️**하나의 피연산자에 전위 연산과 후위 연산을 한 줄에 사용하게 되면 후위 연산을 먼저 수행한다.**

```swift
prefix operator **
postfix operator **

prefix func ** (value: Int) -> Int {
        return value * value
}

postfix func ** (value: Int) -> Int {
        return value + 10
}

let five: Int = 5
let sqrtFivePlusTen: Int = **five**

print(sqrtFivePlusTen) // (10 + 5) * (10 + 5) == 225
```

### 5.3.3 중위 연산자 정의와 구현

중위 연산자는 우선순위 그룹을 명시해줄 수 있다. 연산자 우선순위 그룹은 precedencegroup 뒤에 그룹 이름을 써주어 정의할 수 있다.

```swift
precedencegroup 우선순위 그룹 이름 {
        higherThan: 더 낮은 우선순위 그룹 이름
        lowerThan: 더 높은 우선순위 그룹 이름
        associativity: 결합방향(left / right / none)
        assignment: 할당방향 사용(true / false)
}
```

- higherThan과 lowerThan을 통해 기존의 우선순위 그룹과 새로 만들어줄 우선순위 그룹과의 상하관계를 설정해줄 수 있다.
- associativity로 결합방향을 명시해줄 수 있다. default는 none이다. 결합방향이 없는 연산자는 여러 번 연달아 사용할 수 없다. 결합방향이 있는 +, - 연산자는 1 + 2 - 3처럼 사용할 수 있다. 그러나 결합방향이 없는 부등호 연산자(<)의 경우에는 연달아 사용해줄 수 없다. 1 < 2 < 3과 같은 모양으로 사용할 수 없다는 뜻이다.
- assignment는 연산자가 옵셔널 체이닝을 포함한 연산에 포함되어 있을 경우 연산자의 우선순위를 지정한다. true로 설정해주면 해당 우선순위 그룹에 해당하는 연산자는 옵셔널 체이닝을 할 때 표준 라이브러리의 할당 연산자와 동일한 결합방향 규칙을 사용한다. 즉, 스위프트의 할당 연산자는 오른쪽 결합을 사용하므로 assignment를 true로 설정하면 연산자를 사용하여 옵셔널 체이닝을 할 때 오른쪽부터 체이닝이 시작된다는 뜻이다. 그렇지 않고 false를 설정하거나 assignment를 따로 명시해주지 않으면 해당 우선순위 그룹에 해당하는 연산자는 할당을 하지 않는 연산자와 같은 옵셔널 체이닝 규칙을 따른다. 즉, 연산자에 옵셔널 체이닝 기능이 포함되어 있다면 왼쪽부터 옵셔널 체이닝을 하게 된다.

❗️**만약, 중위 연산자를 정의할 때 우선순위 그룹을 명시해주지 않는다면 우선순위가 가장 높은 DefaultPrecedence 그룹을 우선순위 그룹으로 갖게 된다.**

**를 중위 연산자로 사용하기 위해 정의해보자. ** 연산자는 MultiplicationPrecedence 연산자 우선순위 그룹에 속하게 된다.

**만약 MultiplicationPrecedence라고 명시해주지 않는다면 DefaultPrecedence 그룹으로 자동 지정된다.**

```swift
infix operator ** : MultiplicationPrecedence
```

문자열과 문자열 사이에 ** 연산자를 사용하면 뒤에 오는 문자열이 앞의 문자열 안에 속해 있는지 확인하는 연산을 실행하도록 구현해보자. (중위 연산자 구현 함수에는 따로 키워드를 추가하지 않는다.)

```swift
// String 타입의 contains(_:) 메서드를 사용하기 위해 Foundation 프레임워크를 임포트한다.

import Foundation

infix operator ** : MultiplicationPrecedence

func ** (lhs: String, rhs: String) -> Bool {
        return lhs.contains(rhs)
}

let helloYagom: String = "Hello yagom"
let yagom: String = "yagom"
let isContainsYagom: Bool = helloYagom ** yagom // true
```

특정 타입에 국한된 연산자 함수라면 그 타입 내부에 구현되는 것이 읽고 이해하기에 더욱 쉽다. 그래서 타입 내부에 타입 메서드로 구현할 수도 있다.

```swift
// 타입 메서드로 구현된 사용자 정의 비교 연산자

class Car {
        var modelYear: Int? // 연식
        var modelName: String? // 모델 이름

        // Car 클래스의 인스턴스끼리 == 연산했을 때 modelName이 같다면 true를 반환
        static func == (lhs: Car, rhs: Car) -> Bool {
                return lhs.modelName == rhs.modelName
        }
}

struct SmartPhone {
        var company: String? // 제조사
        var model: String? // 모델
        
        // SmartPhone 구조체의 인스턴스끼리 == 연산했을 때 model이 같다면 true를 반환
        static func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
                return lhs.model == rhs.model
        }
}
```

타입 메서드로 구현한 사용자 정의 연산자는 각 타입의 익스텐션으로 구현해도 된다.

👀 사용자 정의 연산자는 굉장히 강력한 무기가 될 수 있다. 복잡한 연산을 하나의 특수문자로 구현한다면 일반 함수만으로 기능을 실행하는 것보다 훨씬 강력할 것이다!!
