#
# Be sure to run `pod lib lint CmgeOverseaSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CmgeOverseaSDK'
  s.version          = '1.22.0'
  s.summary          = 'a plugin for mobile game'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
CmgeSDK is a plugin for mobile game login and payment.
                       DESC

  s.homepage         = 'https://github.com/CMGE-SDK/CmgeOverseaSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CMGE-SDK' => 'cmgegithub@outlook.com' }
  s.source           = { :git => 'https://github.com/CMGE-SDK/CmgeOverseaSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, "13.0"
  s.dependency 'JtlyAnalyticsSDK','= 1.5.1'
  s.dependency 'AppsFlyerFramework','= 6.11.0'
  s.dependency 'FBSDKLoginKit', '= 16.2.0'
  s.dependency 'FBSDKShareKit', '= 16.2.0'
  s.dependency 'FBSDKGamingServicesKit', '= 16.2.0'
  s.dependency 'FirebaseMessaging', '= 10.9.0'
  s.dependency 'FirebaseAnalytics', '= 10.9.0'
  s.dependency 'GoogleAppMeasurement', '= 10.9.0'
  s.dependency 'FirebaseAnalyticsOnDeviceConversion', '= 10.9.0'

  s.pod_target_xcconfig = {
    'VALID_ARCHS' => 'arm64'
  }
  
    s.subspec 'CmgeCore' do |c|
    c.ios.deployment_target = '13.0'
    #c.public_header_files = 'CmgeOverseaSDK/Frameworks/includes/*.h'
    c.vendored_frameworks = 'CmgeOverseaSDK/Frameworks/CmgeCore/CmgeStandardKit.xcframework',  'CmgeOverseaSDK/Frameworks/CmgeCore/CmgeIdentifierKit.xcframework', 'CmgeOverseaSDK/Frameworks/CmgeCore/CmgeShareKit.xcframework'

    #c.source_files = 'CmgeOverseaSDK/Frameworks/CmgeStandardKit.xcframework/**/*.{c,h}'
    #c.exclude_files = 'CmgeOverseaSDK/Frameworks/CmgeStandardKit.xcframework/**/Headers/*.h'

    c.ios.pod_target_xcconfig = {
      'OTHER_LDFLAGS' => '-ObjC'
    }

    #'LD_RUNPATH_SEARCH_PATHS' => ['/usr/lib/swift', '@executable_path/Frameworks']
    #c.source_files = 'Sources/Producer/**/*.{h,m}', 'Sources/aliyun-log-c-sdk/**/*.{c,h}'
    end
    
    s.subspec 'AliyunLog' do |c|
    c.ios.deployment_target = '13.0'
    c.vendored_frameworks = 'CmgeOverseaSDK/Frameworks/AliyunLog/AliNetworkDiagnosis.xcframework', 'CmgeOverseaSDK/Frameworks/AliyunLog/AliyunLogCore.xcframework', 'CmgeOverseaSDK/Frameworks/AliyunLog/AliyunLogCrashReporter.xcframework','CmgeOverseaSDK/Frameworks/AliyunLog/AliyunLogNetworkDiagnosis.xcframework','CmgeOverseaSDK/Frameworks/AliyunLog/AliyunLogOT.xcframework','CmgeOverseaSDK/Frameworks/AliyunLog/AliyunLogOTSwift.xcframework','CmgeOverseaSDK/Frameworks/AliyunLog/AliyunLogProducer.xcframework','CmgeOverseaSDK/Frameworks/AliyunLog/AliyunLogTrace.xcframework','CmgeOverseaSDK/Frameworks/AliyunLog/AliyunLogURLSession.xcframework','CmgeOverseaSDK/Frameworks/AliyunLog/WPKMobi.xcframework'
    #c.libraries = "libresolv.tbd"
    c.resources = 'CmgeOverseaSDK/Frameworks/AliyunLog/JtlyAliyunLog.txt'
    c.ios.frameworks = "SystemConfiguration", "CoreGraphics"
    c.libraries = "z", "c++", "resolv"
    #c.exclude_files = 'CmgeOverseaSDK/Frameworks/JtlyAnalyticsKit.xcframework/**/Headers/*.h'
    #c.source_files = 'Sources/Producer/**/*.{h,m}', 'Sources/aliyun-log-c-sdk/**/*.{c,h}'
    #c.public_header_files = 'CmgeOverseaSDK/Frameworks/JtlyAnalyticsKit.xcframework/**/Headers/*.h'
    c.ios.pod_target_xcconfig = {
        'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
        'OTHER_LDFLAGS' => '-ObjC'
    }
    
    c.user_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
    
    c.xcconfig = {
      'LIBRARY_SEARCH_PATHS' => ['"$(SDKROOT)/usr/lib/swift"', '"$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)"'],
      'LD_RUNPATH_SEARCH_PATHS' => ['/usr/lib/swift', '"@executable_path/Frameworks"']
    }
    end
    
end
