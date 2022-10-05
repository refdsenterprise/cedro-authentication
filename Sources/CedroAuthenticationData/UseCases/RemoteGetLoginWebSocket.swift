import CedroAuthenticationDomain

public class RemoteGetLoginWebSocket: GetLoginWebSocket, CedroHttpRequest {
    public typealias Response = LoginWebSocketModel
    public var httpClient: CedroHttpClient
    public var httpEndpoint: CedroHttpEndpoint
    
    public init(httpEndpoint: CedroHttpEndpoint, httpClient: CedroHttpClient) {
        self.httpClient = httpClient
        self.httpEndpoint = httpEndpoint
    }
    
    public func get() async -> GetLoginWebSocket.Result {
        let result = await httpClient.request(self)
        switch result {
        case .success(let response): return .success(response)
        case .failure(let httpError): return .failure(.requestError(error: httpError))
        }
    }
}
