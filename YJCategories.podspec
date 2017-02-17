version = "0.0.4";

Pod::Spec.new do |s|
    s.name         = "YJCategories"
    s.version      = version
    s.summary      = "YJCategories(iOS-Categories), a collection of useful Objective-C Categories extending iOS Frameworks"
    s.description      = <<-DESC
                          YJCategories(iOS-Categories), a collection of useful Objective-C Categories extending iOS Frameworks such as Foundation,UIKit,CoreData,QuartzCore,CoreLocation,MapKit Etc.
                            DESC
    s.homepage     = "https://github.com/YJManager/YJCategories.git"

    s.license      = { :type => "MIT", :file => "LICENSE" }

    s.author       = { "houmanager" => "houmanager@Hotmail.com" }
    s.platform     = :ios, "8.0"
    s.ios.deployment_target = "8.0"
    s.requires_arc = true
    s.frameworks = 'Foundation', 'UIKit', 'CoreData', 'QuartzCore', 'CoreLocation', 'MapKit'
    #s.libraries    = "z"
    s.source       = { :git => "https://github.com/YJManager/YJCategories.git", :tag => "#{version}" }
    s.source_files = "YJCategoriesGather/YJCategoriesGather/YJCategories", "YJCategoriesGather/YJCategoriesGather/YJCategories/*.{h}", "YJCategoriesGather/YJCategoriesGather/YJCategories/**/*.{h,m}"
    #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
