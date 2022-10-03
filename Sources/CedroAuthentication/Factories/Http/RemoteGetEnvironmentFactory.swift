import CedroAuthenticationDomain
import CedroAuthenticationData

func makeRemoteGetEnvironment(httpClient: CedroHttpClient) -> GetEnvironment {
    let remoteGetEnvironment = RemoteGetEnvironment(httpEndpoint: EnvironmentEndpoint(), httpClient: httpClient)
    return remoteGetEnvironment
}
