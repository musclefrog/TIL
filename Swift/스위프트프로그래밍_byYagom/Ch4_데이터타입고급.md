# Chapter 4. 데이터 타입 고급

## 4.1 데이터 타입 안심

스위프트의 특징 중 **안정성(safe)**이 가장 뚜렷하게 나타나는 부분

### 4.1.1 데이터 타입 안심이란

- 스위프트는 데이터 타입을 안심하고 사용할 수 있는(Type-safe) 언어이다.
- 스위프트는 Int 타입 변수에 할당하려는 값이 Character 타입이라면 컴파일 오류가 발생한다. → 서로 다른 타입의 값을 할당하는 실수를 줄일 수 있다.
- 이렇게 스위프트가 컴파일 시 타입을 확인하는 것을 **타입 확인**이라고 한다.

### 4.1.2 타입 추론

- 스위프트에서는 변수나 상수를 선언할 때 특정 타입을 명시하지 않아도 컴파일러가 할당된 값을 기준으로 변수나 상수의 타입을 결정한다.

## 4.2 타입 별칭

스위프트에서 기본으로 제공하는 데이터 타입이든, 사용자가 임의로 만든 데이터 타입이든 이미 존재하는 데이터 타팁에 임의로 다른 이름(별칭)을 부여할 수 있다. 그런 다음 기본 타입 이름과 이후에 추가한 별칭을 모두 사용할 수 있다.

```swift
typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 100 // MyInt는 Int의 또 다른 이름이다.
var year: YourInt = 2080 // YourInt도 Int의 또 다른 이름이다.

// MyInt도, YourInt도 Int이기 때문에 같은 타입으로 취급한다.
year = age

let month: Int = 7 // 물론 기존의 Int도 사용 가능하다.
let percentage: MyDouble = 99.9 // Int 외에 다른 자료형도 모두 별칭 사용이 가능하다.
```

## 4.3 튜플

: 타입의 이름이 따로 지정되어 있지 않은, 프로그래머 마음대로 만드는 타입. **‘지정된 데이터의 묶음’**

```swift
// String, Int, Double 타입을 갖는 튜플
var person: (String, Int, Double) = ("Suin", 100, 182.5)

// 인덱스를 통해서 값을 빼 올 수 있다.
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

person.1 = 99 // 인덱스를 통해 값을 할당할 수 있다.
person.2 = 178.5
```

- 이름 없이 인덱스만으로 각 요소의 데이터가 무엇을 나타내는지 쉽게 파악하기 어렵기 때문에 튜플의 요소마다 이름을 붙여줄 수도 있다.

```swift
var person: (name: String, age: Int, height: Double) = ("Suin", 100, 182.5)

// 요소 이름을 통해서 값을 빼 올 수 있다.
print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")

person.age = 9 // 요소 이름을 통해 값을 할당할 수 있다.
person.2 = 178.5 // 인덱스를 통해서도 값을 할당할 수 있다.
```

- 같은 모양의 튜플을 사용하고 싶을 때 튜플 별칭을 지정하여 깔끔하고 안전하게 코드를 작성할 수 있다.

```swift
typealias PersonTuple = (name: String, age: Int, height: Double)

let yagom: PersonTuple = ("yagom", 100, 178.5)
let eric: PersonTuple = ("eric", 150, 183.5)
```

## 4.4 컬렉션형

: 많은 수의 데이터를 묶어서 저장하고 관리할 수 있는 컬렉션 타입. 배열(Array), 딕셔너리(Dictionary), 세트(Set) 등이 있다.

### 4.4.1 배열

: 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입. 각기 다른 위치에 같은 값이 들어갈 수도 있음.

```swift
// 배열의 선언과 생성
var names: Array<String> = ["yagom", "chulsoo", "younghee", "yagom"]

// 위 선언과 정확히 동일한 표현이다. [String]은 Array<String>의 축약 표현
var names: [String] = ["yagom", "chulsoo", "younghee", "yagom"]

var emptyArray: [Any] = [Any]() // Any 데이터를 요소로 갖는 빈 배열을 생성한다.
var emptyArray: [Any] = Array<Any>() // 위 선언과 정확히 같은 동작을 하는 코드

// 배열의 타입을 정확히 명시해줬다면 []만으로도 빈 배열을 생성할 수 있다.
var emptyArray: [Any] = []
print(emptyArray.isEmpty) // true
print(names.count) // 4
```

