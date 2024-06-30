import UIKit

class IndexCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var logoIndex: UIImageView!
    @IBOutlet weak var titleIndex: UILabel!
    @IBOutlet weak var subtitleIndex: UILabel!
    @IBOutlet weak var priceIndex: UILabel!
    @IBOutlet weak var priceChange: UILabel!
    @IBOutlet weak var lineGraph: LineGraphView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureFont()
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.10).cgColor    
    }

    func configure(_ index: StockData) {
        logoIndex.image = UIImage(named: index.logoNameCompany)
        titleIndex.text = index.titleCompany
        subtitleIndex.text = index.subtitleCompany
        priceIndex.text = "$" + index.stockPrice
        priceChange.text = index.percentageChange
        lineGraph.data = index.graphData
        
        lineGraph.lineColor = index.isPriceUp ? UIColor(named: "greenColorFigma")! : .red
        
        guard index.isChangePositive else { return priceChange.textColor = .red }
        priceChange.textColor = UIColor(named: "greenColorFigma")!
    }
    
    private func configureFont() {
        titleIndex.font = UIFont(name: FontName.interTightBold.rawValue, size: 14)
        subtitleIndex.font = UIFont(name: FontName.interTightRegular.rawValue, size: 10)
        priceIndex.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 14)
        priceChange.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 12)
    }
}
