import Foundation

protocol IChildCoordinable {
	var childCoordinators: [ICoordinator] { get set }
	func addDependency(_ coordinator: ICoordinator)
	func removeDependency(_ coordinator: ICoordinator?)
}
