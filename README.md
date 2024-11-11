# AsyncTimer

`AsyncTimer` is a modern Swift implementation of an asynchronous timer that provides flexible control over periodic task execution. Built with Swift's new concurrency system, it offers a clean and efficient way to handle repeating tasks with configurable intervals and counts.

## Features

- ⚡️ Async/await based implementation
- 🔄 Configurable periodic execution
- ⏱ Dynamic interval adjustment
- 🔢 Adjustable execution count (including infinite using `Int.infinity`)
- ⏯ Skip initial delay option
- 🎮 Full control over timer lifecycle
- 🧑‍💻 Simple and intuitive API
- 🔒 Thread-safe implementation

## Requirements

- iOS 13.0+ / macOS 10.15+
- Swift 5.5+
- Xcode 13.0+

## Installation

### Swift Package Manager

Add the following line to your `Package.swift` file's dependencies:

```swift
.package(url: "https://github.com/takaf51/AsyncTimer.git", from: "1.0.0")
```

## Usage

### Basic Usage

```swift
// Create a timer that executes every 2 seconds infinitely
let timer = Task.timer(interval: 2.0) { count in
    print("Timer fired: \(count)")
}

// Create a timer that executes 5 times
let finiteTimer = Task.timer(interval: 2.0, count: 5) { count in
    print("Timer fired: \(count)")
}

// Stop the timer when needed
timer.stop()
```

### With All Options

```swift
// Create a timer with custom configuration
let timer = Task.timer(
    interval: 2.0,
    count: 5,
    skipInitialDelay: true
) { count in
    print("Timer fired: \(count)")
}
```

### Timer Control

```swift
// Start the timer
timer.start()

// Stop the timer
timer.stop()

// Reset the count
timer.reset()

// Restart the timer (reset + start)
timer.restart()

// Check if timer is running
if timer.isRunning {
    print("Timer is active")
}
```

### Dynamic Updates

```swift
// Update interval
timer.updateInterval(1.0)  // Changes to 1 second interval

// Update total execution count
timer.updateCount(10)      // Changes to 10 executions
```


## API Reference

### Initialization

```swift
init(
    interval: Double,
    count: Int = .infinity,
    skipInitialDelay: Bool = false,
    action: @escaping (Int) -> Void
)
```

### Properties

- `isRunning: Bool` - Indicates if the timer is currently active

### Methods

- `start()` - Starts the timer
- `stop()` - Stops the timer
- `reset()` - Resets the execution count
- `restart()` - Combines reset and start operations
- `updateInterval(_ newInterval: Double)` - Updates the timer interval
- `updateCount(_ newCount: Int)` - Updates the total execution count

## License

AsyncTimer is available under the MIT license. See the LICENSE file for more info.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
