import Foundation

public enum StorageErrorCode: Int, IBaseErrorCode {
    case loadFailed = 0
    case notFound = 1
}

public class StorageError: BaseError <StorageErrorCode> {
    public override var domainShortname: String {
        "STR"
    }
}
