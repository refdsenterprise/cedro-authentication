import Foundation
import CedroAuthenticationDomain

public protocol LoginWebSocketPresenterDelegate {
    func loginWebSocket(didReceive loginWebSocketModel: LoginWebSocketModel)
    func loginWebSocket(didReceive error: CedroError)
}

public final class LoginWebSocketPresenter {
    private let useCase: GetLoginWebSocket
    private let delegate: LoginWebSocketPresenterDelegate
    public private(set) var loginWebSocketResponse: LoginWebSocketModel?
    
    public init(useCase: GetLoginWebSocket, delegate: LoginWebSocketPresenterDelegate) {
        self.useCase = useCase
        self.delegate = delegate
    }
    
    public func loginWebSocket() async {
        let result = await useCase.get()
        switch result {
        case .success(let model):
            self.loginWebSocketResponse = model
            self.delegate.loginWebSocket(didReceive: model)
        case .failure(let error): self.delegate.loginWebSocket(didReceive: error)
        }
    }
}
