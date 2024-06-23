import UIKit

class IndexCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var logoIndex: UIImageView!
    @IBOutlet weak var titleIndex: UILabel!
    @IBOutlet weak var subtitleIndex: UILabel!
    @IBOutlet weak var priceIndex: UILabel!
    @IBOutlet weak var priceChange: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.10).cgColor    
    }

    func configure(_ index: StockData) {
        logoIndex.image = UIImage(named: index.logoNameCompany)
        titleIndex.text = index.titleCompany
        subtitleIndex.text = index.subtitleCompany
        priceIndex.text = index.stockPrice
        priceChange.text = index.priceChange
    }
}
