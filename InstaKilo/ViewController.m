//
//  ViewController.m
//  InstaKilo
//
//  Created by Thomas Alexanian on 2016-11-16.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "ImageObject.h"
#import "HeaderCollectionReusableView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISwitch *sortSwitch;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createImageObjects];
    self.subjectSectionArray = @[@"Breakfast Dishes", @"Chicken Dishes", @"Pasta Dishes", @"Soups", @"Steak Dishes"];
    self.locationSectionArray = @[@"My Apartment", @"Restaurant", @"Parents' Condo", @"Work"];
    self.isSectionSubject = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (self.isSectionSubject) {
        ImageObject *tempObj = [self sortArrayBySubject][indexPath.section][indexPath.row];
        
        cell.cellImageView.image = tempObj.image;
    } else {
        ImageObject *tempObj = [self sortArrayByLocation][indexPath.section][indexPath.row];
        
        cell.cellImageView.image = tempObj.image;
        
    }
   
    
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.isSectionSubject) {
        return [self sortArrayBySubject].count;
        
    } else {
        return [self sortArrayByLocation].count;
        
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray<NSArray*>* tempArray;
    if (self.isSectionSubject) {
        tempArray = [self sortArrayBySubject];
        
    } else {
        tempArray = [self sortArrayByLocation];
    
    }
    return tempArray[section].count;
}

-(void)createImageObjects {
    ImageObject *food1 = [[ImageObject alloc] initWithName:@"food01.jpg"
                                               andLocation:@"Restaurant"
                                                andSubject:@"Breakfast Dishes"];
    ImageObject *food2 = [[ImageObject alloc] initWithName:@"food02.jpg"
                                               andLocation:@"Restaurant"
                                                andSubject:@"Breakfast Dishes"];
    ImageObject *food3 = [[ImageObject alloc] initWithName:@"food03.jpg"
                                               andLocation:@"My Apartment"
                                                andSubject:@"Breakfast Dishes"];
    ImageObject *food4 = [[ImageObject alloc] initWithName:@"food04.jpg"
                                               andLocation:@"Parents' Condo"
                                                andSubject:@"Chicken Dishes"];
    ImageObject *food5 = [[ImageObject alloc] initWithName:@"food05.jpg"
                                               andLocation:@"Work"
                                                andSubject:@"Chicken Dishes"];
    ImageObject *food6 = [[ImageObject alloc] initWithName:@"food06.jpg"
                                               andLocation:@"Parents' Condo"
                                                andSubject:@"Chicken Dishes"];
    ImageObject *food7 = [[ImageObject alloc] initWithName:@"food07.jpg"
                                               andLocation:@"My Apartment"
                                                andSubject:@"Pasta Dishes"];
    ImageObject *food8 = [[ImageObject alloc] initWithName:@"food08.jpg"
                                               andLocation:@"Parents' Condo"
                                                andSubject:@"Pasta Dishes"];
    ImageObject *food9 = [[ImageObject alloc] initWithName:@"food09.jpg"
                                               andLocation:@"My Apartment"
                                                andSubject:@"Pasta Dishes"];
    ImageObject *food10 = [[ImageObject alloc] initWithName:@"food10.jpg"
                                                andLocation:@"My Apartment"
                                                 andSubject:@"Soups"];
    ImageObject *food11 = [[ImageObject alloc] initWithName:@"food11.jpg"
                                                andLocation:@"Restaurant"
                                                 andSubject:@"Soups"];
    ImageObject *food12 = [[ImageObject alloc] initWithName:@"food12.jpg"
                                                andLocation:@"Restaurant"
                                                 andSubject:@"Soups"];
    ImageObject *food13 = [[ImageObject alloc] initWithName:@"food13.jpg"
                                                andLocation:@"My Apartment"
                                                 andSubject:@"Steak Dishes"];
    ImageObject *food14 = [[ImageObject alloc] initWithName:@"food14.jpg"
                                                andLocation:@"My Apartment"
                                                 andSubject:@"Steak Dishes"];
    ImageObject *food15 = [[ImageObject alloc] initWithName:@"food15.jpg"
                                                andLocation:@"Work"
                                                 andSubject:@"Steak Dishes"];
    
//    NSMutableArray *allFoodItems = [[NSMutableArray alloc] initWithObjects:food1, food2, food3, food4, food5, food6, food7, food8, food9, food10, food11, food12, food13, food14, food15, nil];
//    
//    self.foodImages = allFoodItems;
//    
//    NSMutableArray *breakfastItems = [[NSMutableArray alloc] initWithObjects: food1, food2, food3, nil];
//    NSMutableArray *chickenItems = [[NSMutableArray alloc] initWithObjects: food4, food5, food6, nil];
//    NSMutableArray *pastaItems = [[NSMutableArray alloc] initWithObjects: food7, food8, food9, nil];
//    NSMutableArray *soupItems = [[NSMutableArray alloc] initWithObjects: food10, food11, food12, nil];
//    NSMutableArray *steakItems = [[NSMutableArray alloc] initWithObjects: food13, food14, food15, nil];
//    
//    NSMutableArray *foodTypes = [[NSMutableArray alloc] initWithObjects:breakfastItems, chickenItems, pastaItems, soupItems, steakItems, nil];
    
    self.foodImages = [[NSMutableArray alloc] initWithObjects:food1, food2, food3, food4, food5, food6, food7, food8, food9, food10, food11, food12, food13, food14, food15, nil];
    
}

