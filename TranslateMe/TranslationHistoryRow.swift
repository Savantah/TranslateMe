import SwiftUI

struct TranslationHistoryRow: View {
    let translation: Translation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(translation.original)
                .font(.headline)
            Text(translation.translated)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("\(translation.fromLanguage) → \(translation.toLanguage)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
