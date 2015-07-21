//
//  Patient.h
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BodyPart){
    BodyPartHead,
    BodyPartLeg
};

@interface Patient : NSObject

typedef void (^CureBlock)(Patient* patient);

@property (weak,nonatomic) id x;
@property (assign,nonatomic) CGFloat temp;
@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) BodyPart part;
@property (assign,nonatomic) BOOL isHelped;
@property (copy,nonatomic) void(^propBlock)(Patient*) ;
- (instancetype)initWithName:(NSString*)name andCureBlock:(CureBlock)block;
-(void) takePill;
-(void) makeShot;
-(void) haveRest;
-(void) go2Doctor:(CureBlock)cureBlock;
//-(void) go2DoctorWIthAche;
-(void) decisionIfHelp;
@end

