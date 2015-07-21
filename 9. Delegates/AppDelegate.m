//
//  AppDelegate.m
//  9. Delegates
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
@interface AppDelegate ()
@property (strong,nonatomic) NSArray* arrayOfPations;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Superman
    
    CureBlock cureBlockForPatient=^(Patient* patient){
        __weak Patient* weakObj=patient;
        if (weakObj.temp>=37.f && weakObj.temp<=39.f) {
            [weakObj takePill];
        } else if (patient.temp>40){
            [weakObj makeShot];
        } else {
            [weakObj haveRest];
        }
    };

    
    Patient* patient1=[[Patient alloc] initWithName:@"Ivan" andCureBlock:cureBlockForPatient];
    patient1.temp=41.f;

    patient1.part=BodyPartHead;
    Patient* patient2=[[Patient alloc] initWithName:@"Petr" andCureBlock:cureBlockForPatient];
    patient2.temp=37.f;

    patient2.part=BodyPartHead;
    Patient* patient3=[[Patient alloc] initWithName:@"Maria" andCureBlock:cureBlockForPatient];
    patient3.temp=35.f;

    patient3.part=BodyPartLeg;
    
    self.arrayOfPations=[NSArray arrayWithObjects:patient1, patient2, patient3, nil];

    
    //----------
    //end of Superman
        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
