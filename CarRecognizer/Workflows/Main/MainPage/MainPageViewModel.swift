import RxSwift
import RxRelay

protocol IMainPageViewModel {
    func recognizeAction()
    
    var onRecognizeAction: (() -> Void)? { get }
}

class MainPageViewModel: IMainPageViewModel {
    
    typealias Context = IAppContext
    
    // MARK: - Properties
    private var context: Context
        
    private let disposeBag = DisposeBag()
    
    var onRecognizeAction: (() -> Void)?
    var onFavoritesAction: (() -> Void)?
    var onDocumentsAction: (() -> Void)?
    
    // MARK: - Lifecycle
    init(context: Context) {
        self.context = context
        setupRx()
    }
    
    deinit {
        #if DEBUG
        print("💭 deinit MainPageViewModel")
        #endif
    }
    
    func recognizeAction() {
        onRecognizeAction?()
    }
    
    // MARK: - Private
    private func setupRx() {
    }
}
