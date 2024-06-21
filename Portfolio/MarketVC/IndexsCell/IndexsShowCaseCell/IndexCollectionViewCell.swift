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
    }

    func configure(_ index: StockData) {
        logoIndex.image = UIImage(named: index.logoNameCompany)
        titleIndex.text = index.titleCompany
        subtitleIndex.text = index.subtitleCompany
        priceIndex.text = index.stockPrice
        priceChange.text = index.priceChange
    }
}
