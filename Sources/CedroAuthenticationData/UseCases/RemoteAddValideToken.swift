import CedroAuthenticationDomain

public class RemoteAddValideToken: AddValideToken, CedroHttpRequest {
    public typealias Response = ValideTokenModel
    public var httpClient: CedroHttpClient
    public var httpEndpoint: CedroHttpEndpoint
    
    public init(httpEndpoint: CedroHttpEndpoint, httpClient: CedroHttpClient) {
        self.httpClient = httpClient
        self.httpEndpoint = httpEndpoint
    }
    
    public func add(withBody requestBody: AddValideTokenModel) async -> AddValideToken.Result {
        httpEndpoint.body = requestBody.asData
        let result = await httpClient.request(self)
        switch result {
        case .success(let response):
            if let statusCode = Int(response.code), statusCode != 200, let url = httpEndpoint.url {
                return .failure(.requestError(error: CedroHttpError.unauthorized(statusCode: statusCode, url: url)))
            }
            return .success(response)
        case .failure(let httpError): return .failure(.requestError(error: httpError))
        }
    }
}
