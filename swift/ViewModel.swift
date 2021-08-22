import Foundation

class RustWrapper {
    init() {
        let result = rust_hello("world")
        let swift_result = String(cString: result!)
        rust_hello_free(UnsafeMutablePointer(mutating: result))
        print(swift_result)
    }
}
