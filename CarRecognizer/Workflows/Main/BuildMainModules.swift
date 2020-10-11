import Foundation
import ImagePicker

extension MainCoordinator {

    func buildModule1ViewController() -> MainPageViewController {
        let viewController =  StoryboardScene.Main.module1ViewController.instantiate()
        let viewModel = MainPageViewModel(context: context)
        
        viewModel.onRecognizeAction = { [weak self, weak viewController] in
            guard let self = self else { return }
            let imagePicker = self.buildCarImagePickerViewController()
            viewController?.present(imagePicker, animated: true, completion: nil)
        }
        
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func buildCarListViewController(cars: [CarModel]) -> CarListViewController {
        let viewController =  StoryboardScene.Main.carListViewController.instantiate()
        let viewModel = CarListViewModel(context: context, carModels: cars)
        
        viewModel.onBackAction = { [weak self] in
            self?.router.pop()
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    func buildCarImagePickerViewController() -> CarImagePickerViewController {
        let config = Configuration()
        config.doneButtonTitle = "Отправить"
        config.noImagesTitle = ""
        config.recordLocation = false
        config.allowVideoSelection = false
        config.allowMultiplePhotoSelection = false
        
        let viewController = CarImagePickerViewController(configuration: config)
        let viewModel = CarImagePickerViewModel(context: context)
        
        viewModel.onRecognizeEvent = { [weak self] cars in
            self?.goToCarList(cars: cars)
        }
        
        viewController.delegate = viewModel
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func buildCurrentCarViewController(car: CarModel) -> CurrentCarViewController {
        let viewController =  StoryboardScene.Main.currentCarViewController.instantiate()
        let viewModel = CurrentCarViewModel(context: context, carModel: car)
        
        viewController.viewModel = viewModel
        return viewController
    }
}
