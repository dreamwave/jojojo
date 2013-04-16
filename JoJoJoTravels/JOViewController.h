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
@property (nonatomic, strong) IBOutlet UIView *pickerView;
@property (nonatomic, strong) IBOutlet UIButton *currentButton;
@property (nonatomic, strong) IBOutlet UILabel *resmalLabel;
@property (nonatomic, retain) NSArray *pickerViewArray;

- (IBAction)PressedResmal:(id)sender;
- (IBAction)didPressOkButtomn: (id)sender;
@end
