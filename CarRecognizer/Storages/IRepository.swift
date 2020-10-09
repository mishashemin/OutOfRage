import Foundation
import RxCocoa
import Moya

protocol IRepository {
    associatedtype DBObj
    
    typealias DBResult = (Result<DBObj, Error>) -> ()
    typealias DBResults = (Result<[DBObj], Error>) -> ()
        
    var list: BehaviorRelay<[DBObj]> { get }
    func getAll(_ completion: DBResults?)
    func update(item: DBObj, _ completion: DBResult?)
    func delete(item: DBObj, _ completion: DBResult?)
    func deleteAll(_ completion: DBResults?)
    func save(_ items: [DBObj]?, _ completion: DBResults?)
}

