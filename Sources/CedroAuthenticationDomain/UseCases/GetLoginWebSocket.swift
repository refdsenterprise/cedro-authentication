import Foundation

public protocol GetLoginWebSocket {
    typealias Result = Swift.Result<LoginWebSocketModel, CedroError>
    func get() async -> Result
}
