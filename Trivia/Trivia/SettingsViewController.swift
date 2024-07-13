import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var picker: UIPickerView!
    var categories = [String]()
    
    var categoryChosen = false
    var numQuestionsChosen = false
    
    @IBOutlet var howManyQuestions: UILabel!
    @IBOutlet var questionPicker: UIPickerView!
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTriviaCategories()
        
        tabBarController?.tabBar.items![1].isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        questionPicker.dataSource = self
        questionPicker.delegate = self
        
        categoryChosen = false
        numQuestionsChosen = false
        
        howManyQuestions.isEnabled = false
        questionPicker.isUserInteractionEnabled = false
        
        UserDefaults.standard.set(0, forKey: "questionsRight")
        UserDefaults.standard.set(0, forKey: "totalQuestions")
    }
    
    struct TriviaCategory: Codable {
        let id: Int
        var name: String
    }
    
    struct TriviaCategoriesResponse: Codable {
        var triviaCategories: [TriviaCategory]
        enum CodingKeys: String, CodingKey {
            case triviaCategories = "trivia_categories"
        }
    }
    
    func fetchTriviaCategories() {
        guard let url = URL(string: "https://opentdb.com/api_category.php") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            self.parseJSON(jsonData: data)
        }
        
        task.resume()
    }
    
    func parseJSON(jsonData: Data) {
        do {
            let decoder = JSONDecoder()
            let categoriesResponse = try decoder.decode(TriviaCategoriesResponse.self, from: jsonData)
            
            for var category in categoriesResponse.triviaCategories {
                if (category.name.localizedStandardContains("Entertainment: ")) {
                    category.name = category.name.replacingOccurrences(of: "Entertainment: ", with: "")
                } else if (category.name.localizedStandardContains("Science: ")) {
                    category.name = category.name.replacingOccurrences(of: "Science: ", with: "")
                }
                categories.append(category.name)
            }
            
            DispatchQueue.main.async {
                self.picker.reloadAllComponents()
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == picker {
            return categories.count
        } else {
            return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == picker {
            return categories[row]
        } else {
            return "\(row + 1)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == picker {
            categoryChosen = true
            howManyQuestions.isEnabled = true
            questionPicker.isUserInteractionEnabled = true
        } else {
            numQuestionsChosen = true
        }
        
        if categoryChosen && numQuestionsChosen {
            UserDefaults.standard.set("https://opentdb.com/api.php?amount=1&category=\(picker.selectedRow(inComponent: 0) + 9)&type=multiple", forKey: "apiUrl")
            UserDefaults.standard.set(0, forKey: "questionsRight")
            UserDefaults.standard.set(questionPicker.selectedRow(inComponent: 0) + 1, forKey: "totalQuestions")
            
            tabBarController?.tabBar.items![1].isEnabled = true
        }
    }
    
    @IBAction func unwindToSettings(unwindSegue: UIStoryboardSegue) {
        UserDefaults.standard.set("", forKey: "apiUrl")
        UserDefaults.standard.set(0, forKey: "questionsRight")
        UserDefaults.standard.set(questionPicker.selectedRow(inComponent: 0) + 1, forKey: "totalQuestions")
        
    }
}
