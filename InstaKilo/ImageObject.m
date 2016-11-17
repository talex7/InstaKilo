//
//  ImageObject.m
//  InstaKilo
//
//  Created by Thomas Alexanian on 2016-11-16.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import "ImageObject.h"

@implementation ImageObject

- (instancetype)initWithName:(NSString *)name andLocation:(NSString *)location andSubject:(NSString *)subject {
    self = [super init];
    if (self) {
        _image = [UIImage imageNamed:name];
        _location = location;
        _subject = subject;
    }
    return self;
}

@end
