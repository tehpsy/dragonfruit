import Combine

enum Strategy: Int, CaseIterable, Codable {
    case macd
    case goldenCross

    var text: String {
        switch self {
        case .macd: return "MACD"
        case .goldenCross: return "Golden Cross"
        }
    }
}

final class Root: Codable, ObservableObject {
    @Published var strategyMACD: StrategyMACD
    @Published var strategyGoldenCross: StrategyMACD
    @Published var strategy: Strategy

    enum CodingKeys: CodingKey {
        case strategyMACD
        case strategyGoldenCross
        case strategy
    }

    init() {
        self.strategyMACD = StrategyMACD()
        self.strategyGoldenCross = StrategyMACD()
        self.strategy = .macd
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(strategyMACD, forKey: .strategyMACD)
        try container.encode(strategyGoldenCross, forKey: .strategyGoldenCross)
        try container.encode(strategy, forKey: .strategy)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        strategyMACD = try container.decode(StrategyMACD.self, forKey: .strategyMACD)
        strategyGoldenCross = try container.decode(StrategyMACD.self, forKey: .strategyGoldenCross)
        strategy = try container.decode(Strategy.self, forKey: .strategy)
    }
}
