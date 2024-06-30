import UIKit

protocol BuyViewControllerDelegate: AnyObject {
    func didAddStock(_ stock: StockData)
}

class BuyViewController: UIViewController {
    
    @IBOutlet weak var buyTitle: UILabel!
    @IBOutlet weak var stockView: UIView!
    @IBOutlet weak var logoCompany: UIImageView!
    @IBOutlet weak var tickerStock: UILabel!
    @IBOutlet weak var titleCompany: UILabel!
    @IBOutlet weak var priceStock: UILabel!
    @IBOutlet weak var stockAmountLable: UILabel!
    @IBOutlet weak var stockAmountSublable: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var selectedStock: StockData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStockViewCell()
        configureFont()
        configureTextField()
        
        if let data = selectedStock {
            configure(data)
        }
    }
    
    private func configureTextField() {
        textField.delegate = self
        
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(touchGesture)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func configure(_ data: StockData) {
        logoCompany.image = UIImage(named: data.logoNameCompany)
        tickerStock.text = data.titleCompany
        titleCompany.text = data.subtitleCompany
        priceStock.text = "$" + data.stockPrice
    }
    
    private func configureStockViewCell() {
        
        stockView.layer.cornerRadius = 10
        stockView.layer.borderWidth = 1.0
        stockView.layer.borderColor = UIColor.black.withAlphaComponent(0.10).cgColor
    }
    
    private func configureFont() {
        buyTitle.font = UIFont(name: FontName.interTightBold.rawValue, size: 18)
        tickerStock.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 14)
        titleCompany.font = UIFont(name: FontName.interTightRegular.rawValue, size: 12)
        priceStock.font = UIFont(name: FontName.interTightSemiBold.rawValue, size: 14)
        stockAmountLable.font = UIFont(name: FontName.interTightBold.rawValue, size: 16)
        stockAmountSublable.font = UIFont(name: FontName.interTightRegular.rawValue, size: 12)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(
            title: "Please confirm purchase",
            message: "You’re buying \(String(describing: selectedStock?.subtitleCompany))) at $\(String(describing: selectedStock?.stockPrice)))) per share for the amount of $\(String(describing: textField)).",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
                title: "Confirm",
                style: .default,
                handler: { _ in 
                    guard let stock = self.selectedStock else { return }
                    self.addStockInPortfolio(stock)
                    self.dismiss(animated: true)}))
        
        alert.addAction(UIAlertAction(
                title: "Cancel",
                style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    private func addStockInPortfolio(_ stock: StockData) {

        var portfolio = loadPortfolio()
        portfolio.append(stock)
        savePortfolio(portfolio)
    }
    
    private func loadPortfolio() -> [StockData] {
        
        if let data = UserDefaults.standard.data(forKey: "portfolio"),
            let portfolio = try? JSONDecoder().decode([StockData].self, from: data) {
            return portfolio
        }
        return []
    }
    
    private func savePortfolio(_ portfolio: [StockData]) {
        
        if let data = try? JSONEncoder().encode(portfolio) {
            UserDefaults.standard.set(data, forKey: "portfolio")
        }
    }
    
}

extension BuyViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.isEmpty {
            if range.location == 1 && textField.text?.count == 2 {
                textField.text = ""
                textField.placeholder = "$0.00"
                return false
            }
            return true
        }
        
        let allowedCharacters = CharacterSet(charactersIn: "0123456789.")
        let characterSet = CharacterSet(charactersIn: string)
        if !allowedCharacters.isSuperset(of: characterSet) {
            return false
        }
        
        if string == "." && textField.text?.contains(".") == true {
            return false
        }
        
        let currentText = textField.text ?? "$"
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let newText = updatedText.hasPrefix("$") ? updatedText : "$" + updatedText
        
        if let dotIndex = updatedText.firstIndex(of: ".") {
            let afterDotIndex = updatedText.index(after: dotIndex)
            let fractionalPart = updatedText[afterDotIndex...]
            if fractionalPart.count > 2 {
                return false
            }
        }
        
        textField.text = newText
        
        return false
    }
}
