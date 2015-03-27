//
//  NSFileManager+Additions.m
//  Orimuse
//
//  Created by Bingjie on 15/3/16.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "NSFileManager+Additions.h"

@implementation NSFileManager (Additions)

//获取Document目录
+ (NSString *)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0 ? [paths objectAtIndex:0] : @"undefined");
}
//获取Library目录
+ (NSString *)getLibraryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0 ? [paths objectAtIndex:0] : @"undefined");
}

+ (NSString*)getSupportDirectory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *supportUrl = [fileManager URLForDirectory:NSApplicationSupportDirectory
                                            inDomain:NSUserDomainMask
                                   appropriateForURL:nil
                                              create:YES
                                               error:NULL];
    
    return [supportUrl path];
}

//获取Cache目录
+ (NSString *)getCachePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0 ? [paths objectAtIndex:0] : @"undefined");
}
//获取tmp目录
+ (NSString *)getTmpPath
{
    return NSTemporaryDirectory();
}

+ (NSArray*)getAllFilesInPath:(NSString*)path
{
    NSError *error = nil;
    NSArray *fileList = [[NSArray alloc] init];
    //fileList便是包含有该文件夹下所有文件的文件名及文件夹名的数组
    fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (error || fileList.count==0) {
        return nil;
    }
    return fileList;
}

+ (NSString *)getResourceFilePath:(NSString *)filename type:(NSString*)ext
{
    return [[NSBundle mainBundle] pathForResource:filename ofType:ext];
}

+ (BOOL)fileExist:(NSString *)filepath {
    return [[NSFileManager defaultManager] fileExistsAtPath:filepath];
}

+ (BOOL)dirExist:(NSString*)dirpath{
    BOOL isDir= NO;
    [[NSFileManager defaultManager] fileExistsAtPath:dirpath isDirectory:&isDir];
    return isDir;
}

+ (BOOL)deleteFile:(NSString *)filepath {
    return [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
}

//创建一个文件
+ (BOOL)createFileAtPath:(NSString*)parentPath name:(NSString*)FileName
{
    
    NSString* dir = [parentPath stringByAppendingPathComponent:FileName];
    if ([[self class] fileExist:dir]) {
        return YES;
    }
    return [[NSFileManager defaultManager]createFileAtPath:dir contents:nil attributes:nil];
}

//创建一个目录
+ (BOOL)createDirectoryAtPath:(NSString*)parentPath name:(NSString*)dirName
{
    NSString* dir = [parentPath stringByAppendingPathComponent:dirName];
    if ([[self class] dirExist:dir]) {
        return YES;
    }
    NSError* error;
    return [[NSFileManager defaultManager]createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&error];
}

@end
