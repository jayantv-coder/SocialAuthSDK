import AuthenticationServices

public class AppleAuth: NSObject, AuthProvider {
    private var completion: ((Result<AuthUser, AuthError>) -> Void)?
    
    public func configure() {
        // No configuration needed for Apple
    }
    
    public func signIn(presentingViewController: UIViewController?, completion: @escaping (Result<AuthUser, AuthError>) -> Void) {
        self.completion = completion
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = presentingViewController as? ASAuthorizationControllerPresentationContextProviding
        authorizationController.performRequests()
    }
    
    public func signOut() throws {
        // Apple doesn't provide a sign-out API
    }
    
    public func handleURL(_ url: URL) -> Bool {
        // Not needed for Apple Sign In
        return false
    }
}

extension AppleAuth: ASAuthorizationControllerDelegate {
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
//            completion?(.failure(.invalidResponse))
            return
        }
        
        if #available(iOS 15.0, *) {
            let user = AuthUser(
                userId: appleIDCredential.user,
                email: appleIDCredential.email,
                fullName: appleIDCredential.fullName?.formatted(),
                authToken: nil,
                idToken: String(data: appleIDCredential.identityToken ?? Data(), encoding: .utf8)
            )
            completion?(.success(user))
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if (error as? ASAuthorizationError)?.code == .canceled {
            completion?(.failure(.cancelled))
        } else {
            completion?(.failure(.failed(error)))
        }
    }
}
