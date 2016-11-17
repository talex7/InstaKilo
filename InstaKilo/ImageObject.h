//
//  ImageObject.h
//  InstaKilo
//
//  Created by Thomas Alexanian on 2016-11-16.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageObject : NSObject

@property (nonatomic) NSString *location;
@property (nonatomic) NSString *subject;
@property (nonatomic) UIImage *image;


- (instancetype)initWithName:(NSString *)name andLocation:(NSString *)location andSubject:(NSString *)subject;


@end
