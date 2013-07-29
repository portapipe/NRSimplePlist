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
@end
