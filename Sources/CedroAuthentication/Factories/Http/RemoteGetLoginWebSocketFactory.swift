import CedroAuthenticationDomain
import CedroAuthenticationData

func makeRemoteGetLoginWebSocket(httpClient: CedroHttpClient, token: String, guidUser: String) throws -> GetLoginWebSocket {
    let remoteGetLoginWebSocket = RemoteGetLoginWebSocket(httpEndpoint: try LoginWebSocketEndpoint(token: token, guidUser: guidUser), httpClient: httpClient)
    return remoteGetLoginWebSocket
}
