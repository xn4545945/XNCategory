
#import "XNAudioTool.h"

@implementation XNAudioTool

// 定义字典保存加载好的音效id
// 文件名称作为KEY 音效id作为Value

static NSMutableDictionary *_md;
static NSMutableDictionary *_musicMd;

+ (void)initialize
{
    // 初始化存储音效id的字典
    _md = [NSMutableDictionary dictionary];
    _musicMd = [NSMutableDictionary dictionary];
    
    // 注册音乐的会话类型
    AVAudioSession *session = [[AVAudioSession alloc] init];
    [session setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    [session setActive:YES error:nil];
}

+ (void)playSoundWithName:(NSString *)filename
{
    if (!filename) return;
    
    // 0.从字典从取出加载完毕的soundID
    SystemSoundID soundID;
    soundID = [_md[filename] unsignedLongValue];
    
    if (!soundID) {
        NSLog(@"加载音效id");
        // 1.加载音效id
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        
        if (!url) return;

        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundID);
        
        // 2.存储加载好的soundID
        _md[filename] = @(soundID);
    }

    // 3.播放音效
    // 不建议使用该方法播放音乐文件(长音乐)
    AudioServicesPlaySystemSound(soundID);
    
}

+ (void)disposeSoundID:(NSString *)filename
{
    // 1.从字典中获取音效ID
    SystemSoundID soundID = [_md[filename] unsignedLongValue];
    
    if (soundID) {
        // 销毁音效
        AudioServicesDisposeSystemSoundID(soundID);
        
        // 清空字典
        [_md removeObjectForKey:filename];
        
    }
}

//=====================================上为音效, 下为音乐===============================
/**
 *  播放音乐
 *
 *  @param filename 音乐文件名称
 */
//+ (void)playMusicWithName:(NSString *)filename
+ (AVAudioPlayer *)playMusicWithName:(NSString *)filename;
{
    if (!filename) return nil;
    
    // 0.从字典从取出创建好的播放器
    AVAudioPlayer *audioPlayer = _musicMd[filename];
    
    if (!audioPlayer) {

        // 获取文件url
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        
        if (!url) return nil;
        
        // 1.创建播放器
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        // 2.存储加载好的播放器
        _musicMd[filename] = audioPlayer;

    }
    
    // 3.播放音乐
    if (![audioPlayer isPlaying]) {
        
        [audioPlayer prepareToPlay];
        [audioPlayer play];
    }
    
    return audioPlayer;
}
/**
 *  暂停音乐
 *
 *  @param filename 音乐文件名称
 */
+ (void)pauseMusicWithName:(NSString *)filename
{
    if (!filename) return;
    
    // 0.从字典从取出创建好的播放器
    AVAudioPlayer *audioPlayer = _musicMd[filename];
    
    if ([audioPlayer isPlaying]) {
        [audioPlayer pause];
    }
    
}
/**
 *  停止音乐
 *
 *  @param filename 音乐文件名称
 */
+ (void)stopMusicWithName:(NSString *)filename
{
    if (!filename) return;
    
    // 0.从字典从取出创建好的播放器
    AVAudioPlayer *audioPlayer = _musicMd[filename];
    
    if (audioPlayer) {
        [audioPlayer stop];
        
        // 从字典中移除
        [_musicMd removeObjectForKey:filename];
    }
    
}
@end
