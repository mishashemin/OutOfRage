import RxSwift
import RxRelay

protocol IModule1ViewModel {
    func nextAction()
    
    var onNextAction: (() -> Void)? { get }
}

class Module1ViewModel: IModule1ViewModel {
    
    typealias Context = IAppContext
    
    // MARK: - Properties
    private var context: Context
        
    private let disposeBag = DisposeBag()
    
    var onNextAction: (() -> Void)?
    
    // MARK: - Lifecycle
    init(context: Context) {
        self.context = context
        setupRx()
    }
    
    deinit {
        #if DEBUG
        print("💭 deinit Module1ViewModel")
        #endif
    }
    
    func nextAction() {
        onNextAction?()
    }
    
    // MARK: - Private
    private func setupRx() {
    }
}
