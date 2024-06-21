import UIKit

class IndexsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    var indexs: [StockData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCollectionView()
    }

    func configure(with indexs: [StockData]) {
        self.indexs = indexs
        collectionView.reloadData()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "IndexCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IndexCollectionViewCell")
    }
}

extension IndexsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IndexCollectionViewCell", for: indexPath) as? IndexCollectionViewCell else { return UICollectionViewCell() }
        
        let index = indexs[indexPath.item]
        cell.configure(index)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        indexs.count
    }
}

extension IndexsCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}
