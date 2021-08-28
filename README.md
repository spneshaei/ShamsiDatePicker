# ShamsiDatePicker

An easy-to-use SwiftUI iOS/watchOS date picker for Shamsi (Persian) calendar.

<p float="left">
<img alt="ShamsiDatePicker in iOS" src="images/iPhone.png?raw=true" width="350" />
<img alt="ShamsiDatePicker in iOS with Dark Mode" src="images/iPhoneDark.png?raw=true" width="350" />
</p>
<p float="left">
<img alt="ShamsiDatePicker in Apple Watch" src="images/Watch.png?raw=true" width="300" />
<img alt="ShamsiDatePicker in Apple Watch used in a `Form` view" src="images/WatchForm.png?raw=true" width="300" />
</p>

## Features

- Pure (100%) SwiftUI implementation
- Full support for Shamsi (Persian) calendar, including weekday names and leap years 
- Easy to customize various properties, such as minimum and maximum date allowed
- Simple to use in various views by adding a single line of code
- Support for both iOS (13.0 +) and watchOS (7.0 +) apps with great-looking styles
- Compact style when used in watchOS `Form`s

## Installation

`ShamsiDatePicker` can easily be installed using Swift Package Manager (SPM).

1. Open your project in Xcode.
2. Click `File -> Swift Packages -> Add Package Dependency...`
3. Add `https://github.com/spneshaei/ShamsiDatePicker.git` as a package

## Usage

### Basic Usage

To use `ShamsiDatePicker` in a SwiftUI view, you should import `ShamsiDatePicker` first:
```Swift
import ShamsiDatePicker
```
Then, you can start using `ShamsiDatePicker`:
```Swift
struct ContentView: View {
    @State var date = Date()
    
    var body: some View {
        ShamsiDatePicker(selectedDate: $date)
    }
}
```
### Setting a Range of Supported Dates

To specify the minimum and maximum possible-to-select dates from `ShamsiDatePicker`, you can specify those dates in `ShamsiDatePicker`s initializer:
```Swift
ShamsiDatePicker(selectedDate: $date, minDate: Date(timeIntervalSince1970: 0), maxDate: Date())
```

### Using `ShamsiDatePicker` in SwiftUI `Form`s

`ShamsiDatePicker` works with SwiftUI `Form`s out of the box. When using `ShamsiDatePicker` in watchOS, using `ShamsiDatePicker` in a `Form` will result in a compact date picker, suitable for the Apple Watch's small display. When you use `ShamsiDatePicker` outside of the `Form` view, `ShamsiDatePicker` will be rendered as a wheel scrolling view, similar to its iOS counterpart.

## License

To see the license which is applied to all the files in the current repository, open `LICENSE`. 
