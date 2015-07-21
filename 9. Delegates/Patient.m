//
//  Patient.m
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Patient.h"
@implementation Patient
- (instancetype)initWithName:(NSString*)name andCureBlock:(CureBlock)block
{
    self = [super init];
    if (self) {
        self.name=name;
        
        [self performSelector:@selector(go2Doctor:) withObject:block afterDelay:(arc4random_uniform(11)+5)];
    }
    return self;
}

-(void)go2Doctor:(CureBlock)cureBlock {
    //__weak Patient* weakSelf=self;
    //cureBlock(weakSelf);
    //weak isn't necessary, because in block I make weakself
    cureBlock(self);
}

-(void) takePill{
    NSLog(@"patient %@ takes a pill",self.name);
    [self decisionIfHelp];
    
}
-(void) makeShot{
    NSLog(@"patient %@ makes a shot",self.name);
    [self decisionIfHelp];
}
-(void) haveRest{
    NSLog(@"patient %@ should have rest",self.name);
    [self decisionIfHelp];
}
-(void) decisionIfHelp{
    self.isHelped=arc4random_uniform(2);
}
-(void) dealloc {
    NSLog(@"patient dealloc");
}
@end
