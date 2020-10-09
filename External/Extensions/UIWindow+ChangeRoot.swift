import Foundation
import UIKit

extension UIWindow {
    
    struct Constants {
        
        struct ChangeAnimation {
            
            static let duration: TimeInterval = 0.65
            static let options: AnimationOptions = .transitionCrossDissolve
        }
    }
    
    func changeRootViewController(to viewController: UIViewController, duration: TimeInterval, options: AnimationOptions = [], completion: ((Bool) -> Void)? = nil) {
        if self.rootViewController != nil {
            rootViewController = viewController
            
            UIView.transition(with: self,
                              duration: duration,
                              options: options,
                              animations: nil,
                              completion: completion)
        } else {
            rootViewController = viewController
        }
    }
    
    func changeRootViewController(to viewController: UIViewController, animated: Bool = true) {
        changeRootViewController(to: viewController,
                                 duration: animated ? Constants.ChangeAnimation.duration : 0,
                                 options: Constants.ChangeAnimation.options
        )
    }
    
}
