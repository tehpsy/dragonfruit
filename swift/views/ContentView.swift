import SwiftUI

struct ContentView: View {
    @ObservedObject var root: Root

    var body: some View {
        NavigationView {
            List(Strategy.allCases, id: \.self) { item in
                Text(item.text)
            }.navigationTitle("🐲🍎 DragonFruit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(root: Root())
            .preferredColorScheme(.dark)
    }
}
