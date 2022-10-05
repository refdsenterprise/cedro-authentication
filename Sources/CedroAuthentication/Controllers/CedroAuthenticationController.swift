import Foundation

public final class CedroAuthenticationController {
    public static let shared = CedroAuthenticationController()
    var status: ((CedroAuthenticationStatus) -> Void)?
}
