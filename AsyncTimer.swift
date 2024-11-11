final class AsyncTimer {
    private var task: Task<Void, Never>?
    private var currentCount: Int = 0
    private var interval: Double
    private var count: Double
    private let skipInitialDelay: Bool
    private let action: (Int) -> Void
    
    var isRunning: Bool { task != nil }
    
    init(
        interval: Double,
        count: Double = .infinity,
        skipInitialDelay: Bool = false,
        action: @escaping (Int) -> Void
    ) {
        self.interval = interval
        self.count = count
        self.skipInitialDelay = skipInitialDelay
        self.action = action
    }
    
    func start() {
        guard task == nil else { return }
        
        task = Task {
            while Double(currentCount) < count {
                if !skipInitialDelay || currentCount > 0 {
                    do {
                        try await Task<Never, Never>.sleep(for: .seconds(interval))
                    } catch {
                        break
                    }
                }
                
                currentCount += 1
                action(currentCount)
            }
            task = nil
        }
    }
    
    func stop() {
        task?.cancel()
        task = nil
    }
    
    func reset() {
        stop()
        currentCount = 0
    }
    
    func restart() {
        reset()
        start()
    }
    
    func updateInterval(_ newInterval: Double) {
        guard newInterval > 0 else { return }
        interval = newInterval
        if isRunning {
            restart()
        }
    }
    
    func updateCount(_ newCount: Double) {
        guard newCount > 0 else { return }
        count = newCount
        if isRunning && Double(currentCount) >= count {
            stop()
        }
    }
    
    deinit {
        stop()
    }
}

extension Task where Success == Void, Failure == Never {
    static func timer(
        interval: Double,
        count: Double = .infinity,
        skipInitialDelay: Bool = false,
        action: @escaping (Int) -> Void
    ) -> AsyncTimer {
        let timer = AsyncTimer(
            interval: interval,
            count: count,
            skipInitialDelay: skipInitialDelay,
            action: action
        )
        timer.start()
        return timer
    }
}
