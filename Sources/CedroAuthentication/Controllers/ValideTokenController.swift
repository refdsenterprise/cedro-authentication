import Foundation
import CedroAuthenticationDomain
import CedroAuthenticationPresentation

public final class ValideTokenController {
    private var response: ((AddValideToken.Result) -> Void)?
    private lazy var presenter = { try? makeValideTokenPresenter(delegate: WeakProxy(self), token: login?.token ?? "") }()
    private var login: LoginModel? { CedroAuthentication.shared.login.model }
    private var cedroAuthentication: CedroAuthenticationController { CedroAuthentication.shared.cedroAuthentication }
    public var model: ValideTokenModel? { return presenter?.valideTokenResponse }
    private var needStopVerify = false
    
    public func add(response: ((AddValideToken.Result) -> Void)? = nil) {
        self.response = response
        Task { if let login = login { await presenter?.valideToken(loginModel: login) } }
    }
}

extension ValideTokenController: ValideTokenPresenterDelegate {
    public func valideToken(didReceive valideTokenModel: ValideTokenModel) {
        response?(.success(valideTokenModel))
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in self?.add() }
    }
    
    public func valideToken(didReceive error: CedroError) {
        presenter = nil
        response?(.failure(error))
        cedroAuthentication.status?(.unlogged)
    }
}
