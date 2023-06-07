# Navigation bars

**A navigation bar appears at the top of an app screen, helping people navigate through a hierarchy of content.**

navigation bar는 앱 화면 상단에 나타나 사용자가 콘텐츠 계층을 탐색할 수 있도록 도와준다.

![https://docs-assets.developer.apple.com/published/f5bdbf47de5e0a7ef49ae6192a417fd5/components-navigation-bar-intro@2x.png](https://docs-assets.developer.apple.com/published/f5bdbf47de5e0a7ef49ae6192a417fd5/components-navigation-bar-intro@2x.png)

A navigation bar also provides a natural place to display a screen’s title — helping people orient themselves in your app or game — and it can include controls that affect the screen’s content.

또한 navigation bar는 화면 제목을 자연스럽게 표시할 수 있는 위치(사용자가 앱이나 게임에서 방향을 잡을 수 있도록 도와줌)를 제공하며 화면 내용에 영향을 미치는 컨트롤을 포함할 수 있다.

macOS doesn’t provide a navigation bar. To support navigation in a macOS app, you often use a [sidebar](https://developer.apple.com/design/human-interface-guidelines/sidebars) or a navigation control like a Back button in a [toolbar](https://developer.apple.com/design/human-interface-guidelines/toolbars). Also, you typically display the title of a macOS [window](https://developer.apple.com/design/human-interface-guidelines/windows) in the title bar.

macOS는 navigation bar를 제공하지 않는다. macOS 앱에서 탐색을 지원하기 위해 [sidebar](https://developer.apple.com/design/human-interface-guidelines/sidebars)나 [toolbar](https://developer.apple.com/design/human-interface-guidelines/toolbars)의 Back 버튼과 같은 탐색 컨트롤을 사용하는 경우가 많다. 또한 일반적으로 제목 표시줄에 macOS 창의 제목을 표시한다.

## Best practices

**Use the title area to describe the current screen if it provides useful context.** A screen’s title helps people confirm their location as they navigate your app. However, if titling a navigation bar seems redundant, you can leave the title area empty. For example, Notes doesn’t title the current note because the first line of content typically supplies sufficient context. Your app’s name doesn’t provide useful information about the screen or your content hierarchy, so it doesn’t work well as a title.

**현재 화면이 유용한 컨텍스트를 제공하는 경우 제목 영역을 사용하여 화면을 설명한다.** 화면 제목은 사용자가 앱을 탐색할 때 자신의 위치를 확인하는 데 도움이 된다. 그러나 navigation bar의 제목이 중복되는 경우 제목 영역을 비워둘 수 있다. 예를 들어, 내용의 첫번째 줄은 일반적으로 충분한 컨텍스트를 제공하므로 Notes는 현재 메모의 제목을 지정하지 않는다. 앱 이름은 화면이나 콘텐츠 계층에 대한 유용한 정보를 제공하지 않으므로 제목으로 적합하지 않다.

**Write a concise screen title.** Aim for a word or short phrase that distills the purpose of the screen. Using no more than about 15 characters tends to work well in most screens because it leaves enough room for a back button and optional controls.

**간결한 화면 제목을 작성하라.** 화면의 목적을 구체화하는 단어나 짧은 문구를 목표로 한다. 약 15자 이하를 사용하면 back 버튼과 optional control을 위한 충분한 공간이 남기 때문에 대부분의 화면에서 잘 작동한다.

**Consider temporarily hiding the navigation bar to provide a more immersive experience.** For example, Photos hides the navigation bar and other interface elements when people view full-screen photos. If you implement this type of behavior, let people restore the navigation bar by tapping the screen or swiping down.

**보다 몰입적인 환경을 제공하기 위해 navigation bar를 일시적으로 숨기는 것이 좋다.** 예를 들어, Photos는 full-screen 사진을 볼 때 navigation bar와 기타 인터페이스 요소를 숨긴다. 이러한 유형의 동작을 구현하는 경우, 화면을 탭하거나 아래로 쓸어내려서 navigation bar를 복원할 수 있다.

**Use the standard back button.** People know that the standard back button lets them retrace their steps through a hierarchy of information. If you implement a custom back button, make sure it still looks like a back button, behaves as people expect, matches the rest of your interface, and is consistently implemented throughout your app or game. If you replace the system-provided back button chevron with a custom image, you may need to supply a custom mask image, too. For example, iOS uses this mask to animate the button title during transitions.

**표준 back button을 사용한다.** 사람들은 표준 back button을 사용하여 정보 계층을 통해 자신의 단계를 다시 추적할 수 있다는 것을 알고 있다. custom back botton을 구현하는 경우, back button 처럼 보이고, 사람들이 예상하는 대로 작동하고, 인터페이스의 나머지 부분과 일치하며, 앱이나 게임 전반에 걸쳐 일관되게 구현되는지 확인한다. 시스템에서 제공하는 back button chevron을 사용자 지정 이미지로 교체하는 경우 사용자 지정 mask image도 제공해야 할 수 있다. 예를 들어, iOS는 전환 중에 버튼 제목을 애니메이션화하기 위해 이 마스크를 사용한다.

**Make sure buttons that use text labels have enough room.** If your navigation bar includes more than one text-labeled button, the text of those buttons may appear to run together, making the buttons indistinguishable. Add separation by inserting a fixed-space item between the buttons. For developer guidance, see [UIBarButtonSystemItemFixedSpace](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/uibarbuttonsystemitemfixedspace).

**텍스트 레이블을 사용하는 버튼의 공간이 충분한지 확인한다.** navigation bar에 텍스트 레이블이 지정된 버튼이 두 개 이상 있는 경우, 해당 버튼의 텍스트가 함께 실행되어 버튼을 구분할 수 없는 것처럼 보일 수 있다. 버튼 사이에 fixed-space item을 삽입하여 분리한다. 개발자 지침은 [UIBarButtonSystemItemFixedSpace](https://developer.apple.com/documentation/uikit/uibarbuttonsystemitem/uibarbuttonsystemitemfixedspace)을 참조하라.

### Platform consideration

### iOS, iPadOS

**Consider using a segmented control in a navigation bar to flatten the information hierarchy.** For example, Phone uses a segmented control in the navigation bar of the Recents tab to let people switch between viewing all recent calls or only missed ones. If a design like this makes sense in your app, place a segmented control in the navigation bar only at the top level of the hierarchy, and be sure to create accurate back-button labels for the second-level screens. For guidance, see [Segmented controls](https://developer.apple.com/design/human-interface-guidelines/segmented-controls).

**Navigation bar에서 segmented control을 사용하여 정보 계층을 평평하게 만드는 것을 고려해 봐라.** 예를 들어, Phone은 Recents 탭의 navigation bar에 있는 segmented control을 사용하여 사용자가 최근의 모든 통화 또는 부재중 전화만 볼 수 있도록 전환한다. 이와 같은 디자인이 앱에 적용되는 경우 계층의 최상위 수준에만 segemented control을 배치하고 두 번째 수준 화면에 대한 정확한 back button을 생성해야 한다. 자세한 내용은 [Segmented controls](https://developer.apple.com/design/human-interface-guidelines/segmented-controls)를 참조하라.

**Use a large title to help people stay oriented as they navigate and scroll.** For example, Phone uses the large title to clarify the active tab, while Music uses large titles to differentiate content areas like albums, artists, playlists, and radio. By default, a large title transitions to a standard title as people begin scrolling the content, and transitions back to large when people scroll to the top, reminding them of their current location. For developer guidance, see [prefersLargeTitles](https://developer.apple.com/documentation/uikit/uinavigationbar/2908999-preferslargetitles).

**Large title을 사용하여 사용자가 탐색하고 스크롤할 때 방향을 유지할 수 있다.** 예를 들어, Phone은 large title을 사용하여 활성 탭을 명확히 하는 반면 Music은 large title을 사용하여 albums, artists, playlists, radio와 같은 콘텐츠 영역을 구분한다. 기본적으로 large title은 사람들이 내용을 스크롤하기 시작할 때 standard title으로 전환되고, 사람들이 맨 위로 스크롤하여 현재 위치를 상기시키면 다시 large title으로 전환된다. 개발자 지침은 [prefersLargeTitles](https://developer.apple.com/documentation/uikit/uinavigationbar/2908999-preferslargetitles)을 참조하라.

![https://docs-assets.developer.apple.com/published/64bf477af9262d7c9b12e0aebe8ef1f1/navigation-bar-standard@2x.png](https://docs-assets.developer.apple.com/published/64bf477af9262d7c9b12e0aebe8ef1f1/navigation-bar-standard@2x.png)

Standard title

![https://docs-assets.developer.apple.com/published/0e3fa2350b27ffbbe840a57281bbaabf/navigation-bar-large@2x.png](https://docs-assets.developer.apple.com/published/0e3fa2350b27ffbbe840a57281bbaabf/navigation-bar-large@2x.png)

Large title

**Consider hiding the border of a large-title navigation bar to enhance the sense of connection between title and content.** Use caution applying this design to a standard-title navigation bar, though, because the bar’s title and buttons might be harder to distinguish without a visible border. In contrast, you might want to maintain consistency between the primary and secondary views in a Split View on iPad by using the borderless style in both. You can hide the bottom border of a navigation bar by removing the bar’s shadow (the border automatically reappears when people scroll the content area).

**제목과 콘텐츠 간의 연결을 강화하기 위해 large-title navigation bar의 border을 숨기는 것을 고려한다.** 그러나 이 디자인을 standard-title navigation bar에 적용할 때는 border가 보이지 않으면 bar의 제목과 버튼을 구분하기 어려울 수 있으므로 주의하라. 반대로 iPad의 split view에서 primary와 secondary view 모두에서 borderless 스타일을 사용하여 일관성을 유지할 수 있다. Bar의 그림자를 제거하여 navigation bar의 아래쪽 테두리를 숨길 수 있다(사용자가 콘텐츠 영역을 스크롤할 때 테두리가 자동으로 다시 나타난다).

### watchOS

The navigation bar appears at the top edge of the Apple Watch screen. The system offers space for a title in the leading end of the navigation bar and displays the clock in the trailing end.

navigation bar는 Apple Watch 화면의 상단 가장자리에 나타난다. 시스템은 navigation bar의 앞쪽 끝에 제목 공간을 제공하고 뒤쪽 끝에 시계를 표시한다.

The title area can include navigational elements in two cases.

제목 영역에는 두가지 경우에 탐색 요소가 포함될 수 있다.

An app that uses hierarchical navigation displays a back button next to the title of a detail screen. You can’t customize the back button icon.

계층 탐색을 사용하는 앱은 세부 화면 제목 옆에 back button을 표시한다. back button 아이콘은 customize 할 수 없다.

![https://docs-assets.developer.apple.com/published/66e2d12539b0fc6bd48fe5f8881c1921/status-bar-hierarchical-ui@2x.png](https://docs-assets.developer.apple.com/published/66e2d12539b0fc6bd48fe5f8881c1921/status-bar-hierarchical-ui@2x.png)

In a modal sheet, the system covers the clock and displays the button that dismisses the sheet in the title area.

모달 시트에서 시스템은 시계를 덮고 제목 영역에 시트를 해제하는 버튼을 표시한다.

![https://docs-assets.developer.apple.com/published/e7ebf1aa5233477c5d8ada5680c92a31/status-bar-modal-sheet@2x.png](https://docs-assets.developer.apple.com/published/e7ebf1aa5233477c5d8ada5680c92a31/status-bar-modal-sheet@2x.png)

**Important**

The clock appears in the navigation bar of every nonmodal app screen. You can’t remove the clock, so be sure to account for it in your designs.

시계는 모든 nonmodal 앱 화면의 navigation bar에 나타난다. 당신은 시계를 제거할 수 없으므로, 당신의 디자인에 그것을 반드시 고려해야 한다.

The system uses the minimum layout margins to inset both your title and the clock from the edges of the screen, particularly on Apple Watch Series 4 and later (shown below). For guidance, see [Layout](https://developer.apple.com/design/human-interface-guidelines/layout).

시스템은 특히 Apple Watch Series 4 이상(아래 그림 참조)에서 최소 레이아웃 여백을 사용하여 화면 가장자리에 제목과 시계를 모두 삽입한다. 자세한 내용은 [Layout](https://developer.apple.com/design/human-interface-guidelines/layout)을 참조하라.

![https://docs-assets.developer.apple.com/published/897c532e9c1d070a954062ea98471e7a/status-bar-guides@2x.png](https://docs-assets.developer.apple.com/published/897c532e9c1d070a954062ea98471e7a/status-bar-guides@2x.png)