**배열의 메서드**

- `index(of:)` - 해당 요소의 인덱스를 알아낼 수 있음
- `append(_:)` - 맨 뒤에 요소를 추가
- `insert(_:at:)` - 중간에 요소를 삽입
- `remove(_:)` - 요소를 삭제. 해당 요소가 삭제된 후 반환됨

```swift
names[4] = "elsa" // 인덱스의 범위를 벗어났기 때문에 오류가 발생한다.
names.append("elsa") // 마지막에 elsa가 추가된다.
names.append(contentsOf: ["john", "max"] // 맨 마지막에 john과 max 추가
names.insert("happy", at: 2) // 인덱스 2에 삽입된다.
names.insert(contentsOf: ["jinhee", "minsoo"], at: 5) // 인덱스 5의 위치에 jinhee와 minsoo 삽입

print(names.index(of: "yagom")) // 0
print(names.index(of: "christal")) // nil
print(names.first) // yagom
print(names.last) // max

let firstItem: String = names.removeFirst() // 해당 요소 삭제 후 반환
let lastItem: String = names.removeLast()
let indexZeroItem: String = names.remove(at: 0)

print(firstItem) // yagom
print(lastItem) // max
print(indexZeroItem) // chulsoo
print(names[1 ... 3] // ["jenny", "yagom", "jinhee"]
```

### 4.4.2 딕셔너리

: 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입

- 하나의 딕셔너리 안의 키는 같은 이름을 중복해서 사용할 수 없다.
- 키는 값을 대변하는 유일한 식별자이다.

```swift
// typealias를 통해 조금 더 단순하게 표현해볼 수도 있다.
typealias StringIntDictionary = [String: Int]

// 키는 String, 값은 Int 타입인 빈 딕셔너리를 생성한다.
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()

// 위 선언과 같은 표현. [String: Int]는 Dictionary<String, Int>의 축약 표현이다.
var numberForName: [String: Int] = [String: Int]()

// 위 코드와 같은 동작을 함
var numberForName: [String: Int] = [:]

// 초깃값을 주어 생성해줄 수도 있다.
var numberForName: [String: Int] = ["yagom": 100, "chulsoo": 200, "jenny": 300]

print(numberForName.isEmpty) // false
print(numberForName.count) // 3
```

- 딕셔너리 내부에 없는 키로 접근해도 오류가 발생하지 않고 nil을 반환함.
- `removeValue(forKey:)` - 특정 키에 해당하는 값을 제거. 값 제거 후 반환됨.

```swift
print(numberForName["chulsoo"] // 200
print(numberForName["minji"] // nil

numberForName["chulsoo"] = 150 // 값 수정
print(numberForName["chulsoo"]) // 150

numberForName["max"] = 999 // 값 추가
print(numberForName["max"]) // 999

print(numberForName.removeValue(forKey: "yagom")) // 100

// yagom 키에 해당하는 값이 없으면 기본으로 0이 반환됨.
print(numberForName["yagom", default: 0]) // 0
```

### 4.4.3 세트

: 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입

- 세트 내의 값은 모두 유일한 값. 중복된 값이 존재하지 않는다.
- **순서가 중요하지 않거나 각 요소가 유일한 값이어야 하는 경우**에 사용
- **해시 가능한 값**이 요소로 들어와야 한다.
- 배열과 달리 줄여서 표현할 수 있는 축약형(Array<Int> → [Int])이 없다.

```swift
var names: Set<String> = Set<String>() // 빈 세트 생성
var names: Set<String> = [] // 빈 세트 생성

// Array와 마찬가지로 대괄호 사용
var names: Set<String> = ["yagom", "chulsoo", "younghee", "yagom"]

// 타입 추론을 사용하면 컴파일러는 Set가 아닌 Array로 타입을 지정함

print(names.isEmpty) // false
print(names.count) // 3
```

