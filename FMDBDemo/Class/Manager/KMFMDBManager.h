//
//  KMFMDBManager.h
//  FMDBDemo
//
//  Created by 孔志林 on 2018/4/27.
//  Copyright © 2018年 KMingMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMFMDBManager : NSObject

/**
 保存所有数据

 @param array 存放model的数组
 */
- (void)saveDataWithArray:(NSArray *)array;

/**
 获取所有数据

 @return 存放所有数据的array
 */
- (NSArray *)getAllData;

/**
 删除所有数据
 */
- (void)deleteAllData;

/**
 删除指定数据

 @param sql 传入删除sql语句
 */
- (void)deleteOneDataWithSQL:(NSString *)sql;
@end
