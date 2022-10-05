import Foundation
import CedroAuthenticationDomain

public protocol ValideTokenPresenterDelegate {
    func valideToken(didReceive valideTokenModel: ValideTokenModel)
    func valideToken(didReceive error: CedroError)
}

public final class ValideTokenPresenter {
    private let useCase: AddValideToken
    private let delegate: ValideTokenPresenterDelegate
    public private(set) var valideTokenResponse: ValideTokenModel?
    
    public init(useCase: AddValideToken, delegate: ValideTokenPresenterDelegate) {
        self.useCase = useCase
        self.delegate = delegate
    }
    
    public func valideToken(loginModel: LoginModel) async {
        let result = await useCase.add(withBody: AddValideTokenModel(account: loginModel.accountNumber, tokenA: loginModel.token, tokenW: loginModel.tokenWS))
        switch result {
        case .success(let model):
            self.valideTokenResponse = model
            self.delegate.valideToken(didReceive: model)
        case .failure(let error): self.delegate.valideToken(didReceive: error)
        }
    }
}
