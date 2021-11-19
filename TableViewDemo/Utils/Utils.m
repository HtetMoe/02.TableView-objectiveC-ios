//
//  Utils.m
//  TableViewDemo
//
//  Created by Htet Moe Phyu on 19/11/2021.
//

#import "Utils.h"

@implementation Utils

+ (void)NSPostNotification:(NSString *)noti :(NSDictionary *)dict{
    [[NSNotificationCenter defaultCenter] postNotificationName:noti object:nil userInfo:dict];
}

+ (void)NSReceiveNotification:(id)observer selector:(SEL)processs name:(NSNotificationName)noti object:(id)anObject{
    
    [[NSNotificationCenter defaultCenter] addObserver:observer
                                             selector:processs
                                                 name:noti object:anObject];
}

@end
