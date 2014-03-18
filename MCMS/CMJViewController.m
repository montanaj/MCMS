//
//  CMJViewController.m
//  MCMS
//
//  Created by Claire Jencks on 3/18/14.
//  Copyright (c) 2014 Claire Jencks. All rights reserved.
//

#import "CMJViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface CMJViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

{
    
    NSMutableArray *creatures;
    
    IBOutlet UITextField *magicalCreatureTextField;
    
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation CMJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	

    MagicalCreature *minotaur = [MagicalCreature new];
    minotaur.name = @"simian";
    
    MagicalCreature *unicorn = [MagicalCreature new];
    unicorn.name = @"charlie";
    
    MagicalCreature *troll = [MagicalCreature new];
    troll.name = @"max";

    
    creatures = [NSMutableArray arrayWithObjects:unicorn, minotaur, troll, nil];


}

- (IBAction)onAddButtonPressed:(id)sender {

    MagicalCreature *newMC = [MagicalCreature new];
    newMC.name = magicalCreatureTextField.text;
    [creatures addObject:newMC];
    [self.myTableView reloadData];
    [magicalCreatureTextField resignFirstResponder];
    magicalCreatureTextField.text = @"";
    
    

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return creatures.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    //creating a new magicalCreature but making it equal to the creature at the same index in the array as the row
    MagicalCreature* magicalCreature = [creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"magicalCreaturesID"];
    cell.textLabel.text = magicalCreature.name;
    return cell;
    
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender

{
    NSIndexPath *indexpath = [self.myTableView indexPathForCell:sender];
    MagicalCreature *selectedMagicalCreature = [creatures objectAtIndex:indexpath.row];
    CreatureViewController *creatureDetails = segue.destinationViewController;
    creatureDetails.creature = selectedMagicalCreature;
}
-(IBAction)unwindDestinationViewController:(UIStoryboardSegue *)segue{
    [self.myTableView reloadData];
}

@end
