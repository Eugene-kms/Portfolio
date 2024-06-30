import Foundation

struct StockData: Codable {
    let logoNameCompany: String
    let titleCompany: String
    let subtitleCompany: String
    let titleValue: String
    let stockValue: String
    let titlePrice: String
    let stockPrice: String
    let percentageChange: String
    let graphData: [Double]
    
    var isPriceUp: Bool {
        return (graphData.last ?? 0) >= (graphData.first ?? 0)
    }
    
    var isChangePositive: Bool {
        return percentageChange.first == "+"
    }
    
    init(logoNameCompany: String, titleCompany: String, subtitleCompany: String, titleValue: String, stockValue: String, titlePrice: String, stockPrice: String, percentageChange: String, graphData: [Double]) {
        self.logoNameCompany = logoNameCompany
        self.titleCompany = titleCompany
        self.subtitleCompany = subtitleCompany
        self.titleValue = titleValue
        self.stockValue = stockValue
        self.titlePrice = titlePrice
        self.stockPrice = stockPrice
        self.percentageChange = percentageChange
        self.graphData = graphData
    }
}
