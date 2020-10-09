import UIKit

public extension Decorator where T: UIButton {
    @discardableResult
    func fontSize(_ size: CGFloat) -> Decorator<T> {
        guard let label = object.titleLabel else { return self }
        label.font = label.font.withSize(size)
        return self
    }

    @discardableResult
    func setActive(_ active: Bool) -> Decorator<T> {
        object.isEnabled = active
        object.backgroundColor = active ? object.backgroundColor?.withAlphaComponent(1) : object.backgroundColor?.withAlphaComponent(0.5)
        return self
    }
    
    var textButton: Decorator<T> {
        self.apply(Theme.textButton)
    }
}
