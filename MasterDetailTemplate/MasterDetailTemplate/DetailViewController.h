//
//  DetailViewController.h
//  MasterDetailTemplate
//
//  Created by MYL-SOFTWARE on 14-11-26.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

