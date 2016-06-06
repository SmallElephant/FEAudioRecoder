//
//  TestViewController.m
//  FEAudioRecord
//
//  Created by FlyElephant on 16/5/24.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "TestViewController.h"

@implementation TestViewController

//#pragma mark -
//
//- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
//{
//    if (flag)
//    {
//        NSLog(@"录音成功");
//        //        [[AVAudioSession sharedInstance] setCategory:_oldSessionCategory error:nil];
//        //        [UIApplication sharedApplication].idleTimerDisabled = _wasIdleTimerDisabled;
//    }
//    else
//    {
//        [[NSFileManager defaultManager] removeItemAtPath:[self audioRecordingPath] error:nil];
//    }
//}
//
//#pragma mark - setup
//
//- (NSString *)audioRecordingPath{
//    
//    //    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    //    NSString *cachesDir = [paths objectAtIndex:0];
//    
//    //    NSString *result = nil;
//    //    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    //    NSString *documentsFolde = [folders objectAtIndex:0];
//    //    result = [documentsFolde stringByAppendingPathComponent:@"RecordingFlyElephant.aac"];
//    //    NSLog(@"录音存储地址:%@",result);
//    //    return result;
//    
//    //    NSString *globallyUniqueString = [NSProcessInfo processInfo].globallyUniqueString;
//    
//    
//    //        NSString *tmp=[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"test.mp3"];
//    //        NSLog(@"%@",tmp);
//    //    return tmp;
//    
//    
//    NSString *tmp=[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"FlyElephant.mp3"];
//    NSLog(@"%@",tmp);
//    return tmp;
//    
//    //   NSString  *recordPath=[NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.m4a",@"FlyElephantRecord"]];
//    //    NSLog(@"存储路径:%@",recordPath);
//    //    return recordPath;
//}
//
////在初始化AVAudioRecord实例之前，需要进行基本的录音设置
//- (NSDictionary *)audioRecordingSettings{
//    
//    NSDictionary *result = nil;
//    //
//    //    NSMutableDictionary *settings=[[NSMutableDictionary alloc]init];
//    //
//    //    [settings setValue:[NSNumber numberWithInteger:kAudioFormatAppleLossless]
//    //                forKey:AVFormatIDKey];
//    //
//    //    [settings setValue:[NSNumber numberWithFloat:44100.0f] forKey:AVSampleRateKey];
//    //
//    //    [settings setValue:[NSNumber numberWithInteger:1] forKey:AVNumberOfChannelsKey];
//    //
//    //    [settings setValue:[NSNumber numberWithInteger:AVAudioQualityLow]
//    //                forKey:AVEncoderAudioQualityKey];
//    //
//    //    result = [NSDictionary dictionaryWithDictionary:settings];
//    //
//    //    return (result);
//    
//    
//    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc]init];
//    //设置录音格式  AVFormatIDKey==kAudioFormatLinearPCM
//    //    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
//    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatAppleLossless] forKey:AVFormatIDKey];
//    //设置录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）
//    [recordSetting setValue:[NSNumber numberWithFloat:44100] forKey:AVSampleRateKey];
//    //录音通道数  1 或 2
//    [recordSetting setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
//    //线性采样位数  8、16、24、32
//    [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
//    //录音的质量
//    [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
//    
//    result = [NSDictionary dictionaryWithDictionary:recordSetting];
//    return result;
//}
//
////停止音频的录制
//- (void)stopRecordingOnAudioRecorder:(AVAudioRecorder *)recorder{
//    
//    [recorder stop];
//}
//
//-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
//{
//    NSLog(@"Finsh playing");
//    
//}


