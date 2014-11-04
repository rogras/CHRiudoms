//
//  AppDelegate.m
//  CHRiudoms
//
//  Created by Roger Gras on 4/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "AppDelegate.h"

#import <Parse/Parse.h>
#import "ParseUtilities.h"
#import <PFFacebookUtils.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Parse setApplicationId:APPLICATION_ID clientKey:CLIENT_KEY];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [PFTwitterUtils initializeWithConsumerKey:@"zxf17fXfcKilTRty9UC8BzMIQ"
                               consumerSecret:@"31dBio77XMCx9LzuFNEU99MBXG4hlRg6LJMJ2FnXh2XR3sAzlq"];
    
    [PFFacebookUtils initializeFacebook];
    
    /*
    PFObject *miPersona = [PFObject objectWithClassName:@"Persona"];
    [miPersona setObject:@"Miguel" forKey:@"nickname"];
    
    // Versión asíncrona
    [miPersona saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // La persona se ha grabado correctamente.
        } else {
            // Se ha producido un error al guardar la información de la Persona.
        }
    }];
    
    PFObject *miNota = [PFObject objectWithClassName:@"PersonPush"];
    [miNota setObject:@"dfdsfdsfdsfdskljhfvlkjdshgklfds" forKey:@"deviceToken"];
    // Paso como parámetro el objeto persona generado anteriormente.
    [miNota setObject:miPersona forKey:@"person"];
    [miNota save];
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Persona"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // La búsqueda se ha ejecutado correctamente y el NSArray objects
            // contiene los resultados de la misma.
        } else {
            // Se ha producido un error al ejecutar la búsqueda.
        }
    }];
    
    PFUser *miUsuario = [PFUser user];
    miUsuario.username = @"rogras";
    miUsuario.password = @"Scotland3!";
    miUsuario.email = @"yo2@me.com";
    
    [miUsuario signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // El alta de usuario se ha realizado correctamente.
        } else {
            // Se ha producido un error en el alta de usuario.
        }
    }];
    */
    
    [PFUser logOut];
    
    PFUser *miUsuario = [PFUser user];
    miUsuario.username = @"rogras";
    miUsuario.password = @"Scotland3!";
    miUsuario.email = @"xeli82@gmail.com";
    
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            // El usuario ha cancelado el login mediante Facebook.
        } else if (user.isNew) {
            // El usuario se ha creado y logado mediante Facebook.
        } else {
            // El usuario ya existía y se ha logado mediante Facebook.
        }
    }];
    
    [PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {//qANLfzK1MJV1IUYWthxDEmNPp
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
        } else {
            NSLog(@"User logged in through Facebook!");
        }
    }];
    
    /*
    [PFUser logInWithUsernameInBackground:@"rogras" password:@"Scotland3!"
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // El usuario y contraseña indicados son correctos.
                                            PFUser *usuarioActual = [PFUser currentUser];
                                            if (usuarioActual) {
                                                // Ya hay usuario y por tanto continuamos con el flujo de la app.
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                [PFUser logOut];
                                            } else {
                                                // No hay usuario, por lo que mostramos la pantalla de login o alta de usuario.
                                            }
                                        } else {
                                            // El usuario o contraseña NO es correcta.
                                        }
                                    }];
   
    
    // Enviar una notificación a todos los dispositivos suscritos al canal Futbol.
    PFPush *push = [[PFPush alloc] init];
    [push setChannel:@"Futbol"];
    [push setMessage:@"Se han publicado novedades en el canal de fútbol!"];
    [push sendPushInBackground];
    
    // Creamos la consulta a la tabla PFInstallation para recuperar aquellos dispositivos que sean iOS
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
    
    // Enviamos la notificación a los dispositivos que cumplen la consulta
    PFPush *push2 = [[PFPush alloc] init];
    [push2 setQuery:pushQuery];
    [push2 setMessage:@"¡Como eres usuario de iOS tenemos una sorpresa para tí!"];
    [push2 sendPushInBackground];
    */
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "net.rogras.CHRiudoms" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CHRiudoms" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CHRiudoms.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [PFFacebookUtils handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}


- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    // Guardamos el deviceToken en un nuevo registro en la tabla que crea por defecto Parse, y denominada Installation.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
    
    // Como el usuario ha indicado que le gusta el fútbol, le incluimos en el canal futbol.
    [currentInstallation addUniqueObject:@"Futbol" forKey:@"channels"];
    [currentInstallation saveInBackground];
    
    
    // El usuario nos indica que ya no le gusta el fútbol, y por tanto retiramos su suscripción del canal.
    [currentInstallation removeObject:@"Futbol" forKey:@"channels"];
    [currentInstallation saveInBackground];
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"El usuario no ha aceptado recibir notificaciones push de nuestra app");
}
@end
