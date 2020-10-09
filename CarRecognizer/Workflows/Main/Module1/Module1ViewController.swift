import UIKit
import RxSwift
import RxCocoa

class Module1ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var button: UIButton!
    
    // MARK: - Actions
    
    // MARK: - Properties
    var viewModel: IModule1ViewModel!
    private(set) var disposeBag = DisposeBag()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.bindToViewModel()
    }
    
    deinit {
        #if DEBUG
        print("💭 deinit " + type(of: self).nameOfClass)
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - Private
    private func setupViews() {
    }
       
    private func bindToViewModel() {
        button.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel.nextAction()
            })
            .disposed(by: disposeBag)
    }
}
