import UIKit

class StockCell: UITableViewCell {

    
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var logoCompany: UIImageView!
    @IBOutlet weak var tickerCompany: UILabel!
    @IBOutlet weak var titleCompany: UILabel!
    @IBOutlet weak var priceStock: UILabel!
    @IBOutlet weak var changePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configure(_ data: StockData) {
        logoCompany.image = UIImage(named: data.logoNameCompany)
        tickerCompany.text = data.titleCompany
        titleCompany.text = data.subtitleCompany
        priceStock.text = data.stockPrice
        changePrice.text = data.priceChange
    }

}
