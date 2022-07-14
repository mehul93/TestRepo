import Foundation

public struct TestPackage {
    public private(set) var text = "Hello, World!"
    
    public init() {
    }
    
    public func loadData() -> Token? {
        guard let url = Bundle.main.url(forResource: "tokens", withExtension: "json")
        else {
            print("Json file not found")
            return nil
        }
        
        let data = try? Data(contentsOf: url)
        let token = try? JSONDecoder().decode(Token.self, from: data!)
        return token
    }
}

// MARK: - TokenElement
public struct TokenElement: Codable {
    let height, background: Background
}

// MARK: - Background
public struct Background: Codable {
    let value, type: String
}

public typealias Token = [TokenElement]
