//
//  JOViewController.h
//  JoJoJoTravels
//
//  Created by Johan Nenzén on 4/15/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JOViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic,strong) IBOutlet UIImage *towelImage;

@property (nonatomic, strong) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) IBOutlet UIButton *currentButton;
@property (nonatomic, strong) IBOutlet UILabel *resmalLabel;

- (IBAction)PressedResmal:(id)sender;
@end
