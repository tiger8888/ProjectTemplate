//
//  MyCell.h
//  TableViewTemplate
//
//  Created by MYL-SOFTWARE on 14-11-20.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;
@interface MyCell : UITableViewCell

@property (nonatomic, strong)Model *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
