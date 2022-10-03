import Foundation
import CedroAuthenticationDomain
import CedroAuthenticationPresentation

public class WeakProxy<T: AnyObject> {
    private weak var instance: T?
    
    public init(_ instance: T) {
        self.instance = instance
    }
}

// MARK: - EnvironmentPresenterDelegate
extension WeakProxy: EnvironmentPresenterDelegate where T: EnvironmentPresenterDelegate {
    public func environment(didReceive environmentModel: EnvironmentModel) {
        instance?.environment(didReceive: environmentModel)
    }
    
    public func environment(didReceive error: CedroError) {
        instance?.environment(didReceive: error)
    }
}
