import CedroAuthenticationDomain
import CedroAuthenticationPresentation

public final class LoginController {
    static let shared = LoginController()
    
    private var response: ((AddLogin.Result) -> Void)?
    private lazy var presenter = { try? makeLoginPresenter(delegate: WeakProxy(self)) }()
    private var username: String { CedroAuthentication.shared.username }
    private var password: String { CedroAuthentication.shared.password }
    private var cedroAuthentication: CedroAuthenticationController { CedroAuthentication.shared.cedroAuthentication }
    public var model: LoginModel? { return presenter?.loginResponse }
    
    
    public func add(response: ((AddLogin.Result) -> Void)? = nil) {
        self.response = response
        Task { await presenter?.login(username: username, password: password) }
    }
}

extension LoginController: LoginPresenterDelegate {
    public func login(didReceive loginModel: LoginModel) {
        response?(.success(loginModel))
        cedroAuthentication.status?(.logged)
    }
    
    public func login(didReceive error: CedroError) {
        response?(.failure(error))
        cedroAuthentication.status?(.unlogged)
    }
}
