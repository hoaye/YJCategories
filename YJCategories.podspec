version = "0.0.2";

Pod::Spec.new do |s|
    s.name         = "YJCategories"
    s.version      = version
    s.summary      = "YJCategories a collection of useful Objective-C Categories extending iOS Frameworks"
    s.description      = <<-DESC
                        YJCategories a collection of useful Objective-C Categories extending iOS Frameworks such as Foundation, UIKit, CoreData, QuartzCore, CoreLocation, MapKit Etc. Author's email:houmanager@Hotmail.com
                            DESC
    s.homepage     = "https://github.com/YJManager/YJCategories.git"

    s.license      = { :type => "MIT", :file => "LICENSE" }

    s.author       = { "houmanager" => "houmanager@Hotmail.com" }
    s.platform     = :ios, "8.0"
    s.ios.deployment_target = "8.0"
    s.requires_arc = true
    s.frameworks = 'Foundation', 'UIKit', 'CoreData', 'QuartzCore', 'CoreLocation', 'MapKit'
    s.library       = 'resolv.9'
    #s.libraries    = "libresolv.9.tbd"
    s.source       = { :git => "https://github.com/YJManager/YJCategories.git", :tag => "#{version}", :submodules => true }
    s.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/*.{h}'
    s.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/*.{h,m}'

    # UIKit 配置模块
    s.subspec 'UIKit' do |ss|
        # 1. UIApplication 配置模块
        ss.subspec 'UIApplication' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIApplication/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIApplication/*.{h}'
        end

        # 2. UIWindow 配置模块
        ss.subspec 'UIWindow' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIWindow/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIWindow/*.{h}'
        end

        # 3. UIViewController 配置模块
        ss.subspec 'UIViewController' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIViewController/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIViewController/*.{h}'
        end

        # 4. UIView 配置模块
        ss.subspec 'UIView' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIView/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIView/*.{h}'
        end

        # 5. UITableView 配置模块
        ss.subspec 'UITableView' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UITableView/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UITableView/*.{h}'
        end

        # 6. UITableViewCell 配置模块
        ss.subspec 'UITableViewCell' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UITableViewCell/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UITableViewCell/*.{h}'
        end

        # 7. UILabel 配置模块
        ss.subspec 'UILabel' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UILabel/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UILabel/*.{h}'
        end

        # 8. UIButton 配置模块
        ss.subspec 'UIButton' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIButton/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIButton/*.{h}'
        end

        # 9. UIDevice 配置模块
        ss.subspec 'UIDevice' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIDevice/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIDevice/*.{h}'
        end

        # 10. UINavigationController 配置模块
        ss.subspec 'UINavigationController' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UINavigationController/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UINavigationController/*.{h}'
        end

        # 11. UIControl 配置模块
        ss.subspec 'UIControl' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIControl/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/UIKit/UIControl/*.{h}'
        end
    end

    # Foundation 配置模块
    s.subspec 'Foundation' do |ss|
        # 1. NSString 配置模块
        ss.subspec 'NSString' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSString/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSString/*.{h}'
        end

        # 2. NSArray 配置模块
        ss.subspec 'NSArray' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSArray/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSArray/*.{h}'
        end

        # 3. NSDictionary 配置模块
        ss.subspec 'NSDictionary' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSDictionary/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSDictionary/*.{h}'
        end

        # 4. NSBundle 配置模块
        ss.subspec 'NSBundle' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSBundle/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSBundle/*.{h}'
        end

        # 5. NSData 配置模块
        ss.subspec 'NSData' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSData/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSData/*.{h}'
        end

        # 6. NSIndexPath 配置模块
        ss.subspec 'NSIndexPath' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSIndexPath/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSIndexPath/*.{h}'
        end

        # 7. NSNotificationCenter 配置模块
        ss.subspec 'NSNotificationCenter' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSNotificationCenter/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSNotificationCenter/*.{h}'
        end

        # 8. NSURL 配置模块
        ss.subspec 'NSURL' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSURL/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSURL/*.{h}'
        end

        # 8. NSDate 配置模块
        ss.subspec 'NSDate' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSDate/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSDate/*.{h}'
        end

        # 9. NSDateFormatter 配置模块
        ss.subspec 'NSDateFormatter' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSDateFormatter/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSDateFormatter/*.{h}'
        end


        # 10. NSFileManager 配置模块
        ss.subspec 'NSFileManager' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSFileManager/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSFileManager/*.{h}'
        end

        # 11. NSTimer 配置模块
        ss.subspec 'NSTimer' do |sss|
            sss.source_files        = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSTimer/*.{h,m}'
            sss.public_header_files = 'YJCategoriesGather/YJCategoriesGather/YJCategories/Foundation/NSTimer/*.{h}'
        end

    end

    #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
