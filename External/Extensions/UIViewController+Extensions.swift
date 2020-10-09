import UIKit

extension UIViewController {
    
    enum BarItemSide {
        case left, right
    }
    
    enum BarItemType {
        case withTitle(title: String?), withImage(image: UIImage?)
    }
    
    func setBarButtonItem(with type: BarItemType = BarItemType.withTitle(title: "Back"), side: BarItemSide = BarItemSide.left, animated: Bool = false, for action: Selector?) {
        
        let barButtonItem: UIBarButtonItem
        
        switch type {
        case let .withImage(image):
            barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
            
        case let .withTitle(title):
            barButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        }
        
        switch side {
        case .left:
            self.navigationItem.setLeftBarButton(barButtonItem, animated: animated)
        case .right:
            self.navigationItem.setRightBarButton(barButtonItem, animated: animated)
        }
    }

}
