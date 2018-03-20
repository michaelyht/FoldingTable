//
//  Section_RoutWork.h
//  JKHousekeeper
//
//  Created by Michael on 2017/9/11.
//  Copyright © 2017年 Lingday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Section_RoutWork : UIView
@property (weak, nonatomic) IBOutlet UIButton *bntZK;

- (void)updateViewWithData:(NSString *)string;

@end
