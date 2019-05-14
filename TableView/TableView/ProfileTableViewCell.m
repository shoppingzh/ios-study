//
//  ProfileTableViewCell.m
//  TableView
//
//  Created by dascomsoft on 2019/2/13.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "ProfileTableViewCell.h"

@implementation ProfileTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UINib *nib = [UINib nibWithNibName:@"ProfileTableViewCell" bundle:[NSBundle mainBundle]];
        NSArray *views = [nib instantiateWithOwner:nil options:nil];
        [self.contentView addSubview:views[0]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
