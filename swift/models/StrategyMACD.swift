final class StrategyMACD: Codable {
    let fastPeriod: Int
    let slowPeriod: Int
    let signalPeriod: Int

    init(
        fastPeriod: Int,
        slowPeriod: Int,
        signalPeriod: Int
    ) {
        self.fastPeriod = fastPeriod
        self.slowPeriod = slowPeriod
        self.signalPeriod = signalPeriod
    }
}
