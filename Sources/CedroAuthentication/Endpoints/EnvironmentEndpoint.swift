import CedroAuthenticationData

public struct EnvironmentEndpoint: CedroHttpEndpoint {
    public var scheme: CedroHttpScheme = .https
    public var host: String = "web.plataformafasttrade.com.br"
    public var path: String = "/assets/config/env.json"
    public var method: CedroHttpMethod = .get
}
