import UIKit

extension Theme {
    static var baseRegularLabel: ThemeStyle<UILabel> = { label in
        //label.font = FontFamily.Roboto.regular.font(size: 16)
        label.textColor = .black
    }
    
    static var baseMediumLabel: ThemeStyle<UILabel> = { label in
        //label.font = FontFamily.Roboto.medium.font(size: 16)
        label.textColor = .black
    }
}
