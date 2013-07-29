NRSimplePlist
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
