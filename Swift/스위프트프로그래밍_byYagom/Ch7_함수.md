# Chapter 7. 함수

## 7.1 함수와 메서드

함수와 메서드는 기본적으로 같다. 다만 상황이나 위치에 따라 다른 용오러 부른다.

- **메서드** - 구조체, 클래스, 열거형 등 특정 타입에 연관되어 사용하는 함수
- **함수** - 모듈 전체에서 전역적으로 사용할 수 있는 함수

## 7.2 함수의 정의와 호출

- 함수에서는 소괄호()를 생략할 수 없다.
- 재정의(오버라이드)와 중복 정의(오버로드)를 모두 지원한다.
- 따라서 매개변수의 타입이 다르면 같은 이름의 함수를 여러 개 만들 수 있고, 매개변수의 개수가 달라도 같은 이름의 함수를 만들 수 있다.

### 7.2.1 기본적인 함수의 정의와 호출

```swift
func 함수 이름(매개변수...) -> 반환 타입 {
        실행 구문
        return 반환 값
}
```

```swift
func hello(name: String) -> String {
        return "Hello \(name)!"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny) // Hello Jenny!

func introduce(name: String) -> String {
        // [return "제 이름은 " + name + "입니다"]와 같은 동작을 합니다.
        "제 이름은" + name + "입니다"
}

let introduceJenny: String = introduce(name: "Jenny")
print(introduceJenny) // 제 이름은 Jenny입니다.
```

- 스위프트에서는 `return` 키워드를 생략할 수 있다. 함수 내부의 코드가 단 한 줄의 표현이고, 그 표현의 결괏값의 타입이 함수의 반환 타입과 일치한다면 `return` 키워드를 생략해도 그 표현의 결괏값이 함수의 반환값이 된다.

👀 **매개변수와 전달인자**

- 매개변수(Parameter) - 함수를 정의할 때 외부로부터 받아들이는 전달 값의 이름
- 전달인자(Argument) - 함수를 실제로 호출할 때 전달하는 값

`hello(name: )` 함수에서 매개변수(Parameter)는 name이고, 실제 사용 시 전달받는 값인 “Jenny”가 전달인자(Argument)이다.

### 7.2.2 매개변수

**매개변수가 없는 함수**

→ 매개변수 위치를 공란으로 비워둔다.

```swift
func helloWorld() -> String {
        return "Hello, world!"
}

print(helloWorld()) // Hello, world!
```
