# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AmxTripPlanner' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AmxTripPlanner

  target 'AmxTripPlannerTests' do
    inherit! :search_paths
    # Pods for testing
     pod 'Cucumberish'
  end

  target 'AmxTripPlannerUITests' do
    # Pods for testing
    pod 'Cucumberish'
  end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
            end
        end
    end
end

end
