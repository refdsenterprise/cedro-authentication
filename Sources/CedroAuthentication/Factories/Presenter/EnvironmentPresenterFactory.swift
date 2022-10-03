import Foundation
import CedroAuthenticationPresentation

func makeEnvironmentPresenter(delegate: EnvironmentPresenterDelegate) -> EnvironmentPresenter {
    let httpClient = makeHttpNetworkAdapter()
    let getEnvironment = makeRemoteGetEnvironment(httpClient: httpClient)
    return EnvironmentPresenter(useCase: getEnvironment, delegate: delegate)
}
