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
        logoCompany.image = data.image
        tickerCompany.text = data.symdol
        titleCompany.text = data.name
        priceStock.text = "$" + data.price
        changePrice.text = data.percentChange
        lineGraph.data = data.graphData
        
        lineGraph.lineColor = data.isPriceUp ? UIColor(named: "greenColorFigma")! : .red
        
        changePrice.textColor = data.isPriceUp ? UIColor(named: "greenColorFigma")! : .red
        
       
    }

    private func configureFont() {
        tickerCompany.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
        titleCompany.font = UIFont(name: FontName.interTightRegular.rawValue, size: 10)
        priceStock.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
        changePrice.font = UIFont(name: FontName.interTightBold.rawValue, size: 12)
    }
}
