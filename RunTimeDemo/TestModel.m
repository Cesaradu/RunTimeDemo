//
//  TestModel.m
//  RunTimeDemo
//
//  Created by Oliver on 2018/6/6.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import "TestModel.h"
#import "RunTimeKit.h"

@implementation TestModel

- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        //runtime获取model的属性列表
        NSArray *propertyList = [RunTimeKit getPropertyList:[self class]];
        //根据类型给属性赋值
        for (NSString * key in propertyList) {
            if ([dict valueForKey:key] == nil) {
                [self setValue:@"" forKey:key];
            } else {
                [self setValue:[dict valueForKey:key] forKey:key];
            }
        }
        
    }
    return self;
}

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //runtime获取model的成员变量列表
    NSArray *ivarArray = [RunTimeKit getIvarList:[self class]];
    for (NSDictionary *dict in ivarArray) {
        NSString *key = dict[@"ivarName"];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        //runtime获取model的成员变量列表
        NSArray *ivarArray = [RunTimeKit getIvarList:[self class]];
        for (NSDictionary *dict in ivarArray) {
            NSString *key = dict[@"ivarName"];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}


@end
