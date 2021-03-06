import Foundation
import DataProvider
import Entity
import DataTransformer

public struct UserApiService: DataProvider.UserApiService {
    private let transformer: UserJsonDataTransformer
    
    public init(transformer: UserJsonDataTransformer) {
        self.transformer = transformer
    }
    
    private func fakeData() -> Data {
        // Fake Api call yielding a response ...
        let response = ["firstName": "fakeFirstName",
                        "lastName": "fakeLastName"]
        let data = try! JSONSerialization.data(withJSONObject: response, options: .init(rawValue: 0))
        return data
    }
    
    public func fetchUser() -> User {
        let data = fakeData()
        return transformer.transform(data)
    }
}
