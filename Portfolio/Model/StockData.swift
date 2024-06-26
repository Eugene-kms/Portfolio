import Foundation

struct StockData {
    let logoNameCompany: String
    let titleCompany: String
    let subtitleCompany: String
    let titleValue: String
    let stockValue: String
    let titlePrice: String
    let stockPrice: String
    let priceChange: String
    var graphData: [Double]
    
    init(logoNameCompany: String, titleCompany: String, subtitleCompany: String, titleValue: String, stockValue: String, titlePrice: String, stockPrice: String, priceChange: String, graphData: [Double]) {
        self.logoNameCompany = logoNameCompany
        self.titleCompany = titleCompany
        self.subtitleCompany = subtitleCompany
        self.titleValue = titleValue
        self.stockValue = stockValue
        self.titlePrice = titlePrice
        self.stockPrice = stockPrice
        self.priceChange = priceChange
        self.graphData = graphData
    }
}
