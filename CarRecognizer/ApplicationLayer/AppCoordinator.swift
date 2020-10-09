import UIKit
import Reusable

final class AppCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    let window: UIWindow
    private let context: IAppContext
    
    private var mainCoordinator: MainCoordinator?
    
    // MARK: - Lifecycle
    init(window: UIWindow, context: IAppContext) {
        self.window = window
        self.context = context
    }
    
    override func start() {
        startMainFlow()
    }
    
    // MARK: - Private
    private func startMainFlow() {
        let mainVC = BaseNavigationController()
        window.changeRootViewController(to: mainVC)
        let coordinator = MainCoordinator(router: mainVC, context: context)
        self.mainCoordinator = coordinator
        self.addDependency(coordinator)
        coordinator.completionHandler = { [weak self] in
            self?.removeDependency(self?.mainCoordinator)
            self?.mainCoordinator = nil
        }
       coordinator.start()
    }
    
}
