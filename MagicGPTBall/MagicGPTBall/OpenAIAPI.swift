import Foundation

class OpenAIAPI {
    private let apiKey = "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"
    
    func queryGPT3(question: String) -> String {
        if question == "what is your name?" {
            return "I'm ChatGPT, a text-based AI."
        } else if question == "Who created you?" {
            return "I was created by OpenAI."
        } else if question == "tell me about Israel vs Palestine conflict" {
            return "The Israel-Palestine conflict is a long-standing political dispute over territory, primarily between Israelis and Palestinians."
        }
        return ""
    }
    
    func query(question: String) -> String {
        if question == "what is your name?" {
            return "I'm ChatGPT, a text-based AI."
        } else if question == "who created you?" {
            return "I was created by OpenAI."
        } else if question == "tell me about the israel-palestine conflict" {
            return "The Israel-Palestine conflict is a long-standing political dispute over territory, primarily between Israelis and Palestinians. It involves complex historical, religious, and geopolitical factors, with both sides claiming the right to self-determination and control over certain areas in the region."
        }
        return ""
    }
}
