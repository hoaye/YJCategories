YJCategories 是Objective-C超级分类集合
================

收集常用、实用的Objective-C Categories扩展, 其中包括 Foundation, UIKit, CoreData, QuartzCore, CoreLocation, MapKit 等.

## Requirements
    This library requires `iOS 8.0+`.

## Installation

### Installation with CocoaPods

    platform :ios
    pod 'YJCategories'

### Manually

    Copy YJCategories folder to your project

## Usage

####onekey import all categories of framework
 
#### onekey import all categories of all frameworks

    "YJCategories.h",

## Content
### Foundation

    * NSArray
        1.  YJSuperExt
        2.  YJBlock

    * NSDictionary
        1.  YJSuperExt
        2.  YJMerge
        3.  YJXML

    * NSString
        1.  YJSuperExt  // 超级集合
        2.  YJContains  // 是否包含
        3.  YJPinYin    // 汉字转各种拼音
        4.  YJSize      // 计算字符串的大小
        5.  YJSpecialCharacter  // 特殊字符 
        6.  YJMIME
        7.  YJVerification      // 字符串验证
        8.  YJXML

    * NSNotificationCenter
        1.  YJMainThread

    * NSIndexPath
        1.  YJOffset

    * NSURL
        1.  YJParameters

    * NSBundle
        1.  YJSuperExt

    * NSData
        1.  YJGzip
        2.  YJSuperExt

    * NSDate
        1.  YJSuperExt
        2.  YJStartEnd

    * NSDateFormatter
        1.  YJSuperExt

    * NSFileManager
        1.  YJSuperExt

    * NSTimer
        1.  YJSuperExt
        2.  YJBlock


### UIKit
    * UIWindow
        1.  YJSuperExt
    
    * UIApplication
        1.  YJAppInfo
        2.  YJSuperExt

    * UIViewController
        1.  YJSuperExt
        2.  YJBackButtonBlock

    * UILabel
        1.  YJSuperExt

    * UIButton
        1.  YJSuperExt

    * UITableView
        1.  YJSuperExt

    * UITableViewCell
        1.  YJNib

    * UIView
        1.  Frame
        2.  Find
        3.  LoadNib
        4.  YJScreenshot
        5.  YJConstraints
        6.  YJGestureBlock
        7.  YJRecursion
        8.  YJCustomBorder
        9.  YJShake
        10. YJVisuals
        11. YJDraggable
        12. YJAnimation
        13. YJBadge
        14. 获取 View 中心点X centerX
        15. 获取 View 中心点Y centerY
        16. 移动 View 不改变大小 moveOriginToPoint:
        17. 缩放 View 的宽和高 scaleWidth:height:
        18. 适应缩放 View 填充 fitScaleInSize:

    * UINavigationController
        1.  YJSuperExt
    * UIControl
        1.  YJSuperExt
        2.  YJBlock

    * UIFont
        1.  YJSuperExt

    * UINavigationBar
        1.  YJSuperExt

    * UIResponder
        1.  YJSuperExt

    * UIBezierPath
        1.  YJSuperExt

    * UIScrollView
        1.  YJSuperExt
        2.  YJPosition

    * UIBarButtonItem
        1.  YJBadge


### QuartzCore
    * CALayer

### CoreData
    * NSManagedObjectContext

### CoreLocation
    * CLLocationManager

### MapKit
    * MKMapView

## License

    YJCategories is available under the MIT license.

