# AsyncTimer

```swift
static func timer(
    interval: Double,
    count: Double = .infinity,
    skipInitialDelay: Bool = false,
    action: @escaping (Int) -> Void
) -> AsyncTimer
```

class
## Asynctimer
```func start()```
    start timer
```func stop()```
    stop timer
```func reset()```
    reset timer
```func restart()```
    restart timer
```func updateInterval(_ newInterval: Double)```
    assign new interval
```func updateCount(_ newCount: Double)```
    assign new count
