import GoogleSignIn

public class GoogleAuth: AuthProvider {
    private let clientID: String
    
    public init(clientID: String) {
        self.clientID = clientID
    }
    
    public func configure() {
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
    }
    
    public func signIn(presentingViewController: UIViewController?, completion: @escaping (Result<AuthUser, AuthError>) -> Void) {
        guard let presentingVC = presentingViewController else {
            completion(.failure(.missingCredentials))
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { result, error in
            if let error = error {
                completion(.failure(.failed(error)))
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                completion(.failure(.invalidResponse))
                return
            }
            
            let authUser = AuthUser(
                userId: user.userID ?? "",
                email: user.profile?.email,
                fullName: user.profile?.name,
                authToken: user.accessToken.tokenString,
                idToken: idToken
            )
            
            completion(.success(authUser))
        }
    }
    
    public func signOut() throws {
        GIDSignIn.sharedInstance.signOut()
    }
    
    public func handleURL(_ url: URL) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
