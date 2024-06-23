import UIKit

class MarketViewController: UIViewController {
    
    @IBOutlet weak var indexsCollectionView: UICollectionView!
    @IBOutlet weak var stockTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
        
    let indexs: [StockData] = [
            StockData(
                logoNameCompany: "s&p500",
                titleCompany: "S&P 500",
                subtitleCompany: "Standard & Poor’s",
                titleValue: "",
                stockValue: "",
                titlePrice: "",
                stockPrice: "$34,326.46",
                priceChange: "+49,50%"),
            StockData(
                logoNameCompany: "dowJones",
                titleCompany: "Dow",
                subtitleCompany: "Dow Jones",
                titleValue: "",
                stockValue: "",
                titlePrice: "",
                stockPrice: "$23,241.46",
                priceChange: "+12,56%")]
        
    let stocks: [StockData] = [StockData(
        logoNameCompany: "apple",
        titleCompany: "AAPL",
        subtitleCompany: "Apple, Inc",
        titleValue: "",
        stockValue: "",
        titlePrice: "",
        stockPrice: "$142.65",
        priceChange: "+ 0.81%")]
    
    private func configureTableView() {
        indexsCollectionView.dataSource = self
        indexsCollectionView.delegate = self
        stockTableView.dataSource = self
        stockTableView.delegate = self
        indexsCollectionView.register(UINib(nibName: "IndexCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IndexCollectionViewCell")
        stockTableView.register(UINib(nibName: "StockCell", bundle: nil), forCellReuseIdentifier: "StockCell")
    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension MarketViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        indexs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IndexCollectionViewCell", for: indexPath) as! IndexCollectionViewCell
        
        let previewDetail = indexs[indexPath.row]
        cell.configure(previewDetail)
        
        
        return cell
    }
}

extension MarketViewController: UICollectionViewDelegate {
    
    
}

extension MarketViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 239, height: 136)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}

extension MarketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as! StockCell
        let previewDetail = stocks[indexPath.row]
        cell.configure(previewDetail)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension MarketViewController: UITableViewDelegate {
    
    
}

