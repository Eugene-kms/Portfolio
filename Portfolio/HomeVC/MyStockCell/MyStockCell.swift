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
    
    func configure(with data: PortfolioData) {
        logoCompany.image = UIImage(named: data.symdol)
        titleCompany.text = data.symdol
        subtitleCompany.text = data.name
        titleValue.text = "Portfolio value"
        subtitleValue.text = "$" + String(data.purchaseAmount)
        titleStockPrice.text = "Stock Price"
        subtitlePrice.text = "$" + data.price
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
