//
//  CreatureViewController.h
//  MCMS
//
//  Created by Claire Jencks on 3/18/14.
//  Copyright (c) 2014 Claire Jencks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"


@interface CreatureViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property MagicalCreature *creature;

@end
