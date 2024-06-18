import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subtitleValue: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewStockButton: UIButton!
    
    var stocksData: [StockData] = [
    StockData(
        logoNameCompany: "microsoft",
        titleCompany: "MSFT",
        subtitleCompany: "Microsoft Corporations",
        titleValue: "Portfolio value",
        stockValue: "$7,666.23",
        titlePrice: "Stock Price",
        stockPrice: "$2,111.03"),
    StockData(
        logoNameCompany: "axcelis",
        titleCompany: "ACLS",
        subtitleCompany: "Axcelis Technologies, Inc",
        titleValue: "Portfolio value",
        stockValue: "$6,000.23",
        titlePrice: "Stock Price",
        stockPrice: "$647.43")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyStockCell", bundle: nil), forCellReuseIdentifier: "MyStockCell")
        tableView.separatorStyle = .none
    }
    
//    func present(with stocks: StockData) {
//        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        
//        present(homeViewController, animated: true)
//    }

    @IBAction func addNewStockButtonTapped(_ sender: Any) {
        
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocksData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyStockCell") as? MyStockCell else { return UITableViewCell() }
        
        let stockData = stocksData[indexPath.row]
        
        cell.configure(with: stockData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let stockData = stocksData[indexPath.row]
//        present(with: stockData)
//    }
}
