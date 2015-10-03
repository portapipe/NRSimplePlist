//
//  NRswiftPlist.swift
//
//  Created by Norman Russo on 04/11/14.
//  Copyright (c) 2014 Norman Russo. All rights reserved.
//

import UIKit

public func plistGet(key:String, forPlistNamed:String) throws -> AnyObject{
    let formats: UnsafeMutablePointer<NSPropertyListFormat> = UnsafeMutablePointer()
    
    var array:NSArray = NSArray()
    var tipo:AnyObject = ""
    
    enum NRSimplePlistError: ErrorType {
        case Fatal(String)
    }
    
    
    if let path:String = NSBundle.mainBundle().pathForResource(forPlistNamed, ofType: "plist"){
        
        if let plistData = NSData(contentsOfFile: path) {
            
            //var plist = NSPropertyListSerialization.propertyListWithData(plistData, options: 0, format: formats, error: &error) as NSDictionary
            
            do {
                let plist = try NSPropertyListSerialization.propertyListWithData(plistData, options: NSPropertyListReadOptions.Immutable, format: formats) as! NSDictionary
                
                if (path=="") {
                    NSLog("NRSimplePlist - Errore LETTURA file plist '\(path)'")
                    NSLog("NRSimplePlist - Error READING plist file '\(path)'")
                    
                    throw NRSimplePlistError.Fatal("NRSimplePlist - Error READING plist file '\(path)'")
                }
                
                tipo = plist.valueForKey(key)!
                    
                return tipo
                
            } catch let error1 as NSError {
                NSLog("NRSimplePlist - Errore LETTURA file plist '\(path)'")
                NSLog("NRSimplePlist - Error READING plist file '\(path)'")

                throw error1
            }
            
        }
        
    } else {
        print("File '\(forPlistNamed)' not found")
    }
    
    return tipo
}

public func plistSet(newValue:AnyObject, forKey:String, inPlistNamed:String) throws {
    let formats: UnsafeMutablePointer<NSPropertyListFormat> = UnsafeMutablePointer()
    
    var array:NSMutableDictionary = NSMutableDictionary()
    
    let fileManager : NSFileManager = NSFileManager.defaultManager()
    
    
    if let path : NSString = NSBundle.mainBundle().pathForResource(inPlistNamed, ofType: "plist") {
        
        if fileManager.fileExistsAtPath(path as String){
            
            
            if let plistData = NSData(contentsOfFile: path as String) {
                
                
                do {
                    let plist = try NSPropertyListSerialization.propertyListWithData(plistData, options: NSPropertyListReadOptions.Immutable, format: formats) as! NSDictionary
                    
                    array = plist.mutableCopy() as! NSMutableDictionary
                    
                    array.setObject(newValue, forKey: forKey)
                    array.writeToFile(path as String, atomically: true)
                    
                } catch let error1 as NSError {
                    NSLog("NRSimplePlist - Errore LETTURA file plist '\(path)'")
                    NSLog("NRSimplePlist - Error READING plist file '\(path)'")
                    
                    throw error1
                }
  
            }
            
        } else {
            print("File '\(inPlistNamed)' not found setting value \(newValue) for key \(forKey)")
        }
        
    }else{
        print("NRswiftPlist - The file in the path doesn't exists")
    }
    
    
}
