import Foundation

public final class CedroAuthentication {
    public static let shared = CedroAuthentication()
    public let environment = makeEnvironmentController()
}
