import UIKit

class BaseNavigationController: UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
        interactivePopGestureRecognizer?.cancelsTouchesInView = false
        interactivePopGestureRecognizer?.delaysTouchesBegan = false
        interactivePopGestureRecognizer?.delaysTouchesEnded = false
    }
}

extension BaseNavigationController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
