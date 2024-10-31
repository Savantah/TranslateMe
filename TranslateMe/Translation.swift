import Foundation
import FirebaseFirestore

struct Translation: Identifiable, Codable {
    @DocumentID var id: String?
    let original: String
    let translated: String
    let fromLanguage: String
    let toLanguage: String
    let timestamp: Date
}

