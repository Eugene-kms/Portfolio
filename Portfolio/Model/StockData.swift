import Foundation

struct StockData {
    let logoNameCompany: String
    let titleCompany: String
    let subtitleCompany: String
    let titleValue: String
    let stockValue: String
    let titlePrice: String
    let stockPrice: String
    
    init(logoNameCompany: String, titleCompany: String, subtitleCompany: String, titleValue: String, stockValue: String, titlePrice: String, stockPrice: String) {
        self.logoNameCompany = logoNameCompany
        self.titleCompany = titleCompany
        self.subtitleCompany = subtitleCompany
        self.titleValue = titleValue
        self.stockValue = stockValue
        self.titlePrice = titlePrice
        self.stockPrice = stockPrice
    }
}
