import Foundation

public struct AccountModel: Model {
    
    public init(accessToken: String, name: String) {
        self.accessToken = accessToken
        self.name = name
    }
    
    public let accessToken: String
    public let name: String
//    public let email: String
//    public let password: String
    
//    public init(id: String, name: String, email: String, password: String) {
//        self.id = id
//        self.name = name
//        self.email = email
//        self.password = password
//    }
}
