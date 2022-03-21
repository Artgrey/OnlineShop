//
//  HelperFunctions.swift
//  SampleProject
//
//  Created by iRent No. 3 on 2022-03-16.
//

import Foundation


func convertToCurrency(_ number: Double) -> String {
    
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale.current
    
    return currencyFormatter.string(from: NSNumber(value: number))!
}
