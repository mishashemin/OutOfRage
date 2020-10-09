import Foundation
import RxCocoa

struct ItemStorage<Item>: IRepository where Item: Codable & Equatable {
    typealias DBObj = Item

    private let storage: IKeychainStorage
    private let key: StorageKeys
    
    var list = BehaviorRelay<[Item]>(value: [])
    
    init(storage: IKeychainStorage, key: StorageKeys) {
        self.storage = storage
        self.key = key
        self.getAll()
    }
    
    func getAll(_ completion: DBResults? = nil) {
        var itemsArray: [Item]?
        var errorCode: StorageErrorCode?
        
        if let items = self.storage.getValue(forKey: key.rawValue, type: Data.self) {
            let decoder = JSONDecoder()
            do {
                itemsArray = try decoder.decode([Item].self, from: items)
            } catch {
                errorCode = StorageErrorCode.loadFailed
            }
        }
        
        let result = itemsArray ?? []
        self.list.accept(result)
        
        if errorCode == nil {
            completion?(.success([]))
        } else {
            completion?(.failure(StorageError(code: errorCode!)))
        }
    }
    
    func update(item: Item, _ completion: DBResult? = nil) {
        var items = self.list.value
        if let index = items.firstIndex(where: {
            $0 == item }) {
            items[index] = item
        } else {
            items.append(item)
        }
        self.save(items)
        completion?(.success(item))
    }
    
    func delete(item: Item, _ completion: DBResult? = nil) {
        var items = self.list.value
        if let index = items.firstIndex(where: {
            $0 == item }) {
            items.remove(at: index)
        } else {
            let notFoundError = StorageError.init(code: .notFound)
            completion?(.failure(notFoundError))
            return
        }
        
        self.save(items)
        completion?(.success(item))
    }
    
    func deleteAll(_ completion: DBResults? = nil) {
        let items = self.list.value
        self.save([])
        completion?(.success(items))
    }
    
    func save(_ items: [Item]? = nil, _ completion: DBResults? = nil) {
        var currentItems = self.list.value
        
        if let items = items {
            currentItems = items
            self.list.accept(items)
        }
        
        let jsonData = currentItems.toJSONData()
        self.storage.setValue(value: jsonData, forKey: key.rawValue)
        completion?(.success(currentItems))
    }
}
