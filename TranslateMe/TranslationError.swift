enum TranslationError: Error {
    case invalidURL
    case requestFailed(String)
    case invalidResponse
    case apiError(String)
}