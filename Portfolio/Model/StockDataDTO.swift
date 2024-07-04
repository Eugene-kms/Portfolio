import Foundation

struct StockDataDTO: Codable {
    
    struct ChangeDTO: Codable {
        let close: Double
        let date: Date
    }
    
    let name: String
    let price: Double
    let symbol: String
    let type: String
    let change: [ChangeDTO]
    
    init(name: String, price: Double, symbol: String, type: String, change: [ChangeDTO]) {
        self.name = name
        self.price = price
        self.symbol = symbol
        self.type = type
        self.change = change
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(Double.self, forKey: .price)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.type = try container.decode(String.self, forKey: .type)
        self.change = try container.decode([ChangeDTO].self, forKey: .change)
    }
}
