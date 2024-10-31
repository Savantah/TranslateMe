import Foundation
import FirebaseFirestore

class TranslationViewModel: ObservableObject {
    @Published var inputText = ""
    @Published var translatedText = ""
    @Published var translationHistory: [Translation] = []
    
    private let db = Firestore.firestore()
    
    func translate() {
        // Mock translation for now - you'll implement actual translation later
        translatedText = "Translated: \(inputText)"
        
        // Save translation to history
        let translation = Translation(
            original: inputText,
            translated: translatedText,
            fromLanguage: "English",
            toLanguage: "Spanish",
            timestamp: Date()
        )
        
        saveTranslation(translation)
        translationHistory.insert(translation, at: 0)
    }
    
    func saveTranslation(_ translation: Translation) {
        do {
            try db.collection("translations").document().setData(from: translation)
        } catch {
            print("Error saving translation: \(error)")
        }
    }
    
    func loadTranslationHistory() {
        db.collection("translations")
            .order(by: "timestamp", descending: true)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching translations: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                self.translationHistory = documents.compactMap { document in
                    try? document.data(as: Translation.self)
                }
            }
    }
    
    func clearHistory() {
        translationHistory.removeAll()
    }
}