- `insert(_:)` - 요소를 추가
- `remove(_:)` - 요소를 삭제, 삭제 후 반환

```swift
print(names.count) // 3
names.insert("jenny")
print(names.count) // 4

print(names.remove("chulsoo")) // chulsoo
print(names.remove("john")) // nil
```

- 집합관계 표현, 교집합, 합집합 연산에 매우 용이
- `sorted()` - 정렬된 배열을 반환

```swift
let SetA: Set<String> = ["hana", "yagom", "jenny", "john", "chulsoo", "minsoo"]
print(SetA.sorted()) // ["chulsoo", "hana", "jenny", "john", "minsoo", "yagom"]
```

- 포함 관계 연산

```swift
let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류) // 새와 포유류의 합집합

print(새.isDisjoint(with: 포유류)) // 서로 배타적인지 - true
print(새.isSubset(of: 동물)) // 새가 동물의 부분집합인가? - true
print(동물.isSuperset(of: 포유류)) // 동물은 포유류의 전체집합인가? - true
print(동물.isSuperset(of: 새)) // 동물은 새의 전체집합인가? - true
```

- `randomElement()` - 컬렉션에서 임의의 요소를 추출
- `shuffle()` - 컬렉션의 요소를 임의로 뒤섞음
- `shuffled()` - 자신의 요소는 그대로 둔 채 새로운 컬렉션에 임의의 순서로 섞어서 반환

## 4.5 열거형

: 연관된 항목들을 묶어서 표현할 수 있는 타입

- 배열이나 딕셔너리 같은 타입과 다르게 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가
- 다음 같은 경우에 요긴하게 사용할 수 있다.
    - 제한된 선택지를 주고 싶을 때
    - 정해진 값 외에는 입력받고 싶지 않을 때
    - 예상된 입력 값이 한정되어 있을 때

e.g. 

학생: 초등학생, 중학생, 고등학생, 대학생, 대학원생, 기타

지역: 강원도, 경기도, 경상도, 전라도, 제주도, 충청도

### 4.5.1 기본 열거형

- enum이라는 키워드로 선언

```swift
enum School {
		case primary
		case elementary
		case middle
		case high
		case college
		case university
		case graduate
}
```

```swift
enum School {
		case primary, elementary, middle, high, college, university, graduate
}
```

- 열거형 변수의 생성 및 값 변경

```swift
var highestEducationLevel: School = School.university

// 위 코드와 정확히 같은 표현
var highestEducationLevel: School = .university

// 같은 타입인 School 내부의 항목으로만 highestEducationLevel의 값을 변경해줄 수 있다.
highestEducationLevel = .graduate
```

### 4.5.2 원시 값

- 열거형의 각 항목은 자체로도 하나의 값이지만 항목의 원시 값(Raw Value)도 가질 수 있다.
- `rawValue`라는 프로퍼티를 통해 원시 값을 사용할 수 있다.

```swift
enum School: String {
		case primary = "유치원"
		case elementary = "초등학교"
		case middle = "중학교"
		case high = "고등학교"
		case college = "대학"
		case university = "대학교"
		case graduate = "대학원"
}

let highestEducationLevel: School = School.university
print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업입니다.")
// 저의 최종학력은 대학교 졸업입니다.

enum WeekDays: Character {
		case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}

let today: WeekDays = WeekDays.fri
print("오늘은 \(today.rawValue)요일입니다.") // 오늘은 금요일입니다.
```

일부 항복만 원시 값을 주고 싶다면

```swift
print(School.elementary.rawValue) // 초등학교
```

원시 값을 통한 열거형 초기화

```swift
let primary = School(rawValue: "유치원") // primary
let graduate = School(rawValue: "석박사") // nil
```

### 4.5.3 연관 값

- 열거형 내의 항목(case)이 자신과 연관된 값을 가질 수 있다.

```swift
enum MainDish {
		case pasta(taste: String)
		case pizza(dough: String, topping: String)
		case chicken(withSauce: Bool)
		case rice
}

var dinner: MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .rice
```