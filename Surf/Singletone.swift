//
//  Singletone.swift
//  Surf
//
//  Created by Егор  Хлямов on 01.08.2023.
//

import Foundation


class Singletone{
    public var skills:[String] = ["Swift","UIKit","CoreData","Realm","RxSwift","Combine","GoogleMaps","VKAPI","HTML","CSS","PHP","Python"]
    public var isEditing:Bool = false
    static let shared = Singletone()
    private init(){
        
    }
    func getSkills()->[String]{
        if self.isEditing{
            var res = skills
            res.append("+")
            return res
        }
        return skills
    }
}
