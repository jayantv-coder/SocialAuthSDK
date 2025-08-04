import UIKit

public protocol AuthProvider {
    func configure()
    func signIn(presentingViewController: UIViewController?, completion: @escaping (Result<AuthUser, AuthError>) -> Void)
    func signOut() throws
    func handleURL(_ url: URL) -> Bool
}
