
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface XNAudioTool : NSObject

/**
 *  根据音效文件名称播放音效
 *
 *  @param filename 音效文件名称
 */
+ (void)playSoundWithName:(NSString *)filename;

/**
 *  根据音效文件名称销毁音效
 *
 *  @param filename 音效文件名称
 */
+ (void)disposeSoundID:(NSString *)filename;

/**
 *  播放音乐
 *
 *  @param filename 音乐文件名称
 */
//+ (void)playMusicWithName:(NSString *)filename;
+ (AVAudioPlayer *)playMusicWithName:(NSString *)filename;
/**
 *  暂停音乐
 *
 *  @param filename 音乐文件名称
 */
+ (void)pauseMusicWithName:(NSString *)filename;
/**
 *  停止音乐
 *
 *  @param filename 音乐文件名称
 */
+ (void)stopMusicWithName:(NSString *)filename;

@end
