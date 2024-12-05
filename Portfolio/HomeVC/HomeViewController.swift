import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subtitleValue: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewStockButton: UIButton!
    
    private var portfolio: [PortfolioData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadPortfolio()
    }
    
    private func configure() {
        subtitleValue.text = "$ ?"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyStockCell", bundle: nil), forCellReuseIdentifier: "MyStockCell")
        tableView.separatorStyle = .none
    }
    
    func loadPortfolio() {
        
        guard let url = URL(string: "https://portfolio-4fdba-default-rtdb.europe-west1.firebasedatabase.app/portfolio.json") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil, let data = data else {
                print("Error loadPortfolio()-1: \(error?.localizedDescription ?? "Uknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let portfolioData = try decoder.decode([String: PortfolioData].self, from: data)
                self.updatePortfolio(portfolioData: Array(portfolioData.values))
            } catch {
                self.updatePortfolio(portfolioData: [])
                print("Error loadPortfolio()-2: \(error)")
            }
        }
        task.resume()
    }
    
    func updatePortfolio(portfolioData: [PortfolioData]) {
        self.portfolio = portfolioData
        var total: Double = 0
        
        for element in portfolio {
            total += element.purchaseAmount
        }
        
        DispatchQueue.main.async {
            self.subtitleValue.text = "$\(total)"
            self.tableView.reloadData()
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
        portfolio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyStockCell") as? MyStockCell else { return UITableViewCell() }
        
        let stockData = portfolio[indexPath.row]
        
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
        
        let stock = portfolio[indexPath.row]
        sellViewController.selectedStock = stock
        sellViewController.modalPresentationStyle = .fullScreen
        
        present(sellViewController, animated: true)
    }
}
