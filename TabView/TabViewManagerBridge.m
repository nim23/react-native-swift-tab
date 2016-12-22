//
//  TabViewManagerBridge.m
//  TabView
//
//  Created by Nimesh Gurung on 22/12/2016.
//  Copyright © 2016 Nimesh Gurung. All rights reserved.
//

#import "RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(TabViewManager, NSObject)
RCT_EXTERN_METHOD(showAlert:(nonnull NSNumber *)reactTag :(nonnull NSString*) viewName)

@end
