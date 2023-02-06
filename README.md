<br>
<img src="https://user-images.githubusercontent.com/48792069/212345345-ae94cc27-c8d7-41f2-8033-03e6d6395b48.png" height="200">
<br>


# 어제의 날씨로 알아 보는 오늘의 날씨, 숏웨더 ☔️

날씨를 어제와 비교하여 알고싶다면?

미세먼지 농도, 기온 등 수치만 봐서는 알 수 없는 정보들을 좀 더 직관적으로 알아보자!

<br><br>
##  🌥 service introduction
<img src="https://user-images.githubusercontent.com/70002218/212327582-b27fd2c9-5286-4ab2-9c13-2bf87efc32a7.png" width= "800">


<br><br>
##  🫶 Short Weather iOS Developers

<img src="https://user-images.githubusercontent.com/48792069/212343055-ae397b39-205e-4215-a878-8cc9f49f5d28.png" width="200"> | <img src="https://user-images.githubusercontent.com/48792069/212342777-d26b0f33-5271-470a-8d65-eb5b326127e0.png" width="200"> | <img src="https://user-images.githubusercontent.com/48792069/212343484-461a4849-8d4d-4e56-83f6-ff3119787b40.png" width="200"> |
:---------:|:----------:|:---------:|
유서린 | 김 민 | 권 정 |
[SeorinY](https://github.com/SeorinY) | [minnnidev](https://github.com/minnnidev) | [kwonjeong](https://github.com/kwonjeong) |
<br>

## 💻 Development Environment

<img src ="https://img.shields.io/badge/Swift-5.5-orange?logo=swift" height="30"> <img src ="https://img.shields.io/badge/Xcode-14.2-blue?logo=xcode" height="30"> <img src ="https://img.shields.io/badge/iOS-16.0-white.svg" height="30">

<br>

## 📖 Using Library

라이브러리 | 사용 목적 | Management Tool
:---------:|:----------:|:---------:
Moya | 서버 통신 | SPM
SnapKit | UI Layout | SPM
Then | UI 선언 | SPM
Lottie | 스플래쉬 화면 | SPM

<br>

## 📝 Code Convention

<details>
<summary> 💦 네이밍 </summary>
<div markdown="1">

### 💧클래스, 구조체

- **UpperCamelCase** 사용

```swift
// - example

struct MyTicketResponseDTO {
}

class UserInfo {
}
```

### 💧함수

- **lowerCamelCase** 사용하고 동사로 시작

```swift
// - example

private func setDataBind() {
}
```

### 💧**뷰 전환**

- pop, push, present, dismiss
- 동사 + To + 목적지 뷰 (다음에 보일 뷰)
- dismiss는 dismiss + 현재 뷰

```swift
// - example pop, push, present

popToFirstViewController()
pushToFirstViewController()
presentToFirstViewController()

dismissFirstViewController()
```

### 💧**register**

- register + 목적어

```swift
// - example

registerXib()
registerCell()
```

### 💧서버 통신

- 서비스함수명 + WithAPI

```swift
// - example

fetchListWithAPI()

requestListWithAPI()
```

fetch는 무조건 성공

request는 실패할 수도 있는 요청

### 💧애니메이션

- 동사원형 + 목적어 + WithAnimation

```swift
showButtonsWithAnimation()
```

### 💧**델리게이트**

delegate 메서드는 프로토콜명으로 네임스페이스를 구분

**좋은 예:**

```swift
protocol UserCellDelegate {
  func userCellDidSetProfileImage(_ cell: UserCell)
  func userCell(_ cell: UserCell, didTapFollowButtonWith user: User)
}

protocol UITableViewDelegate {
	func tableview( ....) 
	func tableview...
}

protocol JunhoViewDelegate {
	func junhoViewTouched()
	func junhoViewScrolled()
}
```

Delegate 앞쪽에 있는 단어를 중심으로 메서드 네이밍하기

**나쁜 예:**

```swift
protocol UserCellDelegate {
	// userCellDidSetProfileImage() 가 옳음
  func didSetProfileImage()
  func followPressed(user: User)

  // `UserCell`이라는 클래스가 존재할 경우 컴파일 에러 발생  (userCell 로 해주자)
  func UserCell(_ cell: UserCell, didTapFollowButtonWith user: User)
}
```

함수 이름 앞에는 되도록이면 `get` 을 붙이지 않습니다.

### 💧**변수, 상수**

- **lowerCamelCase** 사용

```swift
let userName: String
```

### 💧**열거형**

- 각 case 에는 **lowerCamelCase** 사용

```swift
enum UserType {
	case viewDeveloper
	case serverDeveloper
}
```

### 💧**약어**

약어로 시작하는 경우 소문자로 표기, 그 외에는 항상 대문자

```swift
// 좋은 예:
let userID: Int?
let html: String?
let websiteURL: URL?
let urlString: String?
```

```swift
// 나쁜 예:
let userId: Int?
let HTML: String?
let websiteUrl: NSURL?
let URLString: String?
```

### 💧**기타 네이밍**

```swift
setUI() : @IBOutlet 속성 설정
setLayout() : 레이아웃 관련 코드
setDataBind() : 배열 항목 세팅. 컬렉션뷰 에서 리스트 초기 세팅할때
setAddTarget() : addtarget 모음
setDelegate() : delegate, datasource 모음
setCollectionView() : 컬렉션뷰 관련 세팅
setTableView() : 테이블뷰 관련 세팅
initCell() : 셀 데이터 초기화
registerXib() : 셀 xib 등록.
setNotification() : NotificationCenter addObserver 모음

헷갈린다? set을 쓰세요 ^^

```
</details>

<details>
<summary> 💦코드 레이아웃 </summary>
<div markdown="1">

### 💧**들여쓰기 및 띄어쓰기**

- 들여쓰기에는 탭(tab) 대신 **4개의 space**를 사용합니다.
- 콜론(`:`)을 쓸 때에는 콜론의 오른쪽에만 공백을 둡니다.
    
    `let names: [String: String]?`
    
    `let name: String`
    
- 연산자 오버로딩 함수 정의에서는 연산자와 괄호 사이에 한 칸 띄어씁니다.
    
    `func ** (lhs: Int, rhs: Int)`
    

### 💧**줄바꿈**

- 함수를 호출하는 코드가 최대 길이를 초과하는 경우에는 파라미터 이름을 기준으로 줄바꿈합니다.
**파라미터가 3개 이상이면 줄바꿈하도록!!**
    
    **단, 파라미터에 클로저가 2개 이상 존재하는 경우에는 무조건 내려쓰기합니다.**
    
    ```swift
    UIView.animate(
      withDuration: 0.25,
      animations: {
        // doSomething()
      },
      completion: { finished in
        // doSomething()
      }
    )
    ```
    
- `if let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다.
    
    ```swift
    if let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
      let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
      user.gender == .female {
      // ...
    }
    ```
    
- `guard let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다. `else`는 마지막 줄에 붙여쓰기
    
    ```swift
    guard let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
      let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
      user.gender == .female else { return }
    
    guard let self = self 
    else { return } (X)
    
    guard let self = self else { return } (O)
    ```
    

### 💧**빈 줄**

- 클래스 선언 다음에 , extension 다음에 한 줄 띄어주기
- 빈 줄에는 공백이 포함되지 않도록 합니다.  ( 띄어쓰기 쓸데없이 넣지 말기 )
- 모든 파일은 빈 줄로 끝나도록 합니다. ( 끝에 엔터 하나 넣기)
- MARK 구문 위와 아래에는 공백이 필요합니다.
    
    ```swift
    // MARK: Layout
    
    override func layoutSubviews() {
      // doSomething()
    }
    
    // MARK: Actions
    
    override func menuButtonDidTap() {
      // doSomething()
    }
    ```
    

### 💧**임포트**

모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

```swift
import UIKit

import Moya
import SnapKit
import SwiftyColor
import Then
```

```swift
import UIKit

import SwiftyColor
import SwiftyImage
import JunhoKit
import Then
import URLNavigator
```

</details>


<details>
<summary> 💦클로저 </summary>
<div markdown="1">

- 파라미터와 리턴 타입이 없는 Closure 정의시에는 `() -> Void`를 사용합니다.
    
    **좋은 예:**
    
    ```
    let completionBlock: (() -> Void)?
    ```
    
    **나쁜 예:**
    
    `let completionBlock: (() -> ())? let completionBlock: ((Void) -> (Void))?`
    
- Closure 정의시 파라미터에는 괄호를 사용하지 않습니다.
    
    **좋은 예:**
    
    ```swift
    { operation, responseObject in
      // doSomething()
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    { (operation, responseObject) in
      // doSomething()
    }
    ```
    
- Closure 정의시 가능한 경우 타입 정의를 생략합니다.
    
    **좋은 예:**
    
    ```swift
    ...,
    completion: { finished in
      // doSomething()
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    ...,
    completion: { (finished: Bool) -> Void in
      // doSomething()
    }
    
    completion: { data -> Void in
      // doSomething()
    } (X)
    ```
    
- Closure 호출시 또다른 유일한 Closure를 마지막 파라미터로 받는 경우, 파라미터 이름을 생략합니다.
    
    **좋은 예:**
    
    ```swift
    UIView.animate(withDuration: 0.5) {
      // doSomething()
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    UIView.animate(withDuration: 0.5, animations: { () -> Void in
      // doSomething()
    })
    ```
    
</details>

<details>
<summary> 💦주석 </summary>
<div markdown="1">

코드는 가능하면 자체적으로 문서가 되어야 하므로, 코드와 함께 있는 인라인(inline) 주석은 피한다.

### 💧**MARK 주석**

```swift
// MARK: - UI Components

// MARK: - View Life Cycle

// MARK: - Initializer

// MARK: - Properties  -> setUI

// MARK: - Layout Helper  -> setLayout

// MARK: - Methods     -> registerXib, assignDelegate 등

// MARK: - @objc Methods

// MARK: Actions       -> ex) MenuButtonDidTap

// MARK: - Network
> 네트워크 목적을 가진 함수들
```

```
// MARK: - Properties

// MARK: - @IBOutlet Properties

// MARK: - @IBAction Properties

// MARK: - View Life Cycle

// MARK: - Methods
> setUI, registerXib, assignDelegate 등

// MARK: - @objc Methods

// MARK: - Network
> 네트워크 목적을 가진 함수들
```

### 💧**퀵헬프 주석**

커스텀 메서드, 프로토콜, 클래스의 경우에 퀵헬프 주석 달기

```swift
/// (서머리 부분)
/// (디스크립션 부분)
class MyClass {
    let myProperty: Int

    init(myProperty: Int) {
        self.myProperty = myProperty
    }
}

/**summary
(서머리 부분)
> (디스크립션 부분)

- parameters:
    - property: 프로퍼티
- throws: 오류가 발생하면 customError의 한 케이스를 throw
- returns: "\\(name)는 ~" String
*/
func printProperty(property: Int) {
        print(property)
    }

// 카카오 로그인 API 뜯어보면
// 서머리랑 디스크립션 엄청 잘되어있긴해
// --> 오픈 소스라서!!
// 그건 PR에서 하는걸로..?
```

- 참고 :

</details>

<details>
<summary> 💦프로그래미 권장사항 </summary>
<div markdown="1">

### 💧**Type Annotation 사용**

**좋은 예:**

```swift
let name: String = "철수"
let height: Float = "10.0"
```

**나쁜 예:**

```swift
let name = "철수"
let height = "10.0"
```

### 💧**UICollectionViewDelegate, UICollectionViewDatsource 등 시스템 프로토콜**

프로토콜을 적용할 때에는 extension을 만들어서 관련된 메서드를 모아둡니다.

**좋은 예**:

```swift
final class MyViewController: UIViewController {
  // ...
}

// MARK: - UITableViewDataSource

extension MyViewController: UITableViewDataSource {
  // ...
}

// MARK: - UITableViewDelegate

extension MyViewController: UITableViewDelegate {
  // ...
}
```

**나쁜 예:**

```swift
final class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  // ...
}

// 프로토콜 여러개를 한곳에 몰아서 때려넣지 말자!
```

</details>


<details>
<summary> 💦기타규칙 </summary>
<div markdown="1">

```
- `self` 는 최대한 사용을 지양
- `viewDidLoad()` 에서는 함수호출만
- delegate 지정, UI관련 설정 등등 모두 함수와 역할에 따라서 extension 으로 빼기
- 필요없는 주석 및 Mark 구문들 제거
```

</details>

<br>

##  🐈 Git & GitHub Strategy

<details>
<summary> 🐱 Git Flow </summary>
<div markdown="1">

1. 이슈 생성
    - 이슈 제목 : [Prefix] 작업 목표
    - 자기 라벨 + Prefix 라벨 선택
2. 로컬 브랜치 파고 작업
    - 브랜치 이름 : feature/#이슈 번호-작업 내용
3. Upstream develop 브랜치와 충돌 해결 후 Origin 레포에 브랜치 생성 및 푸쉬
4. Origin 레포 → Upstream 레포  PR 날리기
5. Upstream PR 머지 했으면  Upstream → Local main(develop) 브랜치도 머지 시켜주기

</details>

<details>
<summary> 🐱 Issue Template </summary>
<div markdown="1">

```markup
## ☔️ 이슈 요약
<!-- 이유에 대해 설명해주세요. -->
- 프로젝트 초기 세팅

## ✅ 체크 리스트
<!-- 해야 할 일을 적어주세요. -->
- [ ] 프로젝트 초기 세팅
```

</details>

<details>
<summary> 🐱 Pull Request Template </summary>
<div markdown="1">

```markup
## ☔️ 작업한 내용
<!-- 아래 리스트를 지우고, 작업 내용을 적어주세요. -->
 - 작업 내용 1
 - 작업 내용 2

## ☃️ PR POINT
<!-- 덧붙이고 싶은 내용이 있다면! -->

## 💧 스크린샷
<!-- 작업한 화면이 있다면 스크린 샷으로 첨부해주세요. -->

|    구현 내용    |   스크린샷   |
| :-------------: | :----------: |
| GIF | <img src = "" width ="250">|

## 🌈 관련 이슈
<!-- 작업한 이슈번호를 # 뒤에 붙여주세요. 수고했습니다~* -->
- Resolved: #
```

</details>

<details>
<summary> 🐱 Commit Convention & Template </summary>
<div markdown="1">

- [Prefix] #이슈번호 - 작업내용
```

#   [Feat]      : 새로운 기능 구현
#   [Fix]       : 버그, 오류 해결, 코드 수정
#   [Design]    : just 화면. 레이아웃 조정
#   [Merge]     : 머지, 충돌 해결
#   [Refactor]  : 프로덕션 코드 리팩토링
#   [Comment]   : 필요한 주석 추가 및 변경
#   [Docs]      : README나 WIKI 등의 문서 개정
#   [Chore]     : 빌드 태스트 업데이트, 패키지 매니저를 설정하는 경우(프로덕션 코드 변경 X)
#   [Setting]   : 초기 세팅
#   [Rename]    : 파일 혹은 폴더명을 수정하거나 옮기는 작업만인 경우
#   [Remove]    : 파일 혹은 폴더명을 수정하거나 옮기는 작업만인 경우

#   [커밋 타입]   : 설명!!

# Commit Example!!
# [Feat]#1 - ~~기능 추가!
#
# 설명을 덧붙이고 싶다면 이 예시처럼 위에 commit 메세지와 한 칸 띄고 작성하면 돼용  <바디에 들어감>
```

</details>

<br>

## 📂 Folder Architecture

<details>
<summary> 프로젝트 폴더 구조 </summary>
<div markdown="1">

```bash
├── 📂 Application
│   ├── AppDelegate
│   └── SceneDelegate
├── 📂 Data
│   ├── 📂 DTO
│   └── 📂 Model
├── 📂 Network
│   ├── 📂 APIService
│   │   └── 📂 Main
│   │        ├── MainAPI
│   │        └── MainService
│   └── 📂 Foundation
│       ├── APIConst
│       ├── GerneralResponse
│       ├── NetworkLoggerPlugin 
│       └── URLConst
├── 📂 Presentation
│   └── 📂 Common
│       └── BaseViewController
├── 📂 Resource
│   ├── 📂 AssetCatalog
│   │   ├── Assets.xcassets
│   │   ├── Color.xcassets
│   │   └── Image.xcassets
│   ├── 📂 Font
│   ├── Info.plist
│   └── LaunchScreen.storyboard
└── 📂 Util
    ├── 📂 Extension
    │   ├── Encodable +
    │   └── UIFont +
    ├── 📂 NameSpace
    │   ├── Color
    │   ├── Image
    │   └── PretendardType
    ├── 📂 Protocol
    └── 📂 StyleGuide
        └── FontLevel
```
</details>

<br>
	
## 🌂 역할 분담

<details>
<summary> 🐱 서린 </summary>
<div markdown="1">

- Splash 화면
    - 로티파일을 실행하고, 애니메이션이 끝나면 아래 로직을 실행함
    - User Default 에 device 토큰이 저장되어 있는지 검사함 (기기 등록 시 랜덤스트링으로 device 토큰을 구현했기 때문에)
        - device 토큰이 있다면 서버에 device 토큰을 보내서 유저 정보가 디비에 있는지 확인
            - 디비에 유저가 있다면  authorization - jwt 토큰을 저장해서 헤더에 넣어줌
            - 디비에 유저가 없다면 정보입력 폼으로 이동
        - device 토큰이 없다면 정보입력 폼으로 이동
- Local(Base)ViewController
    모든 뷰들의 공통적인 부분들을 BaseViewController 로 구현해서, 상속 받으면 저절도 생성되게 만들었다
    
    - BaseViewController
        - sideMenuView의 레이아웃을 화면 밖으로 잡고, 햄버거 버튼이 눌렸을 때 sideMenuView의 레이아웃이 변경되게 했다, 그리고 애니메이션으로 구현했다
    - LocalBaseViewController
        - 지역을 등록할 수 있는 모든 뷰 들은, 여러 지역들을 각 Cell로 나타내기 위해 화면에 꽉차는 CollectionView 를 만들었다,
        - page 방식으로 넘어가게 만들었다
    
- 오늘 날씨 1 뷰 ( UIView )
    서버 통신을 하고 위 컴포넌트들에 데이터 바인딩 시켜주었다.
    
    특보, 미세, 초미세 먼지 라벨들을 CollectionView로 구현했고, 특보가 비었다면 미세, 초미세 셀만 나타나게 등록했다.
    
    날씨의 모든 경우의 수를 enum으로 만들었고, enum에 각 케이스에 맞는 반환값들을 리턴하는 함수를 만들어서 에셋과, 백그라운드 컬러 등을 매치시켰다.
    
    버튼이 눌렸을 때 어제 날씨와 비교하는 라벨을 hidden 처리를 풀어주고,
    
    3초가 지난 후 다시 hidden 처리를 해서 3초후 사라지게 만들었다.
    
    이 뷰와 오늘 날씨 뷰 2를 스크롤뷰에 넣었다 → 스크롤 뷰가 위로 당겨졌을 때 새로고침을 구현했다,
    
    새로 고침을 하기 전에 서버통신을 다시 해서 데이터를 바인딩 시켜주었다
    
- 정보 입력 서버 통신
    정보 입력이 완료된 후 확인 버튼을 누르면 서버에 유저 정보와, 디바이스 토큰 (랜덤 스트링) 을 생성해서 전달해준다. 디바이스 토큰(랜덤 스트링) 을 기기에 저장하고, 서버에서 온 Autherization ( jwt Token ) 을 헤더에 넣어준다.
	
		
</details>
	
<details>
<summary> 🐰 민 </summary>
<div markdown="1">

### 오늘날씨 2
`전체 tableView`

- 전체 뷰를 tableView로 구현하고 외출 시간, 귀가 시간/시간대별 날씨/오늘 날씨 정보를 각 셀로 구현함.

`외출 시간, 귀가시간대 Cell`

- 외출 시간, 외출 시간대 날씨 이미지, 외출 시간대 날씨로 이루어진 외출 시간대 stackVIew와 귀가 시간, 귀가 시간대 날씨 이미지, 귀가 시간대 날씨로 이루어진 귀가 시간대 stackView를 stackView로 묶어 구현함.

`시간대별 날씨 Cell`

- 시간대별 날씨 Cell 안에 collectionView를 추가하여 좌우 스와이프 구현함
- enum으로 시간별 날씨/시간별 강수로 구분함
- 데이터를 새로 불러오도록 함수를 정의하여 날씨 버튼 혹은 강수 버튼이 클릭될 때마다 함수를 실행하여 서버와 통신함.

`오늘 날씨 정보 Cell` 

- stackView로 습도, 일출/일몰, 미세먼지, 초미세먼지 뷰 구현
- 미세먼지/초미세먼지 - 서버로부터 [1: 좋음 2: 보통 3:나쁨 4: 심각] 형태로 받고, enum 사용하여 대응시키는 방법으로 미세먼지/초미세먼지 이미지 보여줌

---
	
### 설정
`설정 초기뷰`

- 전체 tableView로 구현

`외출/귀가시간대 설정`

- 정이 뷰 쇽샥

`알림 설정`

- 전체 알림 뷰는 UIView로 만들고 기상시간대 알림/취침시간대 알림/특보 알림은 tableView로 구현
    
    ⇒ 전체 알림 토글 버튼을 클릭하여 알람 on시 `tableView.isHidden = false` 로 tableView 보여주고, 알람 off 시 `tableView.isHidden = true` 로 tableView 숨김 처리
</details>

<details>
<summary> 🐸 정 </summary>
<div markdown="1">

### 정보 입력
    
- 정보 입력폼을 FirstInfoViewController, SecondInfoViewController로 나누어서 구현
- 두개의 뷰컨트롤러 모두 EnterInfoCollectionView를 이용해 입력창을 구현

`FirstInfoViewController`

- EnterInfoCollectionView를 이용해 입력창을 구현히고, 각각의 셀을 누르면 SettingBaseViewController가 present 형식으로 나오게 만들었고, UISheetPresentationController를 이용해 뷰컨트롤러의 hgieht를 각각 지정해주었다
- SettingBaseViewController를 재사용해 ListTableViewCell을 이용해 성별, 연령대, 온도 민감도가 각각의 셀마다 다르게 뜨도록 설정
    - ListTableViewCell을 선택하면 dismiss가 되고 선택한 내용이 FirstInfoController로 전달되고 그 내용이 또 EnterInfoControllerView가 생성될 때 전달되도록 delegate로 설정

`SecondInfoViewController`

- 위와 마찬가지롤 EnterInfoCollectionView를 이용해 입력창을 구현하고 셀을 누르면 TimeInfoViewController가 present 형식으로 나오도록 구현
- UIPickerView를 이용해 DatePicker과 유사하게 구현
- 저장 버튼을 누르면 dismiss 되고 선택한 String이 SecondInfoController로 전달 → EnterInfoControllerView로 전달
- timeToString 함수 → 서버에 보낼 데이터
	
---
	
### 주간날씨

- collection reusable 뷰로 일별예보, 오전 / 오후, 최저 / 최고 라벨을 스크롤할 수 있도록 구현
- collectionview cell을 이용해서 반복되는 부분을 구현
	
</details>
<br>
	
## ☔️ 프로젝트 회고

<details>
<summary> ☃️ 서린 </summary>
<div markdown="1">

- 테이블 뷰 Reusable Header 생성 시 섹션마다 공백이 생겼다. 모든 헤더들의 높이를 0으로 설정해주어도 문제가 해결되지 않았고, 계층을 나눠 본 결과 섹션들 사이에 헤더가 있는 것이 아님. 
    - tableView 생성할 때 Style 을 group 으로 생성해서 문제를 해결함
    
- 사이드 메뉴바를 가장 위에 띄워줘야 하는데 NavigationBar가 뷰로 덮히지 않아서 네비게이션 아이템들이 사이드 메뉴바로 가려지지 않았다
    - 네비게이션 바를 없애고, 버튼과 라벨로 구현해서 사이드 메뉴 바를 맨 위로 덮히게 함
- 셀들의 UI 상태가 변한 후 Reusable 될 경우 인덱스가 뒤바뀌어서 셀들의 UI 가 뒤섞이게 된 오류가 있었다
    - cellForItemAt 함수에서 모든 셀들의 UI를 초기화해주었다.
- 앱잼 전체 회고
    - 이번 앱잼을 통해 팀원 전체가 함께 프로젝트를 진행하고, 협업을 진행하며 통일된 코드를 작성하는 법을 배웠으면 좋겠다는 목표를 가지고 프로젝트를 진행했었다. 그렇게 통일된 방향을 가진 코드를 작성하려다보니,  코드를 수정하는데 리소스가 많이 들어갔고, 기능 구현에도 리소스가 많이 들어가다보니 팀원들끼리 서로의 코드에 이유를 소통하는데 부족함이 있었다.
    - 코드에 더 신경이 가다보니 팀원들에게 신경을 잘 써주지 못 한것 같아서 미안함이 조금 있다.
</details>

<details>
<summary> ☃️ 민 </summary>
<div markdown="1">

- enum 사용하기
    
    <Swift enum을 이용해서 사소하게 코드를 개선해보자>라는 아티클을 보고 case로 나뉘어질 때 enum을 사용해 보기로 하였다. 참고하지 않고 처음부터 코드를 써 보는 것은 처음이라 rawValue와 이를 사용하는 방법을 공부하고 SOPT iOS 팀원들의 코드를 보며 공부하여 코드를 정리하고, 다른 팀원들도 이해할 수 있게 하려고 했다.
    
- 설정 뷰 - 전체 알림을 켰을 때 다른 알림들을 선택하는 창이 나오도록 하려면
    
    처음에 tableView Expandable Cell 같은 것을 사용해 보려 하였으나, cell을 선택하는 것이 아니라 토글 버튼을 선택하면 뷰가 나오도록 구현하기 위해서 tableView 숨김 처리를 했다.
    
</details>

<details>
<summary> ☃️ 정 </summary>
<div markdown="1">

- 테이블 뷰 생성 시 cell 마다 여백을 주는 것이 까다로움
    - 섹션마다 여백을 주는 것이 아닌 cell마다 여백이 필요하다면 컬렉션 뷰 사용
    - 위, 아래, 좌 우 여백 다 포함!
        
        → tableView 선언할 때 `UITableView(frame: .zero, style: .grouped)` 로 선언한 뒤 setDataBind 함수로 값 전달할 때 `listDatas[indexPath.section]` 로 전달하기 그렇게 하면 셀마다 여백을 줄 수 있음
        
- present할 때 modal의 높이를 조정하는 방법을 고민했는데 처음엔 서린이오빠가 햄버거 바를 만든 것처럼 직접 만들어보려고 했으나 iOS 16 버전에서 생긴 UIPresentationController를 이용해서 간단하게 높이를 조절할 수 있었다
- width height를 직접 주는 방식보다는 leading trailing을 이용해서 레이아웃을 잡는 것이 더 다양한 기기에서 레이아웃이 잘 잡히는 것을 배웠다
- DatePicker를 이용하면 1시간 간격으로 시간 선택이 불가해서 UIPicker를 이용해 DatePicker와 유사하게 제작
    - enum 형식으로 셀 이름을 전달해주고 resetTime 함수를 만들어서 초기값을 설정
- 시간을 오전 10시, 11시 ,12시로 설정하니 서버와 통신이 되지 않는 오류가 있었는데 값이 “오전”일때 두자리수 시간일 경우를 생각하지 않아서 값이 “01100” 으로 들어가는 경우였다. 두자리수일 때 리턴값을 다르게 설정해주었더니 해결되었다
- 앱잼 전체 회고
    - 기초가 많이 부족하다는 것을 느꼈고 단기간 내에 정말 많은 것을 배워서 언니오빠한테 감사했다. 그래도 맡은 일을 해낼 때마다 기분이 좋았다
    
</details>
