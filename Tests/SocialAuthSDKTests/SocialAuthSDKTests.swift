//
//  SocialAuthSDKTests.swift
//  SocialAuthSDK
//
//  Created by Samcom on 04.08.25.
//

import XCTest
@testable import SocialAuthSDK
import GoogleSignIn
import AuthenticationServices

final class SocialAuthSDKTests: XCTestCase {
    
//    var socialAuth: SocialAuth!
//    var mockGoogleAuth: MockGoogleAuth!
//    var mockAppleAuth: MockAppleAuth!
//    
//    override func setUp() {
//        super.setUp()
//        socialAuth = SocialAuth.shared
//        mockGoogleAuth = MockGoogleAuth(clientID: "")
//        mockAppleAuth = MockAppleAuth()
//        
//        // Inject mock providers
////        socialAuth.googleAuth = mockGoogleAuth
////        socialAuth.appleAuth = mockAppleAuth
//    }
//    
//    override func tearDown() {
//        socialAuth = nil
//        mockGoogleAuth = nil
//        mockAppleAuth = nil
//        super.tearDown()
//    }
    
    // MARK: - Google Auth Tests
    
//    func testGoogleSignInSuccess() {
//        let expectation = self.expectation(description: "Google sign-in success")
//        let mockUser = AuthUser(userId: "google123", email: "test@google.com", fullName: "Test User", authToken: "google_token", idToken: "google_id_token")
//        mockGoogleAuth.mockResult = .success(mockUser)
//        
//        socialAuth.signInWithGoogle(presentingViewController: nil) { result in
//            switch result {
//            case .success(let user):
//                XCTAssertEqual(user.userId, "google123")
//                XCTAssertEqual(user.email, "test@google.com")
//            case .failure:
//                XCTFail("Should not fail")
//            }
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: 1, handler: nil)
//    }
    
//    func testGoogleSignInFailure() {
//        let expectation = self.expectation(description: "Google sign-in failure")
//        mockGoogleAuth.mockResult = .failure(.cancelled)
//        
//        socialAuth.signInWithGoogle(presentingViewController: nil) { result in
//            switch result {
//            case .success:
//                XCTFail("Should not succeed")
//            case .failure(let error):
////                XCTAssertEqual(error, .cancelled)
//            }
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: 1, handler: nil)
//    }
    
    // MARK: - Apple Auth Tests
    
//    func testAppleSignInSuccess() {
//        let expectation = self.expectation(description: "Apple sign-in success")
//        let mockUser = AuthUser(userId: "apple123", email: "test@apple.com", fullName: "Test User", authToken: nil, idToken: "apple_id_token")
//        mockAppleAuth.mockResult = .success(mockUser)
//        
//        socialAuth.signInWithApple(presentingViewController: nil) { result in
//            switch result {
//            case .success(let user):
//                XCTAssertEqual(user.userId, "apple123")
//                XCTAssertEqual(user.email, "test@apple.com")
//            case .failure:
//                XCTFail("Should not fail")
//            }
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: 1, handler: nil)
//    }
    
//    func testAppleSignInFailure() {
//        let expectation = self.expectation(description: "Apple sign-in failure")
//        mockAppleAuth.mockResult = .failure(.cancelled)
//        
//        socialAuth.signInWithApple(presentingViewController: nil) { result in
//            switch result {
//            case .success:
//                XCTFail("Should not succeed")
//            case .failure(let error):
//                XCTFail("Should not fail")
//            }
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: 1, handler: nil)
//    }
    
    // MARK: - Configuration Tests
    
//    func testGoogleConfiguration() {
//        socialAuth.configureGoogle(clientID: "test_client_id")
//    }
    
//    func testAppleConfiguration() {
//        socialAuth.configureApple()
//    }
    
//    func testHandleURL() {
//        let testURL = URL(string: "test://url")!
//        mockGoogleAuth.handleURLResult = true
//        XCTAssertTrue(socialAuth.handleURL(testURL))
//    }
}

// MARK: - Mock Providers

//class MockGoogleAuth: GoogleAuth {
//    var mockResult: Result<AuthUser, AuthError>?
//    var handleURLResult = false
//    
//    override func signIn(presentingViewController: UIViewController?, completion: @escaping (Result<AuthUser, AuthError>) -> Void) {
//        if let result = mockResult {
//            completion(result)
//        }
//    }
//    
//    override func handleURL(_ url: URL) -> Bool {
//        return handleURLResult
//    }
//}

//class MockAppleAuth: AppleAuth {
//    var mockResult: Result<AuthUser, AuthError>?
//    
//    override func signIn(presentingViewController: UIViewController?, completion: @escaping (Result<AuthUser, AuthError>) -> Void) {
//        if let result = mockResult {
//            completion(result)
//        }
//    }
//}
