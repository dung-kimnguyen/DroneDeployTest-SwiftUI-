//
//  DataModel.swift
//  TakeHomeTest
//
//  Created by Dung Kim Nguyen on 8/3/21.
//

import Foundation

    struct DataModel {
        let name = "David Jones"
        func randToken () -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let tokens = String((0..<10).map{ _ in letters.randomElement()! })
            return tokens
        }
    }


