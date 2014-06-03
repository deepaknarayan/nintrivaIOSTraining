//
//  EMAppDelegate.h
//  NinTraining000
//
//  Created by Deepak Velekkat on 03/06/14.
//  Copyright (c) 2014 Deepak Velekkat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
