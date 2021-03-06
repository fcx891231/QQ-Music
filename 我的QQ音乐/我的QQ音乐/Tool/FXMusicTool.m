//
//  FXMusicTool.m
//  QQMusic
//
//  Created by xiaomage on 15/8/15.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "FXMusicTool.h"
#import "FXMusic.h"
#import "MJExtension.h"

@implementation FXMusicTool

static NSArray *_musics;
static FXMusic *_playingMusic;

+ (void)initialize
{
    if (_musics == nil) {
        _musics = [FXMusic objectArrayWithFilename:@"Musics.plist"];
    }
    
    if (_playingMusic == nil) {
        _playingMusic = _musics[1];
    }
}

+ (NSArray *)musics
{
    return _musics;
}

+ (FXMusic *)playingMusic
{
    return _playingMusic;
}

+ (void)setPlayingMusic:(FXMusic *)playingMusic
{
    _playingMusic = playingMusic;
}

+ (FXMusic *)nextMusic
{
    // 1.拿到当前播放歌词下标值
    NSInteger currentIndex = [_musics indexOfObject:_playingMusic];
    
    // 2.取出下一首
    NSInteger nextIndex = ++currentIndex;
    if (nextIndex >= _musics.count) {
        nextIndex = 0;
    }
    FXMusic *nextMusic = _musics[nextIndex];
    
    return nextMusic;
}

+ (FXMusic *)previousMusic
{
    // 1.拿到当前播放歌词下标值
    NSInteger currentIndex = [_musics indexOfObject:_playingMusic];
    
    // 2.取出下一首
    NSInteger previousIndex = --currentIndex;
    if (previousIndex < 0) {
        previousIndex = _musics.count - 1;
    }
    FXMusic *previousMusic = _musics[previousIndex];
    
    return previousMusic;
}

@end
