//
//  Mapper.swift
//  SwiftMapper
//
//  Created by krzysztofsiejkowski on 11/07/14.
//  Copyright (c) 2014 Swiftcrunch. All rights reserved.
//

import Foundation

class Mapper<T> {
    
    var mappings: [(Mapper, T) -> ()] = []
    var validations: [String:String] = [:]
    var json: [String:AnyObject] = [:]
    var tmpVal = ""
    
    var required: Mapper<T> {
    get {
        tmpVal += "required "
        return self
    }
    }
    
    subscript(index: String) -> (Mapper, String) {
        get {
            validations[index] = tmpVal
            tmpVal = ""
            return (self, index)
        }
        set {}
    }
    
    func map(c: ((Mapper, T) -> ())) {
        mappings.append(c)
    }
    
    func parse(object: T) -> () {
        for map in mappings {
            map(self, object)
        }
    }
    
    func parse(json: String, to object: T) -> (T) {
        return parse(asDictionary(json), to: object)
    }
    
    func parse(json: [String:AnyObject], to object: T) -> (T) {
        self.json = json
        for map in mappings {
            map(self, object)
        }
        return object
    }
    
    func valueFor(key: String) -> (AnyObject?) {
        return json[key]
    }
    
    func min(min: Int) -> Mapper {
        tmpVal += "min"
        return self
    }
    
}