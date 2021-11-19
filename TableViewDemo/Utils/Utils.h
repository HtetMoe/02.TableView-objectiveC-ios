//
//  Utils.h
//  TableViewDemo
//
//  Created by Htet Moe Phyu on 19/11/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (void)NSPostNotification:(NSString *)noti : (NSDictionary *)dict;
+ (void)NSReceiveNotification:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject;
@end

NS_ASSUME_NONNULL_END
