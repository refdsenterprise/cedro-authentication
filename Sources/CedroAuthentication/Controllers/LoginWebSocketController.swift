import CedroAuthenticationDomain
import CedroAuthenticationPresentation

public final class LoginWebSocketController {
    static let shared = LoginWebSocketController()
    private var response: ((GetLoginWebSocket.Result) -> Void)?
    private lazy var presenter = { try? makeLoginWebSocketPresenter(delegate: WeakProxy(self), token: login?.token ?? "", guidUser: login?.guidUser ?? "") }()
    private var login: LoginModel? { CedroAuthentication.shared.login.model }
    private var cedroAuthentication: CedroAuthenticationController { CedroAuthentication.shared.cedroAuthentication }
    public var model: LoginWebSocketModel? { return presenter?.loginWebSocketResponse }
    
    public func get(response: ((GetLoginWebSocket.Result) -> Void)?) {
        self.response = response
        Task { await presenter?.loginWebSocket() }
    }
}

extension LoginWebSocketController: LoginWebSocketPresenterDelegate {
    public func loginWebSocket(didReceive loginWebSocketModel: LoginWebSocketModel) {
        response?(.success(loginWebSocketModel))
    }
    
    public func loginWebSocket(didReceive error: CedroError) {
        response?(.failure(error))
        cedroAuthentication.status?(.unlogged)
    }
}
