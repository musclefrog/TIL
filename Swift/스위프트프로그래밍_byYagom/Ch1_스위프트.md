# Chapter 1. 스위프트

## 1.2 스위프트의 언어적 특성

- 안전성(Safe)
- 신속성(Fast)
- 더 나은 표현성(Expressive)

Swift: 함수형 프로그래밍 패러다임 & 프로토콜 지향 프로그래밍 패러다임

### 1.2.1 객체지향

- 클래스: 같은 종류(또는 문제 해결을 위한)의 집단에 속하는 속성과 행위를 정의한 것. 객체지향 프로그램의 기본 사용자 정의 데이터 타입. 클래스는 다른 클래스 또는 외부 요소와 독립적으로 디자인되어야 함.
- 객체: 클래스의 인스턴스(실제로 메모리에 할당되어 동작하는 모양을 갖춘 것, instance). 자신 고유의 속성이 있으며 클래스에서 정의한 행위를 할 수 있음. 스위프트에서는 ‘객체’라는 용어보다는 ‘클래스의 인스턴스’라는 표현을 사용.
- 메서드 또는 메시지: 객체가 클래스에 정의된 행위를 실질적으로 하는 함수. 메서드(메시지)를 통해 객체에 명령을 전달할 수 있음. 이 행위를 ‘메서드를 호출한다’ 또는 ‘메시지를 전달한다’라고 표현함.

### 1.2.2 함수형

**함수형 프로그래밍 패러다임**

- 프로그램이 상태의 변화 없이 데이터 처리를 수학적 함수 계산으로 취급하고자 하는 패러다임.
- 특징: 함수를 일급 객체(First-class Citizen)로 다룬다는 점.
- 장점: 대규모 병렬처리가 굉장히 쉽다.
- Cf. 명령형 프로그래밍 패러다임

```swift
// doSomething 함수와 doAnotherThing 함수를 모두 처리하고 싶을 경우
// 명령형 프로그래밍 패러다임
func doSomething() {
	print("do something")
}

func doAnotherThing() {
	print("do another thing")
}

func excuteAll() {
	doSomething()
	doAnotherThing()
}

excuteAll()

///////////////////////

// 두 수의 합을 구하고 싶은 경우
// 명령형 프로그래밍 패러다임
func sum(first: Int, second: Int) -> Int {
	return first + second
}

sum(first: 10, second: 5)

///////////////////////
```

```swift
// doSomething 함수와 doAnotherThing 함수를 모두 처리하고 싶을 경우
// 함수형 프로그래밍 패러다임
func doSomething() {
	print("do something")
}

func doAnotherThing() {
	print("do another thing")
}

func excute(tasks: [()-> void]) {
	for task in tasks {
			tasks()
	}
}

excute(tasks: [doSomething, doAnotherThing])
///////////////////////

// 두 수의 합을 구하고 싶은 경우
// 함수형 프로그래밍 패러다임
func sum(first: Int) -> ((Int) -> Int) {
		return { second in first + second }
}

sum(first: 10)(5)

///////////////////////
```

- 순수하게 함수형 프로그래밍 패러다임으로 프로그램을 작성했을때의 장점
    - 여러 가지 연산 처리 작업이 동시에 일어나는 프로그램을 만들기 쉽다.
    - 멀티 코어 혹은 여러 개 연산 프로세서를 사용하는 시스템에서 효율적인 프로그램을 만들기 쉽다.
    - 상태변화에 따른 부작용에서 자유로워지므로 순수하게 기능 구현에 초점을 맞추어 설계할 수 있다.
- 객체지향과 함수형 프로그래밍 패러다임을 적절하게 섞어 프로그램을 작성한다면 필요한 기능에 맞게 최적의 성능을 발휘할 수도 있고, 생산성도 극대화할 수 있는 프로그램을 만들 수 있다.

### 1.2.3 프로토콜 지향

**프로토콜 지향 프로그래밍**

- 참조 타입인 클래스의 인스턴스보다 값 타입을 더 효율적으로 사용하며, 오류를 줄일 방안.
- 스위프트에서는! 구조체와 열거형에 기존의 클래스에서 구현할 수 있었던 (캡슐화, 추상화, 접근제어) + 프로토콜에 (익스텐션)을 활용할 수 있기 때문에 프로토콜 지향 프로그래밍이 가능.
    
    → 참조 타입의 참조 문제에서 조금 더 자유로움, 다중상속이 불가능한 한계를 뛰어넘음, 더 나은 추상화 메커니즘을 구현할 수 있음.
    

## 1.3 스위프트 실행 환경

### 1.3.1 Xcode - 플레이그라운드

### 1.3.2 REPL

: Read-eval-print loop

macOS의 터미널에서 swift repl 명령을 입력한 후 간단한 코드를 직접 입력하여 바로바로 결과를 볼 수 있는 환경을 제공.

```swift
Last login: Mon May 15 20:57:04 on ttys000
suin@Suins-MacBook-Pro ~ % swift repl
Welcome to Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51).
Type :help for assistance.
  1> let name: String = "Suin"
name: String = "Suin"
  2> print("name")
name
  3> func greeting(to name: String) { 
  4.     print("Hello \(name)!") 
  5. } 
  6> greeting(to: name)
Hello Suin!
  7> "eric"
$R0: String = "eric"
  8> print("\(name)'s friend: \($R0)")
Suin's friend: eric
  9>
```

### 1.3.3 웹

- Online Swift Playground
- 구름IDE

### 1.3.4 모바일

- iPad용 플레이그라운드