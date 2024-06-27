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
                let marketData = try decoder.decode([String: [StockDataDTO]].self, from: data)
                let tickers = marketData["tickers"]
                completion(tickers)
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}
