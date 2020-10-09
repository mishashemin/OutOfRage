import UIKit

public extension Decorator where T: UILabel {
    @discardableResult
    func fontSize(_ size: CGFloat) -> Decorator<T> {
        object.font = object.font.withSize(size)
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Decorator<T> {
        object.textColor = color
        return self
    }

    var baseMediumLabel: Decorator<T> {
        self.apply(Theme.baseMediumLabel)
    }

    var baseRegularLabel: Decorator<T> {
        self.apply(Theme.baseRegularLabel)
    }
}
