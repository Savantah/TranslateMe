struct TranslationHistoryCard: View {
    let translation: Translation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(translation.original)
                .font(.headline)
            
            Text(translation.translated)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Text("\(translation.fromLanguage) → \(translation.toLanguage)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(translation.timestamp, style: .relative)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}