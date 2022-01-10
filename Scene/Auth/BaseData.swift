//
//  BaseData.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 8.01.2022.
//

import Foundation

class BaseData{
    static let shared = BaseData()
    
    private init(){
        
    }
    
    var token:String?
}
