NRSimplePlist
=============

COCOAPODS
<pre>pod 'NRSimplePlist'</pre>

ENGLISH
=============

###Easy library to fetch and edit data from and to plists on the fly (XCode)


---

## Usage

### Swift Version
Get values (return AnyObject):
<pre>
<code>
 plistGet(key:String, forPlistNamed:String) -> AnyObject
</code>
</pre>

Set value for key:
<pre>
<code>
 plistSet(newValue:AnyObject, forKey:String, inPlistNamed:String)
</code>
</pre>

With Arrays and Dictionaries you have to set the var to a .mutableCopy() of it before setting it:
<pre>
<code>
 var value = plistGet(...)
 value = value.mutableCopy()
</code>
</pre>

---
### Example - Swift Version

Fetching the name of background music from the 'settings.plist' file into the project:

	var stringFromPlist : NSString = plistGet("settings", "backgroundMusic") as NSString


Editing the background music, saving the changes on the fly:

	//You can put this into a viewDidLoad method, a generic method, a class or where you need it!
	plistSet("bgMusic2.mp3", "backgroundMusic", "settings")
	//Set new value "bgMusic2.mp3" for key "backgroundMusic" in Plist named "settings"

---
### Objective-C Version
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
## Examples - Objective-C Version

Fetching the name of background music from the 'settings.plist' file into the project:

	 NSString *stringFromPlist = [NRSimplePlist valuePlist:@"settings" withKey:@"backgroundMusic"];


Editing the background music, saving the changes on the fly:

	//You can put this into a viewDidLoad method, a generic method, a class or where you need it!
	[NRSimplePlist editStringPlist:@"settings" withKey:@"backgroundMusic" andString:@"bgMusic2.mp3"];


Easy, right?
Let's give it a try!


N.B. If you want to save sensible data DON'T USE PLISTS! Use CoreData instead or MySQL/MySQLi database!




ITALIANO
=============
###Semplice libreria per recuperare dati da file plist e modificarli al volo (XCode)


---

## Utilizzo
### Versione Swift (solo in inglese per praticità)
Ritorna il valore passando una chiave (ritorna NSString):
<pre>
<code>
 plistGet(key:String, forPlistNamed:String) -> AnyObject
</code>
</pre>

Setta un valore nel file per la chiave passata:
<pre>
<code>
 plistSet(newValue:AnyObject, forKey:String, inPlistNamed:String)
</code>
</pre>

Con Array e Dictionary devi settare la variabile in una versione .mutableCopy() prima di poterli modificare:
<pre>
<code>
 var value = plistGet(...)
 value = value.mutableCopy()
</code>
</pre>
---
### Esempio - Versione Swift

Estraiamo il nome della musica di sottofondo dal file 'settaggi.plist' presente nel progetto:

	var stringFromPlist : NSString = plistGet("settings", "backgroundMusic") as NSString


Modifichiamo ora la musica di sottofondo, salvando subito il cambiamento:

	plistSet("bgMusic2.mp3", "backgroundMusic", "settings")
	//Setta nuovo valore "bgMusic2.mp3" per la chiave "backgroundMusic" nel file Plist "settings"

---
### Versione Objective-C

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
## Esempio - Versione Objective-C

Estraiamo il nome della musica di sottofondo dal file 'settaggi.plist' presente nel progetto:

	 NSString *stringaDaPlist = [NRSimplePlist valorePlist:@"settaggi" conChiave:@"musicaSottofondo"];


Modifichiamo ora la musica di sottofondo, salvando subito il cambiamento:

	[NRSimplePlist modificaStringaPlist:@"settaggi" conChiave:@"musicaSottofondo" eStringa:@"sottofondo2.mp3"];


Semplice no?
Provaci anche tu!


N.B. Se devi passare dati sensibili NON USARE LE PLIST ma utilizza CoreData o i database MySQL o MySQLi!
