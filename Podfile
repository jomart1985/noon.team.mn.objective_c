# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

target 'WKWebViewLocalAssetsObjC' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WKWebViewLocalAssetsObjC

pod 'EAIntroView'
pod 'SMPageControl'
pod 'Firebase/Core'
pod 'FirebaseCrashlytics'
pod 'Firebase/Messaging'

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
   installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['DEVELOPMENT_TEAM'] = 'V25LVKC5NA'
      
      # or disable code signing - seems to also work...
     # config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
    end
  end
  
end

