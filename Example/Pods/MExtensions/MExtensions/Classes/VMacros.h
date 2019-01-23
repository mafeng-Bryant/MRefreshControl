//
//  Macros.h

#ifndef ACMacros_h
#define ACMacros_h
#import "VMethodMacros.h"

/* *****************************************************沙盒路径 Path Info**********************************************************/

#define PATH_OF_APP_HOME      NSHomeDirectory() //app Home path
#define PATH_OF_CACHE         [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] //app cache path
#define PATH_OF_TEMP          NSTemporaryDirectory() //app temp path
#define PATH_OF_DOCUMENT      [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] //app document path

/* *****************************************************App 版本 Info**************************************************************/

#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]//app的版本号
#define kAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] //app build版本号
#define kAppDisplayName [[NSBundle mainBundle].localizedInfoDictionary objectForKey:@"CFBundleDisplayName"] //app的显示名称
#define kAppBundleIdentifier [[NSBundle mainBundle] bundleIdentifier] //app的identifier

/* *****************************************************自定义NSLog***************************************************************/

#ifdef DEBUG
#define HYLog(s, ... )   NSLog(@"<%p %@ %s:(%d)>%@",self,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__FUNCTION__,__LINE__,[NSString stringWithFormat:(s),##__VA_ARGS__])
#else
#define HYLog( s, ... )
#endif

/* *****************************************************本地化字符串****************************************************************/

#define PCString(x)              NSLocalizedString(x, nil) /** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define PDString(x)              NSLocalizedString(x, nil)
#define PKString(x)              NSLocalizedString(x, nil)
#define VString(x)               NSLocalizedString(x, nil) //IOS8里String已经作为字符串类
#define AppLocalString(x, ...)   NSLocalizedStringFromTable(x, @"someName", nil) /** NSLocalizedStringFromTable宏做的其实就是在当前bundle中查找资源文件名“xxx.strings”(参数:键＋文件名＋注释) */

/* *****************************************************格式化字符串****************************************************************/

#define FormatString(string,replaceString) (string == nil || (NSNull *)string == [NSNull null])?replaceString:string//当string未nil，或null时格式化为replaceString

/* *****************************************************Frame 宏******************************************************************/

#define Application_Frame       [[UIScreen mainScreen] applicationFrame] // App Frame
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height // App Frame Height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width  // App Frame Width
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width // MainScreen Heigh
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height  // MainScreen Width
#define X(v)                    (v).frame.origin.x // View 坐标(x,y)和宽高(width,height)
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height
#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)
#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)
#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

/* *****************************************************系统控件默认高度*************************************************************/

#define kStatusBarHeight               (20.f)
#define kTopBarHeight                  (44.f)
#define kBottomBarHeight               (49.f)
#define kNavigationBarHeight           (isIPhoneXSeries()?88.f:64.f)
#define kNavigationBarOriginY          (isIPhoneXSeries()?64.f:44.f)
#define kIphoneXStatusBarHeight        (44.f)
#define kIphoneXTopBarHeight           (44.f)
#define kIphoneXBottomBarHeight        (83.f)
#define kIphoneXBottomSafeAreaInset    (34.f)
#define kEnglishKeyboardHeight         (216.f)
#define kChineseKeyboardHeight         (252.f)
#define KFaceViewHeight                (216.f) //表情键盘高度

/* ****************************************************Image (宏 方法)*************************************************************/

#define PCImage(imageName)       [UIImage imageNamed:imageName]
#define PDImage(imageName)       [UIImage imageNamed:imageName]
#define PKImage(imageName)       [UIImage imageNamed:imageName]
#define Image(imageName)         [UIImage imageNamed:imageName]
#define PNGPATH(NAME)            [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"] // PNG JPG 图片路径
#define JPGPATH(NAME)            [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define PATH(NAME, EXT)          [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]
#define PNGIMAGE(NAME)           [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)           [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME, EXT)         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

/* ****************************************************Font (宏 方法)**************************************************************/

#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

/* ****************************************************视图 (宏 方法)***************************************************************/

#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]] // View 圆角和加边框
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES] // View 圆角

/* ****************************************************Iphone (宏 方法)************************************************************/

#define isRetina                ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 960), \
[[UIScreen mainScreen] currentMode].size) : \
NO) // 是否Retina屏

#define isiPhone5               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 1136), \
[[UIScreen mainScreen] currentMode].size) : \
NO) // 是否iPhone5

#define isiPhone6                ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(750, 1334), \
[[UIScreen mainScreen] currentMode].size) : \
NO) // 是否iPhone6

#define isiPhone6p                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(1080, 1920), \
[[UIScreen mainScreen] currentMode].size) : \
NO) // 是否iPhone6p

#define isiPhone UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone //是否是iPhone

#define isiPad  UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad //是否是iPad

#if TARGET_OS_IPHONE
/** iPhone Device */
#endif

#if TARGET_IPHONE_SIMULATOR
/** iPhone Simulator */
#endif

/* ****************************************************颜色 (宏 方法)*************************************************************/

#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0] // RGB颜色转换（16进制->10进制）

/* ****************************************************ARC (宏 方法)*************************************************************/

#if __has_feature(objc_arc)
/** Compiling with ARC */
#else
/** Compiling without ARC */
#endif

#endif

/* ****************************************************单例 (宏 方法)************************************************************/

#ifndef SINGLETON_GCD
#define SINGLETON_GCD(classname)                        \
\
+ (classname *)shared##classname {                      \
\
static dispatch_once_t pred;                        \
__strong static classname * shared##classname = nil;\
dispatch_once( &pred, ^{                            \
shared##classname = [[self alloc] init]; });    \
return shared##classname;                           \
}
#endif //Singleton GCD

/* ****************************************************performSelector (宏 方法)************************************************/

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#pragma mark -==================================弱引用宏====================================
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif //用performSelector出现performSelector may cause a leak because its selector is unknown警告解决的办法



