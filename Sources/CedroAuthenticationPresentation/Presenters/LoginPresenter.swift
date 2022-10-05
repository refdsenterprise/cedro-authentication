import Foundation
import CedroAuthenticationDomain

public protocol LoginPresenterDelegate {
    func login(didReceive loginModel: LoginModel)
    func login(didReceive error: CedroError)
}

public final class LoginPresenter {
    private let useCase: AddLogin
    private let delegate: LoginPresenterDelegate
    public private(set) var loginResponse: LoginModel?
    
    public init(useCase: AddLogin, delegate: LoginPresenterDelegate) {
        self.useCase = useCase
        self.delegate = delegate
    }
    
    public func login(username: String, password: String) async {
        let result = await useCase.add(withBody: AddLoginModel(username: username, password: password))
        switch result {
        case .success(let model):
            self.loginResponse = model
            self.delegate.login(didReceive: model)
        case .failure(let error): self.delegate.login(didReceive: error)
        }
    }
}
