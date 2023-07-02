# 2020 WidgetKit

<aside>
💡 **Three main goals of widget**

</aside>

- Glanceable
- Relevant
- Personalization

<aside>
☝🏻 **WidgetKit**

</aside>

😮 The average person goes to the Home Screen more than 90 times a day.

### How WidgetKit works

- Timeline allows views to be ready up front
- Can refresh from your main app
- Schedule updates from extension

### 1. How to define a widget

`kind`

`configuration`

- StaticConfiguration
- IntentConfiguration

`supportedFamilies`

- systemSmall
- systemMedium
- systemLarge

`placeholder`

- Default content
- No user data

```swift
@main
public struct SampleWidget: Widget {
    private let kind: String = "SampleWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind,
                            provider: Provider(),
                            placeholder: PlaceholderView()) { entry in
                                SampleWidgetEntryView(entry: entry)
                            }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
```

### 2. How to create a glanceable experience

- creating Stateless UI, which SwiftUI is uniquely perfect for.
- Widgets are not mini-apps
- No scrolling
- No videos or animated images
- Tap interactions

**Deep links**

e.g. Music

- systemSmall - the entire widget is a tap target meant to take the user directly into the app.
- systemMedium - Each album is an individual link, which can take you directly into that app.

➰ The entire widget can be associated with a URL link using the widget URL API.

➰ If you wanna create sub-links in systemMedium or systemLarge, then you can use the new link API in SwiftUI.

### Views, timelines and reloads

There are three types of UI experiences you need to think about: Placeholder UI, snapshot and timeline.

**Views**

- Single entry in time
- Return quickly

**Timeline**

- Timeline's returns should be for both dark and light mode.
- Timelines should typically be returned for days' worth of content.

**Reloads**

- Reloads are where the system will wake up your extension and ask for a new timeline for each widget placed on the device.
- Reloads help ensure that your content is always up-to-date for your user.

```swift
public struct Provider: TimelineProvider {

    public func snapshot(with context: Context, 
                         completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    public func timeline(with context: Context, 
                         completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date())
        let timeline = Timeline(entries: [entry, entry], policy: .atEnd)
        completion(timeline)
    }
}
```

**ReloadPolicy**

- `atEnd` - You can ask for a reload at the end of the timeline you provide
- `after(date: Date`) - after a particular date
- `never` - explicitly tell the system to not reload your timeline.

**System reloads**

- ReloadPolicy
- Widgets viewed frequenty receive more reloads
- Environment changes

**WidgetCenter**

- `reloadTimelines(ofKind:)`
- `reloadAllTimelines`
- `getCurrentConfigurations(completion:)`

**URLSessions**

- Background sessions - kick off a task and your payload will be delivered to your extension via the onBackgroundURLSessionEvents modifier.
- `onBackgroundURLSessionEvents`
- Batch requests

**Reloads**

- Background reloads are budgeted
- Be efficient
- Networking, Timeline, App-based

### Personalization and intelligence

**How WidgetKit works**

- Intents framework
- Parameters
- Used with Siri, Shortcuts, and now widgets

```swift
@main
public struct SampleWidget: Widget {
    private let kind: String = "SampleWidget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                    intent: ConfigurationIntent.self
                            provider: Provider(),
                            placeholder: PlaceholderView()) { entry in
                                SampleWidgetEntryView(entry: entry)
                            }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
```

```swift
public struct Provider: IntentTimelineProvider {

    public func timeline(for configuration: ConfigurationIntent, with context: Context, 
                         completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)

        // generate a timeline based on the values of the Intent

       completion(timeline)
    }
}
```

**Intelligence**

- Shortcuts donation
- `TimelineEntryRelevance`
    - `score`
    - `duration`
    - Relative to all entries you have ever provided

<aside>
🔚 **Wrap up**

</aside>

- Widgets are not mini-apps
- Glanceable
- Timelines, reloads, and intelligence