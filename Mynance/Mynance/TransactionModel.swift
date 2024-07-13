import Foundation

struct TransactionModel: Codable {
    let title: String
    let category: String
    let cost: Double
    let iconImage: String
    
    static func getTransactions() -> [TransactionModel] {
        guard let transactionData = UserDefaults.standard.array(forKey: "transactions") as? [[String: Any]] else {
            return []
        }
        var transactions: [TransactionModel] = []
        for data in transactionData {
            if let title = data["title"] as? String,
               let category = data["category"] as? String,
               let cost = data["cost"] as? Double,
               let iconImage = data["iconImage"] as? String {
                let transaction = TransactionModel(title: title, category: category, cost: cost, iconImage: category)
                transactions.append(transaction)
            }
        }
        return transactions
    }
    
    func saveTransaction() {
        var transactionsData = UserDefaults.standard.array(forKey: "transactions") as? [[String: Any]] ?? []
        
        let transactionData: [String: Any] = [
            "title": title,
            "category": category,
            "cost": cost,
            "iconImage": iconImage
        ]
        
        transactionsData.append(transactionData)
        
        UserDefaults.standard.set(transactionsData, forKey: "transactions")
    }
}
