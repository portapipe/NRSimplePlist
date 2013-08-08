NRSimplePlist
=============
ENGLISH
=============

###Easy library to fetch and edit data from and to plists on the fly (XCode)


---

## Usage


Fetch values:
<pre>
<code>
 + (id)valuePlist:(NSString *)plistName withKey:(NSString*)key;
</code>
</pre>


edit values, depending of his type, with:
<pre>
<code>
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
</code>
</pre>

---
## Example

Fetching the name of background music from the 'settings.plist' file into the project:

	 NSString *stringFromPlist = [NRSimplePlist valuePlist:@"settings" withKey:@"backgroundMusic"];


Editing the background music, saving the changes on the fly:

	[NRSimplePlist editStringPlist:@"settings" withKey:@"backgroundMusic" andString:@"bgMusic2.mp3"];


Easy, right?
Let's give it a try!


N.B. If you want to save sensible data DON'T USE PLISTS! Use CoreData instead or MySQL/MySQLi database!




ITALIANO
=============
###Semplice libreria per recuperare dati da file plist e modificarli al volo (XCode)


---

## Utilizzo


Recupera i valori con:
<pre>
<code>
 + (id)valorePlist:(NSString *)nomeFile conChiave:(NSString*)chiave;
</code>
</pre>


Modifica i valori, a seconda del tipo, con:
<pre>
<code>
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
</code>
</pre>

---
## Esempio

Estraiamo il nome della musica di sottofondo dal file 'settaggi.plist' presente nel progetto:

	 NSString *stringaDaPlist = [NRSimplePlist valorePlist:@"settaggi" conChiave:@"musicaSottofondo"];


Modifichiamo ora la musica di sottofondo, salvando subito il cambiamento:

	[NRSimplePlist modificaStringaPlist:@"settaggi" conChiave:@"musicaSottofondo" eStringa:@"sottofondo2.mp3"];


Semplice no?
Provaci anche tu!


N.B. Se devi passare dati sensibili NON USARE LE PLIST ma utilizza CoreData o i database MySQL o MySQLi!
