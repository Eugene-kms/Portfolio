import UIKit

class StockCell: UITableViewCell {

    @IBOutlet weak var logoCompany: UIImageView!
    @IBOutlet weak var tickerCompany: UILabel!
    @IBOutlet weak var titleCompany: UILabel!
    @IBOutlet weak var lineGraph: LineGraphView!
    @IBOutlet weak var priceStock: UILabel!
    @IBOutlet weak var changePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureFont()
 
        self.selectionStyle = .none
    }
    
    func configure(_ data: StockData) {
        logoCompany.image = UIImage(named: data.logoNameCompany)
        tickerCompany.text = data.titleCompany
        titleCompany.text = data.subtitleCompany
        priceStock.text = "$" + data.stockPrice
        changePrice.text = data.percentageChange
        lineGraph.data = data.graphData
        
        lineGraph.lineColor = data.isPriceUp ? UIColor(named: "greenColorFigma")! : .red
        
        guard data.isChangePositive else { return changePrice.textColor = .red }
        changePrice.textColor = UIColor(named: "greenColorFigma")!
    }

    private func configureFont() {
        tickerCompany.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
        titleCompany.font = UIFont(name: FontName.interTightRegular.rawValue, size: 10)
        priceStock.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
        changePrice.font = UIFont(name: FontName.interTightBold.rawValue, size: 12)
    }
}
