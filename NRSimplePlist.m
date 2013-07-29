//
//  NRSimplePlist.m
//
//  Created by Norman Russo on 29/07/13.
//  Copyright (c) 2013 Norman Russo. All rights reserved.
//

#import "NRSimplePlist.h"

@implementation NRSimplePlist


//Estrae un valore dalla plist passata come primo parametro
+ (id)valorePlist:(NSString *)nomeFile conChiave:(NSString*)chiave {
    
    NSString *plistError;
    NSPropertyListFormat format;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    NSData *plistData = [NSData dataWithContentsOfFile:localizedPath];
    
    id plist = [NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&plistError];
    if (!localizedPath) {
        NSLog(@"Errore LETTURA file plist '%s', errore = '%s'", [localizedPath UTF8String], [plistError UTF8String]);
    }
    
    return [(NSArray *)plist valueForKey:chiave];
}

//Modifica un valore nella plist (passato come primo parametro) alla chiave passata. Metodo generico che comprende le cose più comuni
+ (void)modificaPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eValoreStringa:(NSString*)stringa numero:(NSNumber*)numero data:(NSData*)data date:(NSDate*)date booleano:(BOOL)booleano{
    NSString *plistErrorWrite;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: localizedPath]) {
        NSMutableDictionary *tempPlist = [[NSMutableDictionary alloc]initWithContentsOfFile:localizedPath];
        
        id valoreTemp;
        
        if(stringa != nil){
            valoreTemp = stringa;
        }else if(numero != nil){
            valoreTemp = numero;
        }else if(data != nil){
            valoreTemp = data;
        }else if(date != nil){
            valoreTemp = date;
        }else if(booleano){
            valoreTemp = [NSNumber numberWithBool:(BOOL)booleano];
        }else{
            NSLog(@"Errore nella modifica plist: nessun parametro valido passato!");
        }
        
        
        [tempPlist setObject:valoreTemp forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"Errore nella MODIFICA del file plist '%s', errore = '%s'", [localizedPath UTF8String], [plistErrorWrite UTF8String]);
    }
}

+(void)modificaStringaPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eStringa:(NSString*)stringa{
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: localizedPath]) {
        NSMutableDictionary *tempPlist = [[NSMutableDictionary alloc]initWithContentsOfFile:localizedPath];
        
        [tempPlist setObject:stringa forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"NRSimplePlist - Errore nella MODIFICA STRINGA del file plist '%s'", [localizedPath UTF8String],nil);
    }
}

+(void)modificaNumeroPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eNumero:(NSNumber*)numero{
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: localizedPath]) {
        NSMutableDictionary *tempPlist = [[NSMutableDictionary alloc]initWithContentsOfFile:localizedPath];
        
        [tempPlist setObject:numero forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"NRSimplePlist - Errore nella MODIFICA NUMERO del file plist '%s'", [localizedPath UTF8String],nil);
    }
}


+(void)modificaBoolPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eBool:(BOOL)valoreBooleano{
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: localizedPath]) {
        NSMutableDictionary *tempPlist = [[NSMutableDictionary alloc]initWithContentsOfFile:localizedPath];
        
        
        [tempPlist setObject:[NSNumber numberWithBool:valoreBooleano] forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"NRSimplePlist - Errore nella MODIFICA BOOLEANA del file plist '%s'", [localizedPath UTF8String],nil);
    }
}


+(void)modificaDataPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eData:(NSData*)data{
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: localizedPath]) {
        NSMutableDictionary *tempPlist = [[NSMutableDictionary alloc]initWithContentsOfFile:localizedPath];

        [tempPlist setObject:data forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"NRSimplePlist - Errore nella MODIFICA DATA del file plist '%s'", [localizedPath UTF8String],nil);
    }
}

+(void)modificaDatePlist:(NSString *)nomeFile conChiave:(NSString*)chiave eDate:(NSDate*)date{
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: localizedPath]) {
        NSMutableDictionary *tempPlist = [[NSMutableDictionary alloc]initWithContentsOfFile:localizedPath];
        
        [tempPlist setObject:date forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"NRSimplePlist - Errore nella MODIFICA DATE del file plist '%s'", [localizedPath UTF8String],nil);
    }
}

+(void)modificaArrayPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eArray:(NSArray*)array{
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: localizedPath]) {
        NSMutableDictionary *tempPlist = [[NSMutableDictionary alloc]initWithContentsOfFile:localizedPath];
        
        [tempPlist setObject:array forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"NRSimplePlist - Errore nella MODIFICA ARRAY del file plist '%s'", [localizedPath UTF8String],nil);
    }
}

+(void)modificaDictionaryPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eDictionary:(NSDictionary*)dictionary{
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:nomeFile ofType:@"plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: localizedPath]) {
        NSMutableDictionary *tempPlist = [[NSMutableDictionary alloc]initWithContentsOfFile:localizedPath];
        
        [tempPlist setObject:dictionary forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"NRSimplePlist - Errore nella MODIFICA DICTIONARY del file plist '%s'", [localizedPath UTF8String],nil);
    }
}

@end
