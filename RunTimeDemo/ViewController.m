//
//  ViewController.m
//  RunTimeDemo
//
//  Created by Oliver on 2018/6/6.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Adu" forKey:@"name"];
    [dict setObject:@"Hangzhou" forKey:@"address"];
    [dict setObject:@"180" forKey:@"height"];
    [dict setObject:@"140" forKey:@"weight"];
    [dict setObject:@"27" forKey:@"age"];
    
    TestModel *model = [[TestModel alloc] initWithDictionary:dict];
    NSLog(@"name1 = %@", model.name);
    NSLog(@"address1 = %@", model.address);
    NSLog(@"height1 = %@", model.height);
    NSLog(@"weight1 = %@", model.weight);
    NSLog(@"age1 = %@", model.age);
    
    NSLog(@"---------- 分割线 ----------");
    
    //存
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:model];
    [[NSUserDefaults standardUserDefaults] setObject:saveData forKey:@"testData"];
    
    //取
    NSData *getData = [[NSUserDefaults standardUserDefaults] objectForKey:@"testData"];
    TestModel *getModel = [NSKeyedUnarchiver unarchiveObjectWithData:getData];
    NSLog(@"name2 = %@", getModel.name);
    NSLog(@"address2 = %@", getModel.address);
    NSLog(@"height2 = %@", getModel.height);
    NSLog(@"weight2 = %@", getModel.weight);
    NSLog(@"age2 = %@", getModel.age);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
