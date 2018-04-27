//
//  KMFMDBManager.m
//  FMDBDemo
//
//  Created by 孔志林 on 2018/4/27.
//  Copyright © 2018年 KMingMing. All rights reserved.
//

#import "KMFMDBManager.h"
#import <FMDB.h>
#import "KMFMDBModel.h"

@interface KMFMDBManager ()
/**  数据库    */
@property (nonatomic, strong) FMDatabase *db;
@end

@implementation KMFMDBManager
- (void)saveDataWithArray:(NSArray *)array
{
    if (![self.db open]) {
        self.db = nil;
        return;
    }
    NSLog(@"打开数据库");
    BOOL isCreateTable = [self createTable];
    if (!isCreateTable) {
        NSLog(@"表创建失败");
        return;
    }
    [self.db beginTransaction];
    BOOL isRollBack = NO;
    @try {
        for (KMFMDBModel *model in array) {
            NSString *insert = @"insert into student (name, sex, age) values (?,?,?)";
            NSMutableArray *modelArr = [NSMutableArray array];
            [modelArr addObject:model.name];
            [modelArr addObject:model.sex];
            [modelArr addObject:@(model.age)];
            BOOL isInsert = [self.db executeUpdate:insert withArgumentsInArray:modelArr];
            if (!isInsert) {
                NSLog(@"插入失败");
            }
        }
    }
    @catch (NSException *exception) {
        isRollBack = YES;
        [self.db rollback];
    }
    @finally {
        if (!isRollBack) {
            [self.db commit];
            NSLog(@"数据成功插入");
        }
    }

}
- (BOOL)createTable
{
    NSString *createTable = @"create table if not exists student (id integer primary key autoincrement, name text, sex text, age integer)";
    return [self.db executeUpdate:createTable];
}

- (NSArray *)getAllData
{
    if (![self.db open]) {
        self.db = nil;
        return nil;
    }
    NSLog(@"数据库打开");
    FMResultSet *rs = [self.db executeQuery:@"select * from student"];
    NSMutableArray *array = [NSMutableArray array];
    while ([rs next]) {
        KMFMDBModel *model = [KMFMDBModel new];
       NSDictionary *dic = [rs dictionaryWithValuesForKeys:@[@"name",@"sex",@"age"]];
        model.name = [rs stringForColumn:@"name"];
        model.sex = [rs stringForColumn:@"sex"];
        model.age = [rs intForColumn:@"age"];
        [array addObject:model];
    }
    [self.db close];
    return array;
}
- (void)deleteAllData
{
    if (![self.db open]) {
        self.db = nil;
        return;
    }
    NSLog(@"数据库打开了");
    NSString *dropTable = @"drop table if exists student";
    BOOL isDrop = [self.db executeUpdate:dropTable];
    if (isDrop) {
        NSLog(@"表已经删除");
    }else {
        NSLog(@"表没有删除");
    }
    
    [self.db close];
}
- (void)deleteOneDataWithSQL:(NSString *)sql
{
    if (![self.db open]) {
        self.db = nil;
        return;
    }
    BOOL isDelete = [self.db executeUpdate:sql];
    if (isDelete) {
        NSLog(@"数据已经删除");
    }else
    {
        NSLog(@"数据删除失败");
    }
    [self.db close];
}
#pragma mark - Lazy load
- (FMDatabase *)db
{
    if (!_db) {
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"demo.db"];
        _db = [FMDatabase databaseWithPath:path];
        NSLog(@"%@",path);
    }
    return _db;
}
@end
