import CedroAuthenticationDomain
import CedroAuthenticationData

func makeRemoteAddValideToken(httpClient: CedroHttpClient, token: String) throws -> AddValideToken {
    let remoteAddValideToken = RemoteAddValideToken(httpEndpoint: try ValideTokenEndpoint(token: token), httpClient: httpClient)
    return remoteAddValideToken
}
