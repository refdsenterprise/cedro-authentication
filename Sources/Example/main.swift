import Foundation
import CedroAuthentication

func main() {
    CedroAuthentication.shared.environment.get(response: nil)
}

main()
RunLoop.current.run()
