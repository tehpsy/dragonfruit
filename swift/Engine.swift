import Foundation
import Combine

class Engine
{
    let root: Root
    private var listeners: Set<AnyCancellable> = Set()

    init(
        root: Root
    ) {
        self.root = root

        root.strategyMACD
            .objectWillChange
            .sink(receiveValue: { [weak self] result in
                self?.updateMACD()
            })
            .store(in: &listeners)

        root.strategyGoldenCross
            .objectWillChange
            .sink(receiveValue: { [weak self] result in
                self?.updateGoldenCross()
            })
            .store(in: &listeners)
    }

    func updateMACD() {
        rust_macd(
            UInt(root.strategyMACD.slowPeriod),
            UInt(root.strategyMACD.fastPeriod),
            UInt(root.strategyMACD.signalPeriod)
        )
    }

    func updateGoldenCross() {
        rust_golden_cross(
            UInt(root.strategyGoldenCross.slowPeriod),
            UInt(root.strategyGoldenCross.fastPeriod),
            UInt(root.strategyGoldenCross.signalPeriod)
        )
    }
}
