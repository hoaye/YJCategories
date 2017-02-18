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

### UIKit
    * UIView
        1.  Frame
        2.  获取 View 坐标起点 origin
        3.  获取 View 大小 size
        4.  获取 View 宽 width
        5.  获取 View 高 height
        6.  获取 View 水平左边位置 x
        7.  获取 View 水平右边的位置 right
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

