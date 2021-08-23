import SwiftUI

struct ContentView: View {
    @ObservedObject var root: Root

    var body: some View {
        NavigationView {
            List(Strategy.allCases, id: \.self) { item in
                NavigationLink(
                    destination: MACDView(strategy: strategy(for: item))
                ) {
                    Text(item.text)
                }
            }.navigationTitle("🐲🍎 DragonFruit")
        }
    }

    func strategy(for strategy: Strategy) -> StrategyMACD {
        switch strategy {
        case .macd: return root.strategyMACD
        case .goldenCross: return root.strategyGoldenCross
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(root: Root())
            .preferredColorScheme(.dark)
    }
}
