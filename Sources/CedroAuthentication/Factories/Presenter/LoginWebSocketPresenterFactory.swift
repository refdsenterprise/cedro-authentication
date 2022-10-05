import Foundation
import CedroAuthenticationPresentation

func makeLoginWebSocketPresenter(delegate: LoginWebSocketPresenterDelegate, token: String, guidUser: String) throws -> LoginWebSocketPresenter {
    let httpClient = makeHttpNetworkAdapter()
    let getLoginWebSocket = try makeRemoteGetLoginWebSocket(httpClient: httpClient, token: token, guidUser: guidUser)
    return LoginWebSocketPresenter(useCase: getLoginWebSocket, delegate: delegate)
}
