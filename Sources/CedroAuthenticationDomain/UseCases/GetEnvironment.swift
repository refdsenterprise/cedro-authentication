import Foundation

public protocol GetEnvironment {
    typealias Result = Swift.Result<EnvironmentModel, CedroError>
    func get() async -> Result
}
