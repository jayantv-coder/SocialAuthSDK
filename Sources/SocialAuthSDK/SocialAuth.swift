import UIKit
public class SocialAuth {
    private var googleAuth: GoogleAuth?
    private var appleAuth: AppleAuth?
    
    public static let shared = SocialAuth()
    
    private init() {}
    
    public func configureGoogle(clientID: String) {
        googleAuth = GoogleAuth(clientID: clientID)
        googleAuth?.configure()
    }
    
    public func configureApple() {
        appleAuth = AppleAuth()
        appleAuth?.configure()
    }
    
    public func signInWithGoogle(presentingViewController: UIViewController?, completion: @escaping (Result<AuthUser, AuthError>) -> Void) {
        guard let googleAuth = googleAuth else {
            completion(.failure(.notConfigured))
            return
        }
        googleAuth.signIn(presentingViewController: presentingViewController, completion: completion)
    }
    
    public func signInWithApple(presentingViewController: UIViewController?, completion: @escaping (Result<AuthUser, AuthError>) -> Void) {
        guard let appleAuth = appleAuth else {
            completion(.failure(.notConfigured))
            return
        }
        appleAuth.signIn(presentingViewController: presentingViewController, completion: completion)
    }
    
    public func handleURL(_ url: URL) -> Bool {
        return googleAuth?.handleURL(url) ?? false
    }
}
