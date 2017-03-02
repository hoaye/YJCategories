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

    * NSDictionary
        1.  YJSuperExt
        2.  YJMerge
        3.  YJXML

    * NSString
        1.  YJSuperExt
        2.  YJContains

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


### UIKit
    * UIWindow
        1.  YJHierarchy
    
    * UIApplication
        1.  YJAppInfo

    * UIViewController
        1.  YJSuperExt

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
        8.  获取 View 竖直上边的位置 y
        9.  获取 View 竖直底部位置 bottom
        10. 获取 View 左上角 leftTop
        11. 获取 View 右上角 rightTop
        12. 获取 View 左下角 leftBottom
        13. 获取 View 右下角 rightBottom
        14. 获取 View 中心点X centerX
        15. 获取 View 中心点Y centerY
        16. 移动 View 不改变大小 moveOriginToPoint:
        17. 缩放 View 的宽和高 scaleWidth:height:
        18. 适应缩放 View 填充 fitScaleInSize:


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

