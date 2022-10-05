import Foundation
import CedroAuthenticationPresentation

func makeValideTokenPresenter(delegate: ValideTokenPresenterDelegate, token: String) throws -> ValideTokenPresenter {
    let httpClient = makeHttpNetworkAdapter()
    let addValideToken = try makeRemoteAddValideToken(httpClient: httpClient, token: token)
    return ValideTokenPresenter(useCase: addValideToken, delegate: delegate)
}
