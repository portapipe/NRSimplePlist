//
//  NRSimplePlist.h
//
//  Created by Norman Russo on 29/07/13.
//  Copyright (c) 2013 Norman Russo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NRSimplePlist : NSObject{

    
}

//Estrai valore
+ (id)valorePlist:(NSString *)nomeFile conChiave:(NSString*)chiave;

//Stringa
+(void)modificaStringaPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eStringa:(NSString*)stringa;

//Numero
+(void)modificaNumeroPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eNumero:(NSNumber*)numero;

//Bool
+(void)modificaBoolPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eBool:(BOOL)valoreBooleano;

//Data
+(void)modificaDataPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eData:(NSData*)data;

//Date
+(void)modificaDatePlist:(NSString *)nomeFile conChiave:(NSString*)chiave eDate:(NSDate*)date;

//Array
+(void)modificaArrayPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eArray:(NSArray*)array;

//Dictionary
+(void)modificaDictionaryPlist:(NSString *)nomeFile conChiave:(NSString*)chiave eDictionary:(NSDictionary*)dictionary;

//ENGLISH
//Fetch
+ (id)valuePlist:(NSString *)plistName withKey:(NSString*)key;
//String
+(void)editStringPlist:(NSString *)plistName withKey:(NSString*)key andString:(NSString*)string;
//Number
+(void)editNumberPlist:(NSString *)plistName withKey:(NSString*)key andNumber:(NSNumber*)number;
//Bool
+(void)editBoolPlist:(NSString *)plistName withKey:(NSString*)key andBool:(BOOL)boolValue;
//Data
+(void)editDataPlist:(NSString *)plistName withKey:(NSString*)key andData:(NSData*)data;
//Date
+(void)editDatePlist:(NSString *)plistName withKey:(NSString*)key andDate:(NSDate*)date;
//Array
+(void)editArrayPlist:(NSString *)plistName withKey:(NSString*)key andArray:(NSArray*)array;
//Dictionary
+(void)editDictionaryPlist:(NSString *)plistName withKey:(NSString*)key andDictionary:(NSDictionary*)dictionary;
@end
