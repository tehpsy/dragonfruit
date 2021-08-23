import SwiftUI

struct MACDView: View {
    @ObservedObject var strategy: StrategyMACD

    var body: some View {
        VStack {
            VStack {
                Text("Slow")
                Slider(
                    value: slowBinding,
                    in: 0...10,
                    step: 1.0) {
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("MACD")
    }

    var slowBinding: Binding<Double> {
        Binding<Double>(get: {
            return Double(strategy.slowPeriod)
        }, set: {
            strategy.slowPeriod = Int($0)
        })
    }
}

struct MACDView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MACDView(strategy: StrategyMACD())
        }
    }
}
