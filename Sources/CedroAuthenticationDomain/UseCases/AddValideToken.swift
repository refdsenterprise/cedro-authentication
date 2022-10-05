import Foundation

public protocol AddValideToken {
    typealias Result = Swift.Result<ValideTokenModel, CedroError>
    func add(withBody requestBody: AddValideTokenModel) async -> Result
}

public struct AddValideTokenModel: CedroModel {
    public var account: String
    public var tokenA: String
    public var tokenW: String
    
    public init(account: String, tokenA: String, tokenW: String) {
        self.account = account
        self.tokenA = tokenA
        self.tokenW = tokenW
    }
}
