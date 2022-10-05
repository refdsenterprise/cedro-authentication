import Foundation
import RefdsDomain

public struct LoginModel: CedroModel {
    public let code: String?
    public let codeMessage: String?
    public let accountNumber: String
    public let tokenWS: String
    public let tokenWsGraphic: String
    public let guidUser: String
    public let token: String
    public let expiration: Date?
    
    enum CodingKeys: String, CodingKey {
        case code
        case codeMessage
        case accountNumber
        case tokenWS
        case tokenWsGraphic
        case guidUser
        case token
        case expiration
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        codeMessage = try values.decodeIfPresent(String.self, forKey: .codeMessage)
        accountNumber = try values.decode(String.self, forKey: .accountNumber)
        tokenWS = try values.decode(String.self, forKey: .tokenWS)
        tokenWsGraphic = try values.decode(String.self, forKey: .tokenWsGraphic)
        guidUser = try values.decode(String.self, forKey: .guidUser)
        token = try values.decode(String.self, forKey: .token)
        let expirationString = try values.decode(String.self, forKey: .expiration)
        expiration = expirationString.asDate(withFormat: "yyyy-MM-ddTHH:mm:ssZ")
    }
}
