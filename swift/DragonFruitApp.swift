import SwiftUI

@main
struct DragonFruitApp: App {
    let engine = Engine()
    let model = Root()

    var body: some Scene {
        WindowGroup {
            ContentView(root: model)
        }
    }
}
