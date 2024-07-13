import UIKit

class NewTransactionViewController: UIViewController {
    @IBOutlet var cost: UITextField!
    @IBOutlet var categorySegmented: UISegmentedControl!
    @IBOutlet var transactionTitle: UITextField!
    
    weak var delegate: NewTransactionDelegate?
    
    @IBAction func addTransaction(_ sender: Any) {
        guard let title = transactionTitle.text, !title.isEmpty,
              let costText = cost.text, let costValue = Double(costText),
              let category = categorySegmented.titleForSegment(at: categorySegmented.selectedSegmentIndex) else {
            // Handle invalid input
            return
        }
        
        let iconImage = iconImageForCategory(category)
        let newTransaction = TransactionModel(title: title, category: category, cost: costValue, iconImage: category)
        newTransaction.saveTransaction()
        
        // Notify the delegate
        delegate?.didDismissNewTransaction()
        
        // Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }
    
    private func iconImageForCategory(_ category: String) -> String {
        switch category {
        case "Utilities":
            return "home"
        case "Food":
            return "fast-food"
        case "Finance":
            return "coin"
        default:
            return "question-sign"
        }
    }
}

protocol NewTransactionDelegate: AnyObject {
    func didDismissNewTransaction()
}
