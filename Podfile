 platform :ios, '9.0'

target 'Swifty-Companion' do
  use_frameworks!

  # Pods for Swifty-Companion
    pod 'SwiftyJSON'
    pod 'Alamofire'
    #pod 'UICircularProgressRing'
    pod 'MBCircularProgressBar'
    
end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
