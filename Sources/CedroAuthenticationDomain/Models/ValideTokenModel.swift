import Foundation
import RefdsDomain

public struct ValideTokenModel: CedroModel {
    public let code: String
    public let accountNumber: String
    public let guidUser: String
    public let token: String
}
