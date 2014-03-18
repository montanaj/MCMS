//
//  CreatureViewController.m
//  MCMS
//
//  Created by Claire Jencks on 3/18/14.
//  Copyright (c) 2014 Claire Jencks. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
{
    BOOL isEditModeEnabled;
    IBOutlet UIButton *saveButtonToggle;
}

@property (strong, nonatomic) IBOutlet UILabel *creatureNameLabel;

@end

@implementation CreatureViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.creatureNameLabel.text = self.creature.name;
    
    saveButtonToggle.alpha = 0;
    saveButtonToggle.enabled = NO;
    self.nameTextField.alpha = 0;
    
    
}

- (IBAction)onEditButtonPressed:(id)sender {
    self.nameTextField.text = self.creature.name;
    isEditModeEnabled =! isEditModeEnabled;
    if (isEditModeEnabled == YES) {
        self.creatureNameLabel.alpha = 0;
        self.nameTextField.alpha = 1;
        saveButtonToggle.alpha = 1;
        saveButtonToggle.enabled = YES;
    }
    else{
        self.creatureNameLabel.alpha = 1;
        self.nameTextField.alpha = 0;
        saveButtonToggle.alpha = 0;
        saveButtonToggle.enabled = NO;
    }
    [sender setTitle:@"Done" forState:(isEditModeEnabled == NO)];
    [sender setTitle:@"Edit" forState:(isEditModeEnabled == YES)];

    
    
    
}

- (IBAction)onSaveButtonPressed:(id)sender {
    
    self.creature.name = self.nameTextField.text;
    //self.creatureNameLabel.text = self.nameTextField.text;
//    [self.nameTextField resignFirstResponder];
//    NSLog(@"%@", self.creature.name);
//    isEditModeEnabled =! isEditModeEnabled;
//    if (isEditModeEnabled == YES) {
//        self.creatureNameLabel.alpha = 0;
//        self.nameTextField.alpha = 1;
//        saveButtonToggle.alpha = 1;
//        saveButtonToggle.enabled = YES;
//    }
//    else{
//        self.creatureNameLabel.alpha = 1;
//        self.nameTextField.alpha = 0;
//        saveButtonToggle.alpha = 0;
//        saveButtonToggle.enabled = NO;
//    }
//    [sender setTitle:@"Done" forState:(isEditModeEnabled == NO)];
//    [sender setTitle:@"Edit" forState:(isEditModeEnabled == YES)];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
