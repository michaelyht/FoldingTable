//
//  Section_RoutWork.m
//  JKHousekeeper
//
//  Created by Michael on 2017/9/11.
//  Copyright © 2017年 Lingday. All rights reserved.
//

#import "Section_RoutWork.h"

@interface Section_RoutWork(){
    
    __weak IBOutlet UILabel *_lblTime;

}

@end

#define STATE_IMAGE_NAME_NORMAL    @"jiantou_right"
#define STATE_IMAGE_NAME_SELECT    @"jiantou_down"

@implementation Section_RoutWork


- (void)awakeFromNib{
    [super awakeFromNib];

}

///**
// *  KVO function， 只要object的keyPath属性发生变化，就会调用此函数
// */
//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object
//                        change:(NSDictionary *)change
//                       context:(void *)context{
//    DLog(@"%@",_bntZK.titleLabel.text);
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.000000001f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSString *imageName = @"";
//        if ([_bntZK.titleLabel.text isEqualToString:@"展开"]) {
//            imageName = STATE_IMAGE_NAME_NORMAL;
//        }else{
//            imageName = STATE_IMAGE_NAME_SELECT;
//        }
//         UIImage *imgArrow = [UIImage imageNamed:imageName];
//        [_bntZK setTitleEdgeInsets:UIEdgeInsetsMake(0, imgArrow.size.width, 0, -imgArrow.size.width)];
//    });
//}

#pragma mark - instance methods

- (void)updateViewWithData:(NSString *)string{
    [_lblTime setText:string];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
