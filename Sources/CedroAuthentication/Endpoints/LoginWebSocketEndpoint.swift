import Foundation
import CedroAuthenticationData

public struct LoginWebSocketEndpoint: CedroHttpEndpoint {
    public var scheme: CedroHttpScheme
    public var host: String
    public var path: String = "/services/authfast/loginws"
    public var method: CedroHttpMethod = .get
    public var queryItems: [URLQueryItem]?
    public var headers: [CedroHttpHeader]?
    public var body: Data?
    
    public init(token: String, guidUser: String) throws {
        guard let stringUrl = CedroAuthentication.shared.environment.model?.apiUrls?.webfeederRestApiFacade,
              let urlComponents = URLComponents(string: stringUrl),
              let scheme = urlComponents.scheme,
              let host = urlComponents.host,
              let cedroHttpScheme = CedroHttpScheme(rawValue: scheme) else { throw CedroHttpError.invalidUrl }
        self.scheme = cedroHttpScheme
        self.host = host
        self.path = urlComponents.path + self.path
        self.headers = [.authorization(token: "Bearer \(token)")]
        self.queryItems = [URLQueryItem(name: "guidUser", value: guidUser)]
    }
}
