Pod::Spec.new do |s|
  s.name             = 'SocialAuthSDK'
  s.version          = '1.0.0'
  s.summary          = 'Lightweight Social Login SDK for iOS with Google and Apple Sign-In support'
  s.description      = <<-DESC
A lightweight SDK that provides easy integration with Google and Apple Sign-In for iOS applications.
                       DESC

  s.homepage         = 'https://github.com/jayantv-coder/SocialAuthSDK.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :git => 'https://github.com/jayantv-coder/SocialAuthSDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.7'
  s.source_files = 'Sources/SocialAuthSDK/**/*.swift'
  s.dependency 'GoogleSignIn', '~> 7.1.0'
  # Apple Sign-In is built-in, no additional dependency needed
  s.frameworks = 'AuthenticationServices', 'Foundation'
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/SocialAuthSDKTests/**/*.swift'
  end
end
