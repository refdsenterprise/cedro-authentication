import Foundation
import CedroAuthenticationPresentation

func makeLoginPresenter(delegate: LoginPresenterDelegate) throws -> LoginPresenter {
    let httpClient = makeHttpNetworkAdapter()
    let addLogin = try makeRemoteAddLogin(httpClient: httpClient)
    return LoginPresenter(useCase: addLogin, delegate: delegate)
}
