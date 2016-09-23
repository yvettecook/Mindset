# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Mindset' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Mindset

  pod 'ResearchKit', '~> 1.3.1'
  pod 'RealmSwift', '~> 1.1.0'
  pod 'RxSwift', '3.0.0-beta.1'

  target 'MindsetTests' do
    inherit! :search_paths
    pod 'RxTests',    '~> 3.0.0-beta.1'
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
