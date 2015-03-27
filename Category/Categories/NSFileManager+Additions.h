//
//  NSFileManager+Additions.h
//  Orimuse
//
//  Created by Bingjie on 15/3/16.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

/*
 
 1.Documents：
 苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录
 
 2.Library：
 存储程序的默认设置或其它状态信息；
 
 3.Library/Caches：
 存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除
 
 4.tmp:
 提供一个即时创建临时文件的地方。尽管 iCloud 不会备份这些文件，但在应用在使用完这些数据之后要注意随时删除，避免占用用户设备的空间
 
 
 iTunes在与iPhone同步时，备份所有的Documents和Library文件。
 
 iPhone在重启时，会丢弃所有的tmp文件。
 
*/

#import <Foundation/Foundation.h>

@interface NSFileManager (Additions)

//获取Document目录
+ (NSString *)getDocumentPath;

//获取Library目录
+ (NSString *)getLibraryPath;

//获取Support目录
+ (NSString*)getSupportDirectory;

//获取Cache目录
+ (NSString *)getCachePath;

//获取tmp目录
+ (NSString *)getTmpPath;

//获取工程中得文件路径
+ (NSString *)getResourceFilePath:(NSString *)filename type:(NSString*)ext;


+ (NSArray*)getAllFilesInPath:(NSString*)path;

/*
 Detect whether exist a file or a directory
 */
+ (BOOL)fileExist:(NSString *)filepath;

+ (BOOL)dirExist:(NSString*)dirpath;

/*
 Create a File or a Director
 */
+ (BOOL)createFileAtPath:(NSString*)parentPath name:(NSString*)FileName;

+ (BOOL)createDirectoryAtPath:(NSString*)parentPath name:(NSString*)dirName;

/*
 delete Directory or File
 */
+ (BOOL)deleteFile:(NSString *)filepath;

@end
