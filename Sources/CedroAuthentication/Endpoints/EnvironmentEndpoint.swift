import Foundation
import CedroAuthenticationData

public struct EnvironmentEndpoint: CedroHttpEndpoint {
    public var scheme: CedroHttpScheme = .https
    public var host: String = "web.plataformafasttrade.com.br"
    public var path: String = "/assets/config/env.json"
    public var method: CedroHttpMethod = .get
    public var queryItems: [URLQueryItem]? = nil
    public var headers: [CedroHttpHeader]? = nil
    public var body: Data? = nil
}
