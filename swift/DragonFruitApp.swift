import SwiftUI

@main
struct DragonFruitApp: App {
    let viewModel = RustWrapper()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
