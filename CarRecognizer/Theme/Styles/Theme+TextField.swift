import UIKit

extension Theme {
    static var baseTextField: ThemeStyle<UITextField> = { textField in
        textField.layer.borderWidth = 0
        textField.borderStyle = .none
        textField.leftViewMode = .always
        textField.leftView = UIView(frame:CGRect(x:0, y:0, width:12, height:44))
        //textField.backgroundColor = Asset.Colors.grayBackground.color
        textField.layer.cornerRadius = 4
    }
    
    static var textFieldOutFocus: ThemeStyle<UITextField> = { textField in
        textField.layer.borderWidth = 0
    }
    
    static var textFieldInFocus: ThemeStyle<UITextField> = { textField in
        textField.layer.borderWidth = 1
        //textField.layer.borderColor = Asset.Colors.globalTintColor.color.cgColor
    }
}
