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
        NSLog(@"NRSimplePlist - Errore LETTURA file plist '%s', errore = '%s'", [localizedPath UTF8String], [plistError UTF8String]);
        NSLog(@"NRSimplePlist - Error READING plist file '%s', error = '%s'", [localizedPath UTF8String], [plistError UTF8String]);
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
            NSLog(@"Error editing plist file: no valid parameter sended!");
        }
        
        
        [tempPlist setObject:valoreTemp forKey:chiave];
        [tempPlist writeToFile:localizedPath atomically:YES];
    } else {
        NSLog(@"NRSimplePlist - Errore nella MODIFICA del file plist '%s', errore = '%s'", [localizedPath UTF8String], [plistErrorWrite UTF8String]);
        NSLog(@"NRSimplePlist - Error EDITING plist file '%s', error = '%s'", [localizedPath UTF8String], [plistErrorWrite UTF8String]);
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
        NSLog(@"NRSimplePlist - Error EDITING STRING of plist file '%s'", [localizedPath UTF8String],nil);
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
        NSLog(@"NRSimplePlist - Error EDITING NUMBER of plist file '%s'", [localizedPath UTF8String],nil);
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
        NSLog(@"NRSimplePlist - Error EDITING BOOL of plist file '%s'", [localizedPath UTF8String],nil);
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
        NSLog(@"NRSimplePlist - Error EDITING DATA of plist file '%s'", [localizedPath UTF8String],nil);
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
        NSLog(@"NRSimplePlist - Error EDITING DATE of plist file '%s'", [localizedPath UTF8String],nil);
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
        NSLog(@"NRSimplePlist - Error EDITING ARRAY of plist file '%s'", [localizedPath UTF8String],nil);
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
        NSLog(@"NRSimplePlist - Error EDITING DICTIONARY of plist file '%s'", [localizedPath UTF8String],nil);
    }
}



//ENGLISH
//Fetch
+(id)valuePlist:(NSString *)plistName withKey:(NSString*)key{
    return [self valorePlist:plistName conChiave:key];
}
//String
+(void)editStringPlist:(NSString *)plistName withKey:(NSString*)key andString:(NSString*)string{
    [self modificaStringaPlist:plistName conChiave:key eStringa:string];
}
//Number
+(void)editNumberPlist:(NSString *)plistName withKey:(NSString*)key andNumber:(NSNumber*)number{
    [self modificaNumeroPlist:plistName conChiave:key eNumero:number];
}
//Bool
+(void)editBoolPlist:(NSString *)plistName withKey:(NSString*)key andBool:(BOOL)boolValue{
    [self modificaBoolPlist:plistName conChiave:key eBool:boolValue];
}
//Data
+(void)editDataPlist:(NSString *)plistName withKey:(NSString*)key andData:(NSData*)data{
    [self modificaDataPlist:plistName conChiave:key eData:data];
}
//Date
+(void)editDatePlist:(NSString *)plistName withKey:(NSString*)key andDate:(NSDate*)date{
    [self modificaDatePlist:plistName conChiave:key eDate:date];
}
//Array
+(void)editArrayPlist:(NSString *)plistName withKey:(NSString*)key andArray:(NSArray*)array{
    [self modificaArrayPlist:plistName conChiave:key eArray:array];
}
//Dictionary
+(void)editDictionaryPlist:(NSString *)plistName withKey:(NSString*)key andDictionary:(NSDictionary*)dictionary{
    [self modificaDictionaryPlist:plistName conChiave:key eDictionary:dictionary];
}

@end
