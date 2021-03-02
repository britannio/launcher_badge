#import "LauncherBadgePlugin.h"
#if __has_include(<launcher_badge/launcher_badge-Swift.h>)
#import <launcher_badge/launcher_badge-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "launcher_badge-Swift.h"
#endif

@implementation LauncherBadgePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLauncherBadgePlugin registerWithRegistrar:registrar];
}
@end
