//
//  Constant.swift
//  Aktuel
//
//  Created by Turan Çabuk on 28.11.2022.
//  https://api.ceptesok.com/api/customlists/95/products?stock=true&page=1


import Foundation

enum AktuelAPICall: String {
    
    private var baseUrl: String {
        "https://api.ceptesok.com/api/customlists/95/products?stock=true&page=1"
    }
    
    case getAktuel
    
    private var urlString: String {
        switch self {
        case.getAktuel:
            return "\(baseUrl)"
        }
    }
    
    var url: URL {
        switch self {
        case .getAktuel:
            return URL(string: "\(baseUrl)")!
        }
        
    }
}

