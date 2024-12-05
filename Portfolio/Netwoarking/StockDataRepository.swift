import UIKit

//curl 'https://portfolio-4fdba-default-rtdb.europe-west1.firebasedatabase.app/market.json'

class StockDataRepository {
    
    private let baseUrl = URL(string: "https://portfolio-4fdba-default-rtdb.europe-west1.firebasedatabase.app/")!
    
    private let marketUrl = URL(string: "https://portfolio-4fdba-default-rtdb.europe-west1.firebasedatabase.app/market.json")!
    
    func loadMarket(completion: @escaping ([StockDataDTO]?) -> Void) {
        
        let request = URLRequest(url: marketUrl)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let data = data else {
        
                completion(nil)
                
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                let marketData = try decoder.decode([String: [StockDataDTO]]?.self, from: data)
                let tickers = marketData?["tickers"] ?? []
                completion(tickers)
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func addStockToPortfolio(_ stock: PortfolioData, completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)/portfolio/\(stock.symdol).json") else { completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let stockData = try? JSONEncoder().encode(stock)
        guard let data = stockData else {
            completion(false)
            return
        }
        
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error edding stock to portfolio: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
        task.resume()
    }
    
    func removeStockFromPortfolio(_ stock: PortfolioData, completion: @escaping (Bool) -> Void) {
        
        let symbol = stock.symdol
        let url = baseUrl.appendingPathComponent("portfolio/\(symbol).json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error removing stock from portfolio: \(error)")
                completion(false)
                return
            }
            completion(true)
        }
        task.resume()
    }
}
