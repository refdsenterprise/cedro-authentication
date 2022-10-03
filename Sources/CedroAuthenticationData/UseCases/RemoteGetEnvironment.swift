import CedroAuthenticationDomain

public class RemoteGetEnvironment: GetEnvironment, CedroHttpRequest {
    public typealias Response = EnvironmentModel
    public var httpClient: CedroHttpClient
    public var httpEndpoint: CedroHttpEndpoint
    
    public init(httpEndpoint: CedroHttpEndpoint, httpClient: CedroHttpClient) {
        self.httpClient = httpClient
        self.httpEndpoint = httpEndpoint
    }
    
    public func get() async -> GetEnvironment.Result {
        let result = await httpClient.request(self)
        switch result {
        case .success(let response): response.logger.console(); return .success(response)
        case .failure(let httpError): return .failure(.requestError(error: httpError))
        }
    }
}
