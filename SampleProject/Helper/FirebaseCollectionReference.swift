//
//  FirebaseCollectionReference.swift
//  SampleProject
//
//  Created by iRent No. 3 on 2022-03-09.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Category
    case Items
    case Basket
}

func FireBaseReference(_ collectionReference: FCollectionReference) -> CollectionReference{
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
