import Foundation

public protocol AddLogin {
    typealias Result = Swift.Result<LoginModel, CedroError>
    func add(withBody requestBody: AddLoginModel) async -> Result
}

public struct AddLoginModel: CedroModel {
    public var username: String
    public var password: String
    public var softwareVersion: String = "PRD.API.22.09.12A (4.40.2)"
    public var softwareName: String = "FTWEB_BROKER_CEDRO"
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
