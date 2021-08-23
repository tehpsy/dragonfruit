import Combine

final class StrategyMACD: Codable, ObservableObject {
    @Published var fastPeriod: Int
    @Published var slowPeriod: Int
    @Published var signalPeriod: Int

    init() {
        self.fastPeriod = 0
        self.slowPeriod = 0
        self.signalPeriod = 0
    }

    enum CodingKeys: CodingKey {
        case fastPeriod
        case slowPeriod
        case signalPeriod
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(fastPeriod, forKey: .fastPeriod)
        try container.encode(slowPeriod, forKey: .slowPeriod)
        try container.encode(signalPeriod, forKey: .signalPeriod)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        fastPeriod = try container.decode(Int.self, forKey: .fastPeriod)
        slowPeriod = try container.decode(Int.self, forKey: .slowPeriod)
        signalPeriod = try container.decode(Int.self, forKey: .signalPeriod)
    }
}
