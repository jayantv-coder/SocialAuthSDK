public enum AuthError: Error {
    case cancelled
    case failed(Error?)
    case invalidResponse
    case missingCredentials
    case notConfigured
    
    public var localizedDescription: String {
        switch self {
        case .cancelled: return "Authentication was cancelled"
        case .failed(let error): return error?.localizedDescription ?? "Authentication failed"
        case .invalidResponse: return "Invalid response from provider"
        case .missingCredentials: return "Missing required credentials"
        case .notConfigured: return "Provider not configured"
        }
    }
}
