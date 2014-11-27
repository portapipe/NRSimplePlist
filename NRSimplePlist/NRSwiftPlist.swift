//
//  NRswiftPlist.swift
//
//  Created by Norman Russo on 04/11/14.
//  Copyright (c) 2014 Norman Russo. All rights reserved.
//

import UIKit

func plistGet(key:String, forPlistNamed:String) -> AnyObject{
    
    var error:NSError?
    var formats: UnsafeMutablePointer<NSPropertyListFormat> = UnsafeMutablePointer()
    
    var array:NSArray = NSArray()
    var tipo:AnyObject = ""
    
    
    if let path:String = NSBundle.mainBundle().pathForResource(forPlistNamed, ofType: "plist"){
        
        if let plistData = NSData(contentsOfFile: path) {
            
            var plist = NSPropertyListSerialization.propertyListWithData(plistData, options: 0, format: formats, error: &error) as NSDictionary
            
            if (path=="") {
                NSLog("NRSimplePlist - Errore LETTURA file plist '\(path)', errore = '\(error)'")
                NSLog("NRSimplePlist - Error READING plist file '\(path)', error = '\(error)'")
            }
            
            tipo = plist.valueForKey(key)!
            
            return tipo
            
        }
        
    } else {
        println("File '\(forPlistNamed)' not found")
    }
    
    return tipo
}

func plistSet(newValue:AnyObject, forKey:String, inPlistNamed:String){
    
    
    var error:NSError?
    var formats: UnsafeMutablePointer<NSPropertyListFormat> = UnsafeMutablePointer()
    
    var array:NSMutableDictionary = NSMutableDictionary()
    
    var fileManager : NSFileManager = NSFileManager.defaultManager()
    
    
    if let path : NSString = NSBundle.mainBundle().pathForResource(inPlistNamed, ofType: "plist") {
        
        if fileManager.fileExistsAtPath(path){
            
            
            if let plistData = NSData(contentsOfFile: path) {
                
                var plist = NSPropertyListSerialization.propertyListWithData(plistData, options: 0, format: formats, error: &error) as NSMutableDictionary
                
                if (path=="") {
                    NSLog("NRSimplePlist - Errore LETTURA file plist '\(path)', errore = '\(error)'")
                    NSLog("NRSimplePlist - Error READING plist file '\(path)', error = '\(error)'")
                }
                
                array = plist.mutableCopy() as NSMutableDictionary
                
                array.setObject(newValue, forKey: forKey)
                array.writeToFile(path, atomically: true)
            }
            
        } else {
            println("File '\(inPlistNamed)' not found setting value \(newValue) for key \(forKey)")
        }
        
    }else{
        println("NRswiftPlist - The file in the path doesn't exists")
    }
    
    
}
