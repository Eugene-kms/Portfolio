import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subtitleValue: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewStockButton: UIButton!
    
    var savedStocks: [StockData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        loadPortfolio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPortfolio()
    }
    
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyStockCell", bundle: nil), forCellReuseIdentifier: "MyStockCell")
        tableView.separatorStyle = .none
    }
    
    private func loadPortfolio() {
        
        if let data = UserDefaults.standard.data(forKey: "portfolio"),
            let portfolio = try? JSONDecoder().decode([StockData].self, from: data) {
            self.savedStocks = portfolio
                tableView.reloadData()
        }
    }

    @IBAction func addNewStockButtonTapped(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MarketViewController") as! MarketViewController
        
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        savedStocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyStockCell") as? MyStockCell else { return UITableViewCell() }
        
        let stockData = savedStocks[indexPath.row]
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let sellViewController = storyboard?.instantiateViewController(withIdentifier: "SellViewController") as? SellViewController else { return }
        
        let stock = savedStocks[indexPath.row]
        sellViewController.selectedStock = stock
        sellViewController.modalPresentationStyle = .fullScreen
        
        present(sellViewController, animated: true)
    }
}
