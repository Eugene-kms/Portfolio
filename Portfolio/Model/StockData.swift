import UIKit

struct StockData {
    
    let image: UIImage?
    let name: String
    let price: String
    let symdol: String
    let graphData: [Double]
    let percentChange: String
    
    var isPriceUp: Bool {
        return (graphData.last ?? 0) >= (graphData.first ?? 0)
    }
}

extension StockDataDTO {
    
    func toDomain() -> StockData {
        
        let currentPrice = self.price
        let previousPrice = self.change.sorted(by: { $0.date < $1.date }).last?.close ?? currentPrice
        
        let percentageChange = ((currentPrice - previousPrice) / previousPrice) * 100
        
        return StockData(
            image: UIImage(named: self.symbol),
            name: self.name,
            price: String(self.price),
            symdol: self.symbol,
            graphData: self.change.map { $0.close },
            percentChange: String(format: "%@%.2f%%", percentageChange >= 0 ? "+" : "", percentageChange)
        )
    }
}

extension StockData {
    
    func toPortfolioData(purchaseAmount: Double) -> PortfolioData {
        
        PortfolioData(
            purchaseAmount: purchaseAmount,
            name: self.name,
            price: self.price,
            symdol: self.symdol
        )
    }
}
