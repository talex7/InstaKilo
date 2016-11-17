//
//  ViewController.h
//  InstaKilo
//
//  Created by Thomas Alexanian on 2016-11-16.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageObject;

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) NSMutableArray<ImageObject*> *foodImages;
@property (nonatomic) NSArray<NSString*> *locationSectionArray;
@property (nonatomic) NSArray<NSString*> *subjectSectionArray;
@property (nonatomic) BOOL isSectionSubject;


@end

