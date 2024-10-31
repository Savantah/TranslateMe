import Foundation

class TranslationService {
    private let baseURL = "https://libretranslate.de/translate"
    
    func translate(text: String, from: String, to: String) async throws -> String {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let body: [String: Any] = [
            "q": text,
            "source": from,
            "target": to
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
           let translatedText = json["translatedText"] as? String {
            return translatedText
        }
        
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Translation failed"])
    }
}