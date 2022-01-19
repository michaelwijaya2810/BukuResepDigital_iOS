//
//  Recipe.swift
//  TheRecipeBook
//
//  Created by User on 18/01/22.
//

import Foundation

class Recipe{
    var name: String;
    var country: String;
    var type: String;
    var imgSrc: String;
    var desc: String;
    
    var arrBahan: [String] = [];
    var arrSteps: [String] = [];
    
    init(name: String, country: String, type: String, imgSrc: String, desc: String, arrBahan: [String], arrSteps: [String]) {
        self.name = name;
        self.country = country;
        self.type = country;
        self.imgSrc = imgSrc;
        self.desc = desc;
        self.arrBahan = arrBahan;
        self.arrSteps = arrSteps;
    }
}
