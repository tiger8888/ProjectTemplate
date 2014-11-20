//
//  MyCell.m
//  TableViewTemplate
//
//  Created by MYL-SOFTWARE on 14-11-20.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "MyCell.h"
#import "Model.h"
#import "UIViewExt.h"

@interface MyCell ()

@property (nonatomic, weak) UILabel *nameView;
@property (nonatomic, weak) UILabel *codeView;

// 设置位置
- (void)setCellFrame;
    
// 设置数据
- (void)setCellData;

@end
@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 初始化需要显示的控件
        [self initSubViews];
        
    }
    return self;
}

- (void)setCellFrame{
    // 设置位置
    
}
- (void)setCellData{
    // 设置数据
    self.nameView.text = self.model.name;
    self.codeView.text = self.model.code;
}

- (void)initSubViews{
    // 初始化视图
    CGFloat margin      = 10;
    CGFloat width       = self.width * 0.5 - margin;
    
    UILabel *nameView   = [[UILabel alloc] init];
    nameView.frame      = CGRectMake(margin, 0, width, 40);
    nameView.textColor  = [UIColor orangeColor];
    self.nameView       = nameView;
    [self.contentView addSubview:nameView];
    
    UILabel *codeView   = [[UILabel alloc] init];
    codeView.frame      = CGRectMake(width + margin, 0, width, 40);
    codeView.textColor  = [UIColor greenColor];
    self.codeView       = codeView;
    [self.contentView addSubview:codeView];
}

- (void)setModel:(Model *)model{
    // 设置
    _model = model;
    
    [self setCellFrame];
    
    [self setCellData];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"myCell";
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
