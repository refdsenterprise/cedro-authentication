import CedroAuthenticationDomain
import CedroAuthenticationData

func makeRemoteAddLogin(httpClient: CedroHttpClient) throws -> AddLogin {
    let remoteAddLogin = RemoteAddLogin(httpEndpoint: try LoginEndpoint(), httpClient: httpClient)
    return remoteAddLogin
}
