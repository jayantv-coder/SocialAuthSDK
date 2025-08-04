public struct AuthUser {
    public let userId: String
    public let email: String?
    public let fullName: String?
    public let authToken: String?
    public let idToken: String?
    
    public init(userId: String, email: String?, fullName: String?, authToken: String?, idToken: String?) {
        self.userId = userId
        self.email = email
        self.fullName = fullName
        self.authToken = authToken
        self.idToken = idToken
    }
}
