//
//  SkillListVC.m
//  Skillz
//
//  Created by Fstech042 on 05/08/15.
//  Copyright (c) 2015 Fstech. All rights reserved.
//


#import "DropDownMenu.h"
#import "LocalizeHelper.h"

@interface DropDownMenu ()

{
    IBOutlet UITableView *dropDownTable;
    
    NSMutableArray *myList;
}

@end

@implementation DropDownMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
        LocalizationSetLanguage(@"ar");
       
        
    }
    else{
        LocalizationSetLanguage(@"en");
       

    }
    
    
    myList = [[NSMutableArray alloc]initWithObjects:LocalizedString(@"print"),LocalizedString(@"NDmode_off"),LocalizedString(@"full_screen_off"),LocalizedString(@"hit_off"),LocalizedString(@"hit_on"),LocalizedString(@"video_off"),LocalizedString(@"Topic_off"),LocalizedString(@"Statement_off"),LocalizedString(@"translations_off"),LocalizedString(@"formatting_off"),LocalizedString(@"diacritics_off"),LocalizedString(@"signature_off"),LocalizedString(@"zoon_in"),LocalizedString(@"zoon_out"),LocalizedString(@"zoon_RESET"), nil];
    
        //[myList replaceObjectAtIndex:0 withObject:@"Twitter"];
   // [myList replaceObjectAtIndex:1 withObject:@"kkkk"];
    
    //[myList objectAtIndex:0];
    
   // NSLog([myList objectAtIndex:0]);
    
    int i;
    for (i = 0; i < [myList count]; i++) {
      //id myArrayElement = [myList objectAtIndex:i];
     
        


        if(i==1){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_1"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"NDmode_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"NDmode_on")];
                
            }
            
        }
        //************
        
       
        
        
        if(i==2){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_2"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"full_screen_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"full_screen_on")];
                
            }
            
        }
        
        
        if(i==5){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_5"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"video_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"video_on")];
                
            }
            
        }
        
        
        
        
        if(i==6){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_6"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"Topic_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"Topic_on")];
                
            }
            
        }
        
        if(i==7){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_7"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"Statement_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"Statement_on")];
                
            }
            
        }
        
        if(i==8){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_8"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"translations_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"translations_on")];
                
            }
            
        }
        
        if(i==9){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_9"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"formatting_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"formatting_on")];
                
            }
            
            
        }
        
        
        if(i==10){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_10"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"diacritics_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"diacritics_on")];
                
            }
            
            
        }
        
        
        if(i==11){
           
           // [myList replaceObjectAtIndex:i withObject:@"kkkk"];
            
            NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"cell_tag_11"];
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
               [myList replaceObjectAtIndex:i withObject:LocalizedString(@"signature_off")];
            }
            else{

                [myList replaceObjectAtIndex:i withObject:LocalizedString(@"signature_on")];
                
            }
            
            
        }
        

    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    
   
    
    
    
    cell.textLabel.text = [myList objectAtIndex:indexPath.row];
    
    
    //cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
        stringForKey:@"cell_tag_1"];
    
    if([cell_tag isEqual:@"on"]){
        
        cell.backgroundColor = [UIColor colorWithRed: 0.19 green: 0.14 blue: 0.26 alpha: 1.00];
        cell.textLabel.textColor = [UIColor whiteColor];
        
    }
  
    NSLog([LocalizeHelper readUserDefaults:@"lang"]);
   
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
        LocalizationSetLanguage(@"ar");
        cell.textLabel.textAlignment = NSTextAlignmentRight;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0];
        cell.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        
    }
    else{
        LocalizationSetLanguage(@"en");
        cell.textLabel.font = [UIFont systemFontOfSize:11.0];

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[myList objectAtIndex:indexPath.row] forKey:@"item"];
    
    
  
    
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.tag = indexPath.row;
    
    //cell.textLabel.text = [myList objectAtIndex:0];
    
    NSDictionary *cool = @{@"cell": cell};

    
    
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSNotificationCenter defaultCenter]
         postNotificationName:@"selectedListItem"
         object:self userInfo:cool];
   
    
    
    
   // [self.view removeFromSuperview];
}






@end
