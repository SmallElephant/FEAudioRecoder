//
//  ViewController.m
//  FEAudioRecord
//
//  Created by FlyElephant on 16/5/23.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "MainViewController.h"

typedef NS_ENUM(NSInteger,FEAudioEncoding){
    FEAudioEncoding_AAC=1,
    FEAudioEncoding_ALAC=2,
    FEAudioEncoding_IMA4=3,
    FEAudioEncoding_ILBC=4,
    FEAudioEncoding_ULAW=5,
    FEAudioEncoding_PCM=6
};


@interface MainViewController ()<AVAudioRecorderDelegate,AVAudioPlayerDelegate>

@property (strong,nonatomic) AVAudioRecorder *audioRecorder;

@property (strong,nonatomic) AVAudioPlayer *audioPlayer;

@property(nonatomic,strong)AVAudioPlayer *movePlayer ;

@property (assign,nonatomic) NSInteger recordEncoding;

@property (strong,nonatomic) NSURL *recordUrl;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor=[UIColor redColor];
//    [self setup];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:[self audioRecordingPath]])
//    {
//        [[NSFileManager defaultManager] removeItemAtPath:[self audioRecordingPath] error:nil];
//    }
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (IBAction)begin:(UIButton *)sender {


    
//    NSMutableDictionary *recordSettings = [[NSMutableDictionary alloc] initWithCapacity:10];
//    if(self.recordEncoding == FEAudioEncoding_PCM)
//    {
//        [recordSettings setObject:[NSNumber numberWithInt: kAudioFormatLinearPCM] forKey: AVFormatIDKey];
//        [recordSettings setObject:[NSNumber numberWithFloat:44100.0] forKey: AVSampleRateKey];
//        [recordSettings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
//        [recordSettings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
//        [recordSettings setObject:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
//        [recordSettings setObject:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
//    }
//    else
//    {
//        NSNumber *formatObject;
//        
//        switch (self.recordEncoding) {
//            case (FEAudioEncoding_AAC):
//                formatObject = [NSNumber numberWithInt: kAudioFormatMPEG4AAC];
//                break;
//            case (FEAudioEncoding_ALAC):
//                formatObject = [NSNumber numberWithInt: kAudioFormatAppleLossless];
//                break;
//            case (FEAudioEncoding_IMA4):
//                formatObject = [NSNumber numberWithInt: kAudioFormatAppleIMA4];
//                break;
//            case (FEAudioEncoding_ILBC):
//                formatObject = [NSNumber numberWithInt: kAudioFormatiLBC];
//                break;
//            case (FEAudioEncoding_ULAW):
//                formatObject = [NSNumber numberWithInt: kAudioFormatULaw];
//                break;
//            default:
//                formatObject = [NSNumber numberWithInt: kAudioFormatAppleIMA4];
//        }
//        
//        [recordSettings setObject:formatObject forKey: AVFormatIDKey];
//        [recordSettings setObject:[NSNumber numberWithFloat:44100.0] forKey: AVSampleRateKey];
//        [recordSettings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
//        [recordSettings setObject:[NSNumber numberWithInt:12800] forKey:AVEncoderBitRateKey];
//        [recordSettings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
//        [recordSettings setObject:[NSNumber numberWithInt: AVAudioQualityHigh] forKey: AVEncoderAudioQualityKey];
//    }
    
    NSLog(@"FlyElephant-startRecording");;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryRecord error:nil];
    
    NSError *error = nil;
    self.audioRecorder = [[ AVAudioRecorder alloc] initWithURL:self.recordUrl settings:[self audioRecordingSettings] error:&error];
    self.audioRecorder.meteringEnabled = YES;
    if ([self.audioRecorder prepareToRecord] == YES){
        self.audioRecorder.meteringEnabled = YES;
        [self.audioRecorder record];
    }else {
        NSLog(@"FlyElephant--初始化录音失败");
    }
    
}

- (IBAction)stop:(UIButton *)sender {
    NSLog(@"stopRecording");
    // kSeconds = 0.0;
    [self.audioRecorder stop];
    NSLog(@"stopped");
}

- (IBAction)play:(UIButton *)sender {
    NSLog(@"FlyElephant-playRecording");
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recordUrl error:&error];
    self.audioPlayer.numberOfLoops = 0;
    [self.audioPlayer play];
    NSLog(@"FlyElephant-playing");
}

#pragma mark - setup

-(void)setup{
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(
                                                            NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir
                               stringByAppendingPathComponent:@"recordTest.caf"];
    
    NSURL *url = [NSURL fileURLWithPath:soundFilePath];
    self.recordUrl=url;
    self.recordEncoding=0;
}

- (NSDictionary *)audioRecordingSettings{

    NSDictionary *result = nil;

    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc]init];
    //设置录音格式  AVFormatIDKey==kAudioFormatLinearPCM
    //    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatAppleLossless] forKey:AVFormatIDKey];
    //设置录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）
    [recordSetting setValue:[NSNumber numberWithFloat:44100] forKey:AVSampleRateKey];
    //录音通道数  1 或 2
    [recordSetting setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
    //线性采样位数  8、16、24、32
    [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //录音的质量
    [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];

    result = [NSDictionary dictionaryWithDictionary:recordSetting];
    return result;
}



@end
