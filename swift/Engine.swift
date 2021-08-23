import Foundation

class Engine
{
    init() {}

    func macd(fast: Int, slow: Int, signal: Int) {
        rust_macd(UInt(fast), UInt(slow), UInt(signal))
    }

    func goldenCross(fast: Int, slow: Int, signal: Int) {
        rust_golden_cross(UInt(fast), UInt(slow), UInt(signal))
    }
}
