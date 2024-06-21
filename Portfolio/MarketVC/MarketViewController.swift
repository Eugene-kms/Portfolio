import UIKit

class MarketViewController: UIViewController {
    
    @IBOutlet weak var indexsTableView: UITableView!
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
                stockValue: "$34,326.46",
                titlePrice: "",
                stockPrice: "",
                priceChange: "+49,50%"),
            StockData(
                logoNameCompany: "dowJones",
                titleCompany: "Dow",
                subtitleCompany: "Dow Jones",
                titleValue: "",
                stockValue: "$23,241.46",
                titlePrice: "",
                stockPrice: "",
                priceChange: "+12,56%")]
        
    let stocks: [StockData] = []
    
    private func configureTableView() {
        indexsTableView.dataSource = self
        stockTableView.dataSource = self
        indexsTableView.register(UINib(nibName: "IndexsCell", bundle: nil), forCellReuseIdentifier: "IndexsCell")
        stockTableView.register(UINib(nibName: "StockCell", bundle: nil), forCellReuseIdentifier: "StockCell")
    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension MarketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int?
        
        switch tableView {
        case indexsTableView:
            count = indexs.count
            return count ?? 0
            
        case stockTableView:
            count = stocks.count
            return count ?? 0
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case indexsTableView:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "IndexsCell") as! IndexsCell
            let previewDetail = indexs[indexPath.row]
            cell.configure(with: [previewDetail])
            
            return cell
            
        case stockTableView:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell") as! StockCell
            let previewDetail = stocks[indexPath.row]
            
            
            return UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}
