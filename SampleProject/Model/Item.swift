//
//  Item.swift
//  SampleProject
//
//  Created by iRent No. 3 on 2022-03-11.
//

import Foundation
import UIKit

class Item {
    
    var id: String!
    var categoryId: String!
    var name: String!
    var description: String!
    var price: Double!
    var imageLinks: [String]!
    
    init() { }
    
    init(_dictionary: NSDictionary) {
        
        id = _dictionary[kOBJECTID] as? String
        categoryId = _dictionary[kCATEGORYID] as? String
        name = _dictionary[kNAME] as? String
        description = _dictionary[kDESCRIPTION] as? String
        price = _dictionary[kPRICE] as? Double
        imageLinks = _dictionary[kIMAGELINKS] as? [String]
    }
}

// MARK: Save items func

func saveItemToFirestore(_ item: Item) {
    
    FireBaseReference(.Items).document(item.id).setData(itemDictionaryFrom(item) as! [String : Any])
}

// MARK: Helper functions
func itemDictionaryFrom(_ item: Item) -> NSDictionary {
    
    return NSDictionary(objects: [item.id, item.categoryId, item.name, item.description, item.price, item.imageLinks], forKeys: [kOBJECTID as NSCopying, kCATEGORYID as NSCopying, kNAME as NSCopying, kDESCRIPTION as NSCopying, kPRICE as NSCopying, kIMAGELINKS as NSCopying])
}

// MARK: Download func

func downloadItemsFromFirebase(withCategoryId: String, completion: @escaping(_ itemArray: [Item]) -> Void) {
    
    var itemArray: [Item] = []
    
    FireBaseReference(.Items).whereField(kCATEGORYID, isEqualTo: withCategoryId).getDocuments { snapshot, error in
        
        guard let snapshot = snapshot else {
            completion(itemArray)
            return
        }
        
        if !snapshot.isEmpty {
            
            for itemDict in  snapshot.documents {
                
                itemArray.append(Item(_dictionary:  itemDict.data() as NSDictionary))
            }
        }
        
        completion(itemArray)
    }
}