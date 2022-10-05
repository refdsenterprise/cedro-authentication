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

// MARK: - LoginPresenterDelegate
extension WeakProxy: LoginPresenterDelegate where T: LoginPresenterDelegate {
    public func login(didReceive loginModel: LoginModel) {
        instance?.login(didReceive: loginModel)
    }
    
    public func login(didReceive error: CedroError) {
        instance?.login(didReceive: error)
    }
}

// MARK: - ValideTokenPresenterDelegate
extension WeakProxy: ValideTokenPresenterDelegate where T: ValideTokenPresenterDelegate {
    public func valideToken(didReceive valideTokenModel: ValideTokenModel) {
        instance?.valideToken(didReceive: valideTokenModel)
    }
    
    public func valideToken(didReceive error: CedroError) {
        instance?.valideToken(didReceive: error)
    }
}

// MARK: - LoginWebSocketPresenterDelegate
extension WeakProxy: LoginWebSocketPresenterDelegate where T: LoginWebSocketPresenterDelegate {
    public func loginWebSocket(didReceive loginWebSocketModel: LoginWebSocketModel) {
        instance?.loginWebSocket(didReceive: loginWebSocketModel)
    }
    
    public func loginWebSocket(didReceive error: CedroError) {
        instance?.loginWebSocket(didReceive: error)
    }
}
