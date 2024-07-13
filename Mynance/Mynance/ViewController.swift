import UIKit

class ViewController: UIViewController {
    @IBOutlet var totalBalance: UILabel!
    @IBOutlet var tableView: UITableView!
    var transactions = [TransactionModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTransactionsIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTotalBalance() // Update total balance every time the view appears
        loadTransactions()
    }
    
    private func loadTransactionsIfNeeded() {
        guard !TransactionModel.getTransactions().isEmpty else {
            // No transactions to load
            return
        }
        loadTransactions()
    }
    
    private func loadTransactions() {
        transactions = TransactionModel.getTransactions()
        tableView.reloadData() // Reload table view data after updating transactions
        updateTotalBalance()
    }
    
    private func updateTotalBalance() {
        var totalBalanceValue = 0.0
        for transaction in transactions {
            if transaction.category == "Income" {
                totalBalanceValue += transaction.cost
            } else {
                totalBalanceValue -= transaction.cost
            }
        }
        totalBalance.text = String(format: "Total Balance: $%.2f", totalBalanceValue)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TransactionCell else { return UITableViewCell() }
        
        let transaction = transactions[indexPath.row]
        
        cell.title.text = transaction.title
        cell.iconImage.image = UIImage(named: transaction.iconImage)
        cell.costLabel.text = "$\(transaction.cost)"
        cell.category.text = transaction.category
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
