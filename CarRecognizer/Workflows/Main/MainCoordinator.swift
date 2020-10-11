import Foundation
import UIKit
import RxSwift

class MainCoordinator: BaseCoordinator {
    
    typealias Router = UINavigationController
    
    // MARK: - Properties
    var router: Router
    let context: IAppContext
    let disposeBag = DisposeBag()
    
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
    
    func goToCarList(cars: [CarModel]) {
        let controller = self.buildCarListViewController(cars: cars)
        self.router.push(controller)
    }
    
    func goToCurrentCar(car: CarModel) {
        let controller = self.buildCurrentCarViewController(car: car)
        self.router.push(controller)
    }
}
