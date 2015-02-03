//
//  ViewController.m
//  GitReference
//
//  Created by Julien Guanzon on 2/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"

static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";
static CGFloat labelHeight = 30;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat topMargin = 20;
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    CGFloat top = topMargin +labelHeight + margin * 2;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
    [self.view addSubview:scrollView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, topMargin, widthMinusMargin, 30)];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.textColor = [UIColor blueColor];
    title.text = ([NSString stringWithFormat:@"GitReference"]);
    [scrollView addSubview:title];
    
    top += (labelHeight + topMargin);
    
    for (NSDictionary *gitCommand in [self gitCommands]) {
        
        NSString *command = gitCommand[Command];
        NSString *reference = gitCommand[Reference];
        
        
        UILabel *gitCommand = [[UILabel alloc] initWithFrame:CGRectMake(20, top, self.view.bounds.size.width, labelHeight)];
        gitCommand.textColor = [UIColor blueColor];
        gitCommand.text = command;
        [scrollView addSubview:gitCommand];
        
        top += (labelHeight + topMargin);
        
        UILabel *gitReference = [[UILabel alloc] initWithFrame:CGRectMake(margin, top-20, widthMinusMargin, labelHeight)];
        gitReference.textColor = [UIColor orangeColor];
        gitReference.text = reference;
        [scrollView addSubview: gitReference];
        
        
        
    }
    
}

- (NSArray *)gitCommands {
        
    return @[@{Command: @"git status", Reference: @": shows changed files"},
                @{Command: @"git diff", Reference: @": shows actual changes"},
                @{Command: @"git add .", Reference: @": adds changed files to the commit"},
                @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
                @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
                @{Command: @"git log", Reference: @": displays progress log"},
                @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
                ];
        
}
    
- (CGFloat)heightOfReferenceString:(NSString *)reference {
        
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                                  context:nil];
        
    return bounding.size.height;
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
