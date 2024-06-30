import UIKit

class MyStockCell: UITableViewCell {

    @IBOutlet weak var logoCompany: UIImageView!
    @IBOutlet weak var titleCompany: UILabel!
    @IBOutlet weak var subtitleCompany: UILabel!
    @IBOutlet weak var titleValue: UILabel!
    @IBOutlet weak var subtitleValue: UILabel!
    @IBOutlet weak var titleStockPrice: UILabel!
    @IBOutlet weak var subtitlePrice: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCell()
        configureFont()
    }
    
    func configure(with stockData: StockData) {
        logoCompany.image = UIImage(named: stockData.logoNameCompany)
        titleCompany.text = stockData.titleCompany
        subtitleCompany.text = stockData.subtitleCompany
        titleValue.text = "Portfolio value"
        subtitleValue.text = "$" + stockData.stockValue
        titleStockPrice.text = "Stock Price"
        subtitlePrice.text = "$" + stockData.stockPrice
    }
    
    private func configureCell() {
        cardView.layer.cornerRadius = 13
        cardView.layer.masksToBounds = false
        
        self.selectionStyle = .none
    }
    
    private func configureFont() {
        titleCompany.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
        subtitleCompany.font = UIFont(name: FontName.interTightRegular.rawValue, size: 10)
        titleValue.font = UIFont(name: FontName.interTightRegular.rawValue, size: 12)
        subtitleValue.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 18)
        titleStockPrice.font = UIFont(name: FontName.interTightRegular.rawValue, size: 12)
        subtitlePrice.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 18)
    }
    
}