-(void)setup{
    
    //    NSString *path = NSHomeDirectory();//主目录
    //    NSLog(@"NSHomeDirectory:%@",path);
    //    NSString *userName = NSUserName();//与上面相同
    //    NSString *rootPath = NSHomeDirectoryForUser(userName);
    //    NSLog(@"NSHomeDirectoryForUser:%@",rootPath);
    //    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //    NSString *documentsDirectory=[paths objectAtIndex:0];//Documents目录
    //    NSLog(@"NSDocumentDirectory:%@",documentsDirectory);
    
    
//    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:[self audioRecordingPath]] settings:[self audioRecordingSettings] error:nil];
//    self.audioRecorder.delegate = self;
//    self.audioRecorder.meteringEnabled = YES;
    
    //
    //    NSError *error = nil;
    //    NSString *filePath= [self audioRecordingPath];
    //
    //    self.recorder= [[AVAudioRecorder alloc]
    //                    initWithURL:[NSURL fileURLWithPath:filePath]
    //                    settings:[self audioRecordingSettings]
    //                    error:&error];
    //
    //    self.recorder.delegate = self;
    //    self.recorder.meteringEnabled = YES;
    
    
    //    if (error != nil) {
    //        NSLog(@"Init audioRecorder error: %@",error);
    //    }else{
    //        //准备就绪，等待录音，注意该方法会返回Boolean，最好做个成功判断，因为其失败的时候无任何错误信息抛出
    //        if ([self.recorder prepareToRecord]) {
    //            NSLog(@"Prepare successful");
    //        }else{
    //            NSLog(@"还没有准备好");
    //        }
    //    }
    
    
    //    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[self audioRecordingPath]] error:&error];
    //    self.audioPlayer.delegate = self;
    //    self.audioPlayer.volume=1.0f;
    //    if (error != nil) {
    //        NSLog(@"Wrong init player:%@", error);
    //    }else{
    //        NSLog(@"播放器初始化成功");
    //    }
    
    //    NSString *tmp=[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"test.mp3"];
    //    NSLog(@"%@",tmp);
    //    NSURL *moveMP3=[NSURL fileURLWithPath:[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"test.mp3"]];
    //    NSError *err=nil;
    //    self.movePlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:moveMP3 error:&err];
    //    self.movePlayer.volume=1.0;
    //    [self.movePlayer prepareToPlay];
    //    if (err!=nil) {
    //        NSLog(@"move player init error:%@",err);
    //    }
    
    
    //    NSString *tmp=[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"test.mp3"];
    //    NSLog(@"%@",tmp);
    //    NSURL *playerUrl=[NSURL fileURLWithPath:[self audioRecordingPath]];
    //    NSError *err=nil;
    //    self.audioPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:playerUrl error:&err];
    //    self.audioPlayer.volume=1.0;
    //    [self.audioPlayer prepareToPlay];
    //    if (err!=nil) {
    //        NSLog(@"move player init error:%@",err);
    //    }
    
}


////一个基于AVAudioRecorder类的录制/停止方法
//-(IBAction) recordOrStop: (id) sender {
//    if (recording) {
//        [soundRecorder stop];
//        recording = NO;
//        self.soundRecorder = nil;  //soundRecorder 在.h里面定义
//        //recordOrStopButton 声明定义
//        [recordOrStopButton setTitle: @"Record" forState: UIControlStateNormal];
//        [recordOrStopButton setTitle: @"Record" forState: UIControlStateHighlighted];
//        [[AVAudioSession sharedInstance] setActive: NO error: nil];
//    } else {
//        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryRecord error: nil];
//        NSDictionary *recordSettings =
//        [[NSDictionary alloc] initWithObjectsAndKeys:
//         [NSNumber numberWithFloat: 44100.0],                 AVSampleRateKey,
//         [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
//         [NSNumber numberWithInt: 1],                         AVNumberOfChannelsKey,
//         [NSNumber numberWithInt: AVAudioQualityMax],         AVEncoderAudioQualityKey,
//         nil];
//        AVAudioRecorder *newRecorder = [[AVAudioRecorder alloc] initWithURL: soundFileURL
//                                                                   settings: recordSettings
//                                                                      error: nil];
//        [recordSettings release];
//        self.soundRecorder = newRecorder;
//        [newRecorder release];
//        
//        soundRecorder.delegate = self;
//        [soundRecorder prepareToRecord];  //创建音频文件 sound.caf
//        [soundRecorder record];
//        [recordOrStopButton setTitle: @"Stop" forState: UIControlStateNormal];
//        [recordOrStopButton setTitle: @"Stop" forState: UIControlStateHighlighted];
//        
//        recording = YES;
//    }
//}


@end
