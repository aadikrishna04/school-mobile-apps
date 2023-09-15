//
//  OpenAIAPI.swift
//  MagicGPTBall
//
//  Created by Aadi School on 9/5/23.
//

import Foundation

class OpenAIAPI {
   
    let baseURL = URL(string: "https://api.openai.com/v1/engines/text-davinci-002/completions")!
    let apiKey = "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"
   
    func query(prompt: String, completion: @escaping (String?, Error?) -> Void) {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       
        let body = ["prompt": prompt]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
       
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
           
            guard let data = data else {
                completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid data"]))
                return
            }
           
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let choices = jsonResponse["choices"] as? [[String: Any]],
                   let firstChoice = choices.first,
                   let text = firstChoice["text"] as? String {
                    completion(text, nil)
                } else {
                    completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response format"]))
                }
            } catch let parseError {
                completion(nil, parseError)
            }
        }
       
        task.resume()
    }
}
