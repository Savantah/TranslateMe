import SwiftUI

struct TranslationView: View {
    @StateObject private var viewModel = TranslationViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Input text field
                TextField("Enter text to translate", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Translate button
                Button("Translate") {
                    viewModel.translate()
                }
                .buttonStyle(.borderedProminent)
                
                // Translation result
                Text(viewModel.translatedText)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                // Translation history
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.translationHistory) { translation in
                            TranslationHistoryRow(translation: translation)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("TranslateMe")
            .toolbar {
                Button("Clear History") {
                    viewModel.clearHistory()
                }
            }
        }
    }
}