-(NSArray<NSArray<ImageObject*>*>*)sortArrayBySubject {
    NSInteger x = self.subjectSectionArray.count;
    NSMutableArray *tempArray = [NSMutableArray new];
    while (x > 0) {
        [tempArray addObject:[NSMutableArray new]];
        x--;
    }
    
    //    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithObjects:[NSMutableArray new], [NSMutableArray new], [NSMutableArray new], nil];
    
    for (ImageObject* foodItem in self.foodImages) {
        if ([foodItem.subject isEqualToString:@"Breakfast Dishes"]) {
            [tempArray[0] addObject:foodItem];
        } else if ([foodItem.subject isEqualToString:@"Chicken Dishes"]) {
            [tempArray[1] addObject:foodItem];
        } else if ([foodItem.subject isEqualToString:@"Pasta Dishes"]) {
            [tempArray[2] addObject:foodItem];
        } else if ([foodItem.subject isEqualToString:@"Soups"]) {
            [tempArray[3] addObject:foodItem];
        } else if ([foodItem.subject isEqualToString:@"Steak Dishes"]) {
            [tempArray[4] addObject:foodItem];
        }
    }
    return tempArray;
}

-(NSArray<NSArray<ImageObject*>*>*)sortArrayByLocation {
    NSInteger x = self.locationSectionArray.count;
    NSMutableArray *tempArray = [NSMutableArray new];
    while (x > 0) {
        [tempArray addObject:[NSMutableArray new]];
        x--;
    }
    
    //    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithObjects:[NSMutableArray new], [NSMutableArray new], [NSMutableArray new], nil];
    
    for (ImageObject* foodItem in self.foodImages) {
        if ([foodItem.location isEqualToString:@"My Apartment"]) {
            [tempArray[0] addObject:foodItem];
        } else if ([foodItem.location isEqualToString:@"Restaurant"]) {
            [tempArray[1] addObject:foodItem];
        } else if ([foodItem.location isEqualToString:@"Parents' Condo"]) {
            [tempArray[2] addObject:foodItem];
        } else if ([foodItem.location isEqualToString:@"Work"]) {
            [tempArray[3] addObject:foodItem];
        }
    }
    return tempArray;
}

//Two totally unnecessary methods but I didn't want to hard code EVERYTHING

//-(NSInteger)getSubjectCount:(NSArray*)array {
//    NSMutableSet *tempSet = [NSMutableSet new];
//    for (ImageObject* foodItem in array) {
//        [tempSet addObject:foodItem.subject];
//    }
//    return tempSet.count;
//}
//
//-(NSInteger)getLocationCount:(NSArray*)array {
//    NSMutableSet *tempSet = [NSMutableSet new];
//    for (ImageObject* foodItem in array) {
//        [tempSet addObject:foodItem.location];
//    }
//    return tempSet.count;
//}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderCollectionReusableView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderCell" forIndexPath:indexPath];
//    cell.label = self.locationSectionArray[indexPath.section];
    
    if (self.isSectionSubject) {
        cell.label.text = [self sortArrayBySubject][indexPath.section][indexPath.row].subject;
        
    } else {
        cell.label.text = [self sortArrayByLocation][indexPath.section][indexPath.row].location;
        
    }
    return cell;
    
    
    
}
- (IBAction)switchToggled:(id)sender {
    self.isSectionSubject = !self.isSectionSubject;
    [self.collectionView reloadData];
}


@end
