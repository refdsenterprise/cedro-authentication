import Foundation
import CedroAuthenticationDomain

public protocol EnvironmentPresenterDelegate {
    func environment(didReceive environmentModel: EnvironmentModel)
    func environment(didReceive error: CedroError)
}

public final class EnvironmentPresenter {
    private let useCase: GetEnvironment
    private let delegate: EnvironmentPresenterDelegate
    public private(set) var environmentResponse: EnvironmentModel?
    
    public init(useCase: GetEnvironment, delegate: EnvironmentPresenterDelegate) {
        self.useCase = useCase
        self.delegate = delegate
    }
    
    public func environment() async {
        let result = await useCase.get()
        switch result {
        case .success(let model):
            self.environmentResponse = model
            self.delegate.environment(didReceive: model)
        case .failure(let error): self.delegate.environment(didReceive: error)
        }
    }
}
