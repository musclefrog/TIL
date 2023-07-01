# 2022 WeatherKit

[https://developer.apple.com/videos/play/wwdc2022/10003/](https://developer.apple.com/videos/play/wwdc2022/10003/)

<aside>
🔑 **Features**

</aside>

- Powered by Apple Weather Service
- High-resolution weather models
- Machine learning weather models
- Hyperlocal weather forecasts around the globe
- Location used only for weather forecasts
- No personally identifying information
- Never shared or sold

<aside>
📦 **Available datasets**

</aside>

### 1. Current weather

- describes “now” conditions at the requested location.
    
    
    | Apparent temperature | Cloud cover | Condition | Dew point |
    | --- | --- | --- | --- |
    | Humidity | Pressure | Pressure trend | Temperature |
    | UV index | Visibility | Wind direction | Wind gust |
    | Wind speed |  |  |  |

### 2. Minute forecast

- contains minute-by-minute precipitation conditions for the next hour where available.
- useful for deciding whether or not to bring an umbrella with you as you walk out the door. ☔️
    
    
    | Precipitation chance | Precipitation intensity |
    | --- | --- |

### 3. Hourly forecast

- collection of forecasts starting on the current hour and provides data for up to 240 hours.
    
    
    | Apparent temperature | Cloud cover | Condition | Dew point |
    | --- | --- | --- | --- |
    | Humidity | Pressure | Pressure trend | Temperature |
    | UV index | Visibility | Wind direction | Wind gust |
    | Wind speed |  |  |  |

### 4. Daily forecast

- contains a forecast collection of 10 days.
- provides information about the entire day like the high and low temperature, sunrise, and sunset.
    
    
    | High temperature | Low temperature | Moon phase |
    | --- | --- | --- |
    | Moonset | Precipitation amount | Snowfall amount |
    | Sunrise | Sunset | Wind direction |

### 5. Weather alerts

- contains severe weather warnings issued for the requested location.
- contains important information to keep your users safe, informed, and prepared.
    
    
    | Region | Severity | Source | Summary |
    | --- | --- | --- | --- |

### 6. Historical weather

- provides saved weather forecasts from the past, so you can see trends in weather data.
- You can access historical data by specifying a start and end date to the hourly and daily requests.
    
    
    | Apparent temperature | Cloud cover | Condition | Dew point |
    | --- | --- | --- | --- |
    | High temperature | Humidity | Low temperature | Moon phase |
    | Moonrise | Moonset | Precipitation amount | Precipitation chance |
    | Precipitation intensity | Pressure | Pressure trend | Snowfall amount |
    | Sunrise | Sunset | Temperature | UV index |
    | Visibility | Wind direction | Wind gust | Wind speed |
    

<aside>
☄️ **Requesting weather**

</aside>

### How do we request this weather data with the WeatherKit APIs?

- Apple Weather data is available through both a **native framework** and a set of **REST APIs**.

⬇️ with Swift framework: native framework

```swift
// Request the weather

import WeatherKit // import WeatherKit
import CoreLocation // import CoreLocation

// create a weatherService object as your entry point for the Weather Service.
let weatherService = WeatherService() 

// create a CLLocation with coordinates for your location of interest.
// Syracuse, New York
let syracuse = CLLocation(latitude: 43, longitude: -76) 

// call weather(for:) on the weatherService instance and pass in the location created above.
let weather = try! await weatherService.weather(for: syracuse)

// you can access the relevant data you need for your app
let temperature = weather.currentWeather.temperature
let uvIndex = weather.currentWeather.uvIndex
```

e.g. Travel app in SwiftUI

1. **Enable WeatherKit** - Register the App ID in the Developer Portal, then select the Capability and App Services tabs to enable WeatherKit.
2. **In Xcode**, add the WeatherKit capability to the project.
3. How to get the weather data for each of these locations?

```swift
struct Airport: Hashable {
		var code: String
		var name: String
		var city: String
		var region: String
		var country: String
		var elevation: Double
		var latitude: Double
		var longitude: Double

		var location: CLLocation {
				.init(latitude: latitude, longitude: longitude)
		}
}

// get the hourly forecast by calling weather(for:) on our shared weather service,
// and then pass in our airport location.
@discardableResult
func hourlyForecast(for airport: Airport) async -> Forecast<HourWeather>? {
		let hourWeather = await Task.detached(priority: .userInitiated) {
				let forecast = try? await WeatherService.shared.weather(
						for: airport.location,
						including: .hourly)
				return forecast
		}.value
		_hourlyForecasts[airport.id] = hourWeather
		return hourWeather
}
```

1. Display attribution for the data sources in my app.

```swift
struct ContentView: View {
		var body: some View {

				// ...

				.task {
						do {
								let attribution = try await WeatherService.shared.attribution

								// get the attribution URL from the attribution.legalPageURL property.
								// This is a link to the legal attribution page that contains copyright information about the weather data sources.
								attributionLink = attribution.legalPageURL

								// also need to get the URL for the combined Apple Weather mark.
								// available in both light and dark variants
								attributionLogo = colorScheme == .light ? attribution.combinedMarkDarkURL : attribution.combinedMarkLightURL

						} catch {
								print(error)
						}
				}
		}
}
```

---

⬇️ with REST API: can be used on any platform

```java
// Request weather alerts

// Request a token
const tokenResponse = await fetch('https://example.com/token');
const token = await tokenResponse.text();

// Get my weather object
const url = "https://weatherkit.apple.com/1/weather/en-US/41.029/-74.642?dataSets=weatherAlerts&country=US"

const weatherResponse = await fetch(url, {
		headers: {
				"Authrization": token
		}
});
const weather = await weatherResponse.json();

// Check for active weather alerts
const alerts = weather.weatherAlerts;
const detailsUrl = weather.weatherAlerts.detailsUrl;
```

### WeatherKit REST API auth

[Your server]

[JSON Web Token signing service ↔ Application] → WeatherKit REST API

### JWT signing service

- Create JSON Web Token header
- Create JSON Web Token payload
- Return signed JSON Web Token

<aside>
📄 **Publishing requirements**

</aside>

- Required for both Swift and REST API
- Display active link to attribution
- Display Apple Weather logo
- Provide link to Weather alert attribution

<aside>
🔚 **Wrap-up**

</aside>

- Hyperlocal forecasts powered by Apple Weather
- Swift framework for Apple platforms
- REST API for anywhere