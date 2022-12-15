//
//  DeviceVibrativeManage.m
//  Project
//
//  Created by 天丰互联 on 2022/12/9.
//

#import "DeviceVibrativeManage.h"

#import <AudioToolbox/AudioToolbox.h>

void systemAudioCallback() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@implementation DeviceVibrativeManage

+ (void)vibrateWithiVbrateType:(NSInteger)type {
    
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    switch (type) {
        case 1:
        {
            //短震动
            AudioServicesAddSystemSoundCompletion(kSystemSoundID_Vibrate, NULL, NULL, systemAudioCallback, NULL);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.015 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate);
            });
        }
            break;
        case 2:
        {
            //长震动
            AudioServicesAddSystemSoundCompletion(kSystemSoundID_Vibrate, NULL, NULL, systemAudioCallback, NULL);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate);
            });
        }
            break;
            
        default:
            break;
    }
}
@end
