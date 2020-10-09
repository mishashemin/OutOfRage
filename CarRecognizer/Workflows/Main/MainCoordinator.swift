import Foundation
import UIKit

class MainCoordinator: BaseCoordinator {
    
    typealias Router = UINavigationController
    
    // MARK: - Properties
    var router: Router
    let context: IAppContext
    
    // MARK: - Lifecycle
    init(router: Router, context: IAppContext) {
        self.router = router
        self.context = context
    }
    
    override func start() {
        let controller = self.buildModule1ViewController()
        self.router.push(controller)
    }
    
    deinit {
        #if DEBUG
        print("💭 deinit " + String(describing: self))
        #endif
    }
    
    func goToModule2() {
        let controller = self.buildModule2ViewController()
        self.router.push(controller)
    }
}
