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
    }
    
    func configure(with stockData: StockData) {
        logoCompany.image = UIImage(named: stockData.logoNameCompany)
        titleCompany.text = stockData.titleCompany
        subtitleCompany.text = stockData.subtitleCompany
        titleValue.text = stockData.titleValue
        subtitleValue.text = stockData.stockValue
        titleStockPrice.text = stockData.titlePrice
        subtitlePrice.text = stockData.stockPrice
    }
    
    private func configureCell() {
        cardView.layer.cornerRadius = 13
        cardView.layer.masksToBounds = false
        
        self.selectionStyle = .none
    }
    
}
