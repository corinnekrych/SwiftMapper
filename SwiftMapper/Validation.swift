//
//  Validators.swift
//  SwiftMapper
//
//  Created by krzysztofsiejkowski on 11/07/14.
//  Copyright (c) 2014 Swiftcrunch. All rights reserved.
//

import Foundation

protocol MapperValidator {
    func validate(value: AnyObject) -> Bool
}
