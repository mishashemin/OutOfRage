import Foundation

public typealias ThemeStyle<T> = (T) -> Void

public struct Decorator<T> {
    let object: T
}

public protocol IDecorate: class {
    associatedtype DecorateType
    var theme: Decorator<DecorateType> { get set }
}

public extension IDecorate {
    static func decoration(closure: @escaping ThemeStyle<Self>) -> ThemeStyle<Self> {
        closure
    }
    
    var theme: Decorator<Self> {
        get { Decorator(object: self) }
        set { }
    }
}

extension NSObject: IDecorate {}

public extension Decorator where T: IDecorate {
    
    @discardableResult
    func apply(_ styles: ThemeStyle<T>...) -> Decorator<T> {
        styles.forEach { (style) in
            _ = style(object)
        }
        return self
    }
    
    @discardableResult
    static func + (decorator: Decorator<T>, style: @escaping ThemeStyle<T>) -> Decorator<T> {
        decorator.apply(style)
        return decorator
    }
    
    @discardableResult
    func prepare(state: AnyHashable, style: @escaping ThemeStyle<T>) -> Decorator<T> {
        let statesDb = object.statesDb
        statesDb.states[state] = style
        if state == statesDb.state {
            object.theme.apply(style)
        }
        return self
    }
    
    @discardableResult
    func prepare(states: AnyHashable..., style: @escaping ThemeStyle<T>) -> Decorator<T> {
        object.queue.async(flags: .barrier) {[weak object] in
            guard let object = object else {return}
            let statesDb = self.object.statesDb
            for state in states {
                statesDb.states[state] = style
            }
            if let state = statesDb.state, states.contains(state) {
                object.theme.apply(style)
            }
        }
        return self
    }
    
    var state: AnyHashable? {
        get {
            object.statesDb.state
        }
        set(value) {
            object.queue.sync {[weak object] in
                guard let object = object else {return}
                let statesDb = object.statesDb
                if let key = value, let style = statesDb.states[key] {
                    object.theme.apply(style)
                }
                statesDb.state = value
            }
        }
    }
}

public func +<T: IDecorate>(lhs: @escaping ThemeStyle<T>, rhs: @escaping ThemeStyle<T>) -> ThemeStyle<T> {
    { (value: T) -> Void in
        lhs(value)
        rhs(value)
    }
}
