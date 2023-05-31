# Tab bars

## Tab bars use bar items to navigate between mutually exclusive panes of content in the same view.

Tab bar는 bar item을 사용하여 동일한 view에서 서로 배타적인 내용의 창을 탐색한다.

![https://docs-assets.developer.apple.com/published/a6228884047d7fafe87b59f2c54090aa/components-tab-bar-intro@2x.png](https://docs-assets.developer.apple.com/published/a6228884047d7fafe87b59f2c54090aa/components-tab-bar-intro@2x.png)

Tab bars help people understand the different types of information or functionality that a view provides. They also let people quickly switch between sections of the view while preserving the current navigation state within each section.

Tab bar는 view가 제공하는 다양한 유형의 정보 또는 기능을 이해하는데 도움을 준다. 사용자는 각 섹션 내에서 현재 탐색 상태를 유지하면서 view 섹션 간에 빠르게 전환할 수 있다.

## Best practices

- **Use a tab bar only for navigation, not to help people perform actions.** A tab bar lets people navigate among different areas of an app, like the Alarm, Stopwatch, and Timer tabs in the Clock app. If you need to provide controls that act on elements in the current view, use a [toolbar](https://developer.apple.com/design/human-interface-guidelines/toolbars) instead.
    
    **Tab bar는 사용자가 작업(행동)을 수행하는데 도움을 주는 것이 아닌, 탐색에만 사용하라.** Tab bar를 사용하면 Clock 앱에서 Alarm, Stopwatch, Timer 탭과 같이 같은 앱의 다른 영역을 탐색할 수 있다. 현재 뷰의 elements에 대해 컨트롤을 제공해야 하는 경우에는 대신 toolbar를 사용한다.
    

- **Make sure the tab bar is visible when people navigate to different areas in your app.** The exception is a tab bar within a modal view. Because a modal view gives people a separate experience that they dismiss when they’re finished, hiding the view’s tab bar doesn’t affect app navigation.
    
    **사람들이 앱에서 다른 area로 이동할 때 Tab bar가 표시되는지 확인하라.** 단, modal view 내의 tab bar는 예외이다. Modal view는 사용자가 작업을 완료하면 dismiss하는 별도의 경험을 제공하기 때문에, tab bar를 숨기는 것은 앱 탐색에 영향을 주지 않는다.
    

- **Use the minimum number of tabs required to help people navigate your app.** Each additional tab increases the complexity of your app, making it harder for people to locate information. Aim for a few tabs with short titles or icons to avoid crowding and causing tabs to truncate. In general, use three to five tabs in iOS; use a few more in iPadOS and tvOS if necessary.
    
    **사용자가 앱을 탐색하는 데 필요한 최소 탭 수를 사용하라.** 추가적인 탭은 앱의 complexity를 증가시켜 사용자가 정보를 찾기 어렵게 만든다. 탭이 붐비거나 잘리지 않도록 짧은 제목이나 아이콘이 있는 몇 개의 탭을 목표로 한다. 일반적으로 iOS에서는 3-5개의 탭을 사용하고, 필요한 경우 iPadOS 및 tvOS에서는 몇 개의 탭을 더 사용한다.
    

- **Keep tabs visible even when their content is unavailable.** If tabs are available in some cases but not in others, your app’s interface might appear unstable and unpredictable. When necessary, explain why a tab’s content is unavailable. For example, even when there is no music on an iOS device, the Listen Now tab in the Music app remains available and offers suggestions for downloading music.
    
    **콘텐츠가 unavailable 상태여도 tab을 계속 표시하라.** 어떤 경우에는 탭이 available 하고 다른 경우에는 그렇지 않다면 앱의 인터페이스가 unstable하고 unpredictable하게 나타날 것이다. 필요한 경우 탭의 콘텐츠를 사용할 수 없는 이유를 설명하라. 예를 들어 iOS 기기에 음악이 없는 경우에도 Music 앱의 Listen Now 탭은 계속 사용할 수 있으며 음악 다운로드에 대한 제안을 제공한다.
    

- **Use concrete nouns or verbs as tab titles.** A good tab title helps people navigate by clearly describing the type of content people find when they select the tab. Consider nouns for category titles like Music, Movies, TV Shows, and Sports, and verbs or short verb phrases for things related to time or peoples’ perspectives on the content (like Watch Now or For You).
    
    **구체적인 명사나 동사를 탭 제목으로 사용한다.** 좋은 탭 제목은 사용자가 탭을 선택할 때 콘텐츠 내용을 명확하게 설명하여 탐색하는 데 도움이 된다. 음악, 영화, TV 쇼 및 스포츠와 같은 범주 제목에는 명사를, 내용에 대한 시간 또는 사람들의 관점(예: Watch Now / For You)과 관련된 동사 또는 짧은 동사 구문을 고려한다.
    

- **Be cautious of overcrowding tabs with functionality.** Tabs represent an app’s menu of options. Tabs titled “Home” tend to be too large in scope for an app. Aim to create focus by representing specific and descriptive categories of content or functionality on each tab.
    
    **기능이 있는 탭이 overcrowd 되지 않도록 주의하라**. Tab은 앱의 옵션 메뉴를 나타낸다. “Home” 탭은 앱에 비해 범위(scope)가 너무 크다. 각 탭에 콘텐츠 또는 기능의 specific하고 descriptive한 카테고리를 표시하여 focus를 만드는 것을 목표로 하라.
    

## Platform considerations

### iOS, iPadOS

By default, a tab bar is translucent: It uses a background material only when content appears behind it, removing the material when the view scrolls to the bottom. A tab bar hides when a keyboard is onscreen.

기본적으로 tab bar는 반투명이다: 콘텐츠가 뒤에 나타날 때만 background material을 사용하고, view가 아래로 스크롤될 때 material을 없앤다. 키보드가 화면에 표시되면 Tab bar은 숨겨진다.

- **Avoid overflow tabs whenever possible.** Depending on device size and orientation, the number of visible tabs can be smaller than the total number of tabs. If horizontal space limits the number of visible tabs, the trailing tab becomes a More tab, revealing the remaining items in a list on a separate screen. The More tab makes it harder for people to reach and notice content on tabs that are hidden, so try to limit scenarios in your app where this can happen.
    
    **Overflow 탭을 피해라.** 디바이스 크기와 방향(orientation)에 따라, 표시되는 탭 수가 전체 탭 수보다 작을 수 있다. 만약 horizontal space가 보여지는 탭 수를 제한한다면, 뒤에 오는 탭이 <More> 탭이 되어 list의 나머지 item들이 별도의 화면에 표시된다. <More> 탭을 사용하면 숨겨진 탭의 콘텐츠에 접근하거나 내용을 확인하는 것이 어려워지므로 이러한 상황이 발생할 수 있는 앱의 시나리오를 제한해 보아라.
    

- **In an iPadOS app, consider using a sidebar instead of a tab bar.** Because a sidebar can display a large number of items, it can make navigating an iPad app more efficient. You can also let people customize a sidebar’s items and let them hide it to make more room for content. For guidance, see [Sidebars](https://developer.apple.com/design/human-interface-guidelines/sidebars).
    
    **iPadOS 앱에서는 tab bar 대신 sidebar를 사용하는 것을 고려하라.** Sidebar는 많은 아이템을 표시할 수 있기 때문에, iPad 앱을 보다 효율적으로 탐색할 수 있다. 또한 사용자가 sidebar의 항목을 customize하고 더 많은 콘텐츠 공간을 확보하기 위해 항목을 숨기도록 할 수 있다. 자세한 내용은 [Sidebars](https://developer.apple.com/design/human-interface-guidelines/sidebars)를 참조하라.
    
    참고) Sidebar
    
    ![https://docs-assets.developer.apple.com/published/fbab4d7b7ae7b8a2790523101585497d/components-sidebar-intro@2x.png](https://docs-assets.developer.apple.com/published/fbab4d7b7ae7b8a2790523101585497d/components-sidebar-intro@2x.png)
    
- **Ensure that tabs affect the view that’s attached to the tab bar, not views elsewhere onscreen.** For example, make sure selecting a tab on the left side of a split view doesn’t cause the right side of the split view to change.
    
    **탭이 화면의 다른 위치에 있는 view가 아니라 tab bar에 부착된 보기에 영향을 미치는지 확인하라.** 예를 들어 split view의 왼쪽에 있는 탭을 선택할 때 오른쪽 보기가 변경되지 않도록 하라.
    

- **Use a badge to communicate unobtrusively.** You can display a badge — a red oval containing white text and either a number or an exclamation point — on a tab to indicate that new information associated with that view or mode is available. For guidance, see [Notifications](https://developer.apple.com/design/human-interface-guidelines/notifications).
    
    배지를 사용하여 눈에 띄지 않게 의사소통하라. 탭에 흰색 텍스트와 숫자 또는 느낌표가 포함된 빨간색 타원형 배지를 표시하여 해당 보기 또는 모드와 관련된 새 정보를 사용할 수 있음을 나타낼 수 있다. 자세한 내용은 [Notifications](https://developer.apple.com/design/human-interface-guidelines/notifications)를 참조하라.
    
- **Consider using SF Symbols to provide scalable, visually consistent tab bar items.** When you use [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols), tab bar items automatically adapt to different contexts. For example, the tab bar can be regular or compact, depending on the current device and orientation. Also, tab bar icons can appear above tab titles in portrait orientation, whereas in landscape, the icons and titles can appear side by side. Prefer filled symbols or icons for consistency with the platform. If your app uses a sidebar instead of a tab bar when it runs on iPad, switch the filled symbols or icons to the outlined variant in the sidebar.
    
    **SF Symbols를 사용하여 확장 가능(scalable)하고 시각적으로 일관(consistent)된 tab bar 아이템을 제공하라.** [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols)를 사용할 때 tab bar 아이템은 다른 컨텍스트에 자동으로 적용된다. 예를 들어 tab bar는 현재 디바이스 및 방향에 따라 일반(regular) 또는 소형(compact)일 수 있다. 또한 tab bar 아이콘은 portrait(세로) 방향일 경우 탭 제목 위에 나타날 수 있지만 landscape(가로) 방향일 경우 아이콘과 제목이 나란히 나타날 수 있다. 플랫폼과의 일관성을 위해 filled symbol 또는 icon을 선호한다. 앱이 iPad에서 실행될 때 tab bar 대신 sidebar를 사용하는 경우, filled symbol 또는 icon을 outlined variant로 전환한다.
    
    ![https://docs-assets.developer.apple.com/published/073de700f9e4471c237135b4e5d2e2a4/tab-bar-landscape@2x.png](https://docs-assets.developer.apple.com/published/073de700f9e4471c237135b4e5d2e2a4/tab-bar-landscape@2x.png)
    

If you need to create custom tab bar icons using bitmaps, create each icon in two sizes so that the tab bar looks good in both regular and compact environments. Use the following metrics when creating tab bar icons in different shapes. For guidance, see [Icons](https://developer.apple.com/design/human-interface-guidelines/icons).

비트맵을 사용하여 커스텀 tab bar 아이콘을 만들어야 하는 경우, 두 가지 크기로 각 아이콘을 만들어 regular 환경과 compact 환경 모두에서 tab bar가 잘 보이도록 한다. 자세한 내용은 [Icons](https://developer.apple.com/design/human-interface-guidelines/icons)을 참조하라.

### Target dimensions

- Circle

![https://docs-assets.developer.apple.com/published/26b47205d9825c5404ea773ed6729b94/tab-bars-max-width-height@2x.png](https://docs-assets.developer.apple.com/published/26b47205d9825c5404ea773ed6729b94/tab-bars-max-width-height@2x.png)

| Regular tab bars | Compact tab bars |
| --- | --- |
| 25x25 pt | 18x18 pt |
| 50x50 px @2x | 36x36 px @2x |
| 75x75 px @3x | 54x54 px @3x |

- Square

![https://docs-assets.developer.apple.com/published/dcc8daa9fb52d000d4310f6608a421c4/tab-bars-target-width@2x.png](https://docs-assets.developer.apple.com/published/dcc8daa9fb52d000d4310f6608a421c4/tab-bars-target-width@2x.png)

| Regular tab bars | Compact tab bars |
| --- | --- |
| 23x23 pt | 17x17 pt |
| 46x46 px @2x | 34x34 px @2x |
| 69x69 px @3x | 51x51 px @3x |

- Wide

![https://docs-assets.developer.apple.com/published/c6f2110e4f7da04a8edb66fd2c5f2871/tab-bars-target-width-height@2x.png](https://docs-assets.developer.apple.com/published/c6f2110e4f7da04a8edb66fd2c5f2871/tab-bars-target-width-height@2x.png)

| Regular tab bars | Compact tab bars |
| --- | --- |
| 31 pt | 23 pt |
| 62 px @2x | 46 px @2x |
| 93 px @3x | 69 px @3x |

- Tail

![https://docs-assets.developer.apple.com/published/c3f7f2f71d93e46207f7cba13747b529/tab-bars-target-height@2x.png](https://docs-assets.developer.apple.com/published/c3f7f2f71d93e46207f7cba13747b529/tab-bars-target-height@2x.png)

| Regular tab bars | Compact tab bars |
| --- | --- |
| 28 pt | 20 pt |
| 56 px @2x | 40 px @2x |
| 84 px @3x | 60 px @3x |
