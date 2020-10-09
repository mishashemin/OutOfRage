import UIKit

public extension Decorator where T: UITextField {

    var baseTextField: Decorator<T> {
        self.apply(Theme.baseTextField)
    }

    var textFieldOutFocus: Decorator<T> {
        self.apply(Theme.textFieldOutFocus)
    }
    
    var textFieldInFocus: Decorator<T> {
        self.apply(Theme.textFieldInFocus)
    }
}
