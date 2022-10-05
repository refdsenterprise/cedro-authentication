import Foundation

public struct LoginWebSocketModel: CedroModel {
    public let code: Int
    public let codeMessage: Bool
    public let tokenWS: String
}
