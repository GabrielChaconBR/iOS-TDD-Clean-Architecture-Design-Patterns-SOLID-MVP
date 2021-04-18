import XCTest
import Data
import Infra
import Domain

class AddAccountIntegrationTests: XCTestCase {

    func test_add_account() {
        
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://clean-nodejs-api.herokuapp.com/api/signup")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Rodrigo Caetano", email: "rodrigo.caetano1@gmail.com", password: "secret", passwordConfirmation: "secret")
        let exp = expectation(description: "wating")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure:
                XCTFail("Expect sucess got \(result) instead")
            case .success(let account):
                XCTAssertNotNil(account.accessToken)
                XCTAssertEqual(account.name, addAccountModel.name)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
