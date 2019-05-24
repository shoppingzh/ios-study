//
//  CustomerCell.m
//  CustomerTableCellDemo
//
//  Created by dascomsoft on 2019/5/15.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "CustomerCell.h"
#import "Masonry.h"
#import "EdgeInsetsLabel.h"

@interface CustomerCell()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIView *categoriesView;

@end


@implementation CustomerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    NSLog(@"Customer Cell初始化");
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupView];
    }
    return self;
}

- (void) setupView{
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:22];
    UIView *sv = self.contentView;
    [sv addSubview:_titleLabel];
    
    _categoriesView = [UIView new];
    [sv addSubview:_categoriesView];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sv.mas_top).with.offset(20);
        make.left.equalTo(sv.mas_left).with.offset(10);
        make.right.equalTo(sv.mas_right).with.offset(10);
        make.height.greaterThanOrEqualTo(@20);
    }];
    
    [_categoriesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
        make.left.equalTo(sv.mas_left).with.offset(10);
        make.right.equalTo(sv.mas_right).with.offset(10);
        make.height.greaterThanOrEqualTo(@1);
    }];
}

- (void)setGoods:(Goods *)goods{
    _titleLabel.text = goods.name;
    NSLog(@"添加分类：%@", goods.categories);
    
    MASViewAttribute *start = self.categoriesView.mas_left;
    for(Category *cat in goods.categories){
        UILabel *lb = [UILabel new];
        
        lb.text = cat.name;
        lb.textColor = [UIColor whiteColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.layer.backgroundColor = [CustomerCell colorWithHex:@"#2196f3"].CGColor;
        lb.layer.cornerRadius = 15;
        
        [self.categoriesView addSubview:lb];
        
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.categoriesView.mas_top);
            make.left.equalTo(start).with.offset(5);
            //make.width.greaterThanOrEqualTo(@120);
            make.height.equalTo(@30);
        }];
        start = lb.mas_right;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (UIColor *)colorWithHex:(NSString *)colorName{
    if(![colorName hasPrefix:@"#"] || ([colorName length] != 4 && [colorName length] != 7)){
        return [UIColor clearColor];
    }
    NSString *hex = [colorName substringFromIndex:1];
    hex = [CustomerCell fixColorHex:hex];
    NSRange range = {0, 2};
    NSString *sr = [hex substringWithRange:range];
    range.location = 2;
    NSString *sg = [hex substringWithRange:range];
    range.location = 4;
    NSString *sb = [hex substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:sr] scanHexInt:&r];
    [[NSScanner scannerWithString:sg] scanHexInt:&g];
    [[NSScanner scannerWithString:sb] scanHexInt:&b];
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

/*
 * 修正十六进制值如f0c修正为ff00cc
 */
+ (NSString*) fixColorHex:(NSString *) hex{
    if([hex length] == 3){
        NSMutableString *tmp = [[NSMutableString alloc] init];
        for(NSInteger i = 0;i<hex.length;i++){
            NSString *c = [NSString stringWithFormat:@"%c", [hex characterAtIndex:i]];
            [tmp appendString:c];
            [tmp appendString:c];
        }
        return tmp;
    }
    
    return hex;
}

@end
