import CedroAuthenticationDomain
import CedroAuthenticationPresentation

public final class EnvironmentController {
    static let shared = EnvironmentController()
    private var response: ((GetEnvironment.Result) -> Void)?
    private lazy var presenter = { makeEnvironmentPresenter(delegate: WeakProxy(self)) }()
    public var model: EnvironmentModel? { return presenter.environmentResponse }
    
    public func get(response: ((GetEnvironment.Result) -> Void)?) {
        self.response = response
        Task { await presenter.environment() }
    }
}

extension EnvironmentController: EnvironmentPresenterDelegate {
    public func environment(didReceive environmentModel: EnvironmentModel) {
        response?(.success(environmentModel))
    }
    
    public func environment(didReceive error: CedroError) {
        response?(.failure(error))
    }
}
