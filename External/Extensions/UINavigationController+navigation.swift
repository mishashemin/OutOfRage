import UIKit

extension UINavigationController {
    func push(_ controller: UIViewController, animated: Bool = true) {
        self.pushViewController(controller, animated: animated)
    }
   
    func pop(animated: Bool = true) {
        self.popViewController(animated: animated)
    }
    
    func replace(_ controller: UIViewController, animated: Bool = true) {
        var viewControllers = self.viewControllers
        _ = viewControllers.popLast()
        viewControllers.append(controller)
        self.setViewControllers(viewControllers, animated: animated)
    }
    
    func replaceFlow(_ viewControllers: [UIViewController], animated: Bool = true) {
        self.setViewControllers(viewControllers, animated: true)
    }
}
