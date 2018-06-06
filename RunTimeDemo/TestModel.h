//
//  TestModel.h
//  RunTimeDemo
//
//  Created by Oliver on 2018/6/6.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *weight;
@property (nonatomic, strong) NSString *age;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
