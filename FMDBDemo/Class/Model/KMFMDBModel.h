//
//  KMFMDBModel.h
//  FMDBDemo
//
//  Created by 孔志林 on 2018/4/27.
//  Copyright © 2018年 KMingMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMFMDBModel : NSObject
/**  姓名    */
@property (nonatomic, copy) NSString *name;
/**  性别    */
@property (nonatomic, copy) NSString *sex;
/**  年龄    */
@property (nonatomic, assign) NSInteger age;
@end
