import Foundation
import CedroAuthenticationDomain

public final class CedroAuthentication {
    public static let shared = CedroAuthentication()
    
    var username = ""
    var password = ""
    private var status: ((CedroAuthenticationStatus) -> Void)?
    let cedroAuthentication = makeCedroAuthenticationController()
    
    public let environment = makeEnvironmentController()
    public let login = makeLoginController()
    
    private var valideToken: ValideTokenController?
    private var loginWebSocket: LoginWebSocketController?
    
    public func start(username: String, password: String, status: ((CedroAuthenticationStatus) -> Void)? = nil) {
        self.username = username
        self.password = password
        self.status = status
        
        cedroAuthentication.status = { [weak self] status in
            self?.handleStatus(status: status)
        }
        
        restart()
    }
    
    public func getLoginWebSocket() async -> Result<LoginWebSocketModel, CedroError> {
        await withCheckedContinuation({ continuation in
            let loginWebSocket = makeLoginWebSocketController()
            loginWebSocket.get { continuation.resume(returning: $0) }
        })
    }
    
    private func restart() {
        valideToken = nil
        valideToken = makeValideTokenController()
        
        environment.get { [weak self] _ in
            self?.login.add { [weak self] _ in
                self?.valideToken?.add()
            }
        }
    }
    
    private func handleStatus(status: CedroAuthenticationStatus) {
        switch status {
        case .logged:
            self.status?(.logged)
        case .unlogged:
            self.status?(.unlogged)
            restart()
        }
    }
}

public enum CedroAuthenticationStatus {
    case logged
    case unlogged
}
