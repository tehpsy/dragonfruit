import SwiftUI

@main
struct DragonFruitApp: App {
    let engine: Engine
    let model = Root()

    init() {
        self.engine = Engine(root: model)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(root: model)
        }
    }
}
