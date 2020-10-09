import Foundation

extension MainCoordinator {

    func buildModule1ViewController() -> Module1ViewController {
        let viewController =  StoryboardScene.Main.module1ViewController.instantiate()
        let viewModel = Module1ViewModel(context: context)
        
        viewModel.onNextAction = { [weak self] in
            self?.goToModule2()
        }
        
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func buildModule2ViewController() -> Module2ViewController {
        let viewController =  StoryboardScene.Main.module2ViewController.instantiate()
        let viewModel = Module2ViewModel(context: context)
        
        viewModel.onBackAction = { [weak self] in
            self?.router.pop()
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
}

