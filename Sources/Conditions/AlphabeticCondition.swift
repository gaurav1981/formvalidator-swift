//
//  AlphabeticCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 12/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `AlphabeticCondition` checks a string for occurrences of letters.
 */
public struct AlphabeticCondition: Condition {
    
    
    // MARK: - Properties
    
    public static let localizedViolationString = StringLocalization.localizedString("US2KeyConditionViolationAlphabetic", comment: "")
    
    public let regex: String
    
    public var shouldAllowViolation = true
    
    /// Whether or not to allow whitespace.
    public let allowsWhiteSpace: Bool
    
    
    // MARK: - Initializers
    
    /**
    Initializes a `AlphabeticCondition`.
    - parameter allowsWhiteSpace: Whether or not to allow whitespace.
    */
    public init(allowsWhiteSpace: Bool) {
        self.allowsWhiteSpace = allowsWhiteSpace
        
        if allowsWhiteSpace {
            regex = "[a-zA-Z\\s]"
        } else {
            regex = "[a-zA-Z]"
        }
    }
    
    
    // MARK: - Check
    
    public func check(text: String?) -> Bool {
        guard let sourceText = text
            where !sourceText.isEmpty,
            let regExpression = try? NSRegularExpression(pattern: regex, options: .CaseInsensitive) else {
                
                return false
        }
        
        return regExpression.numberOfMatchesInString(sourceText, options: [], range: NSRange(location: 0, length: sourceText.utf16.count)) == sourceText.utf16.count
    }
    
}