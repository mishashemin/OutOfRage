protocol ICoordinator: class {
    
    var completionHandler: (() -> Void)? {get set}
    
    func start()
}
