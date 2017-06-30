//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Mir Ahmed on 6/29/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    
    // create function to create a note
    static func newNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return note
    }
    
    // create function to save a note 
    static func saveNote() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    // create function to delete a note 
    static func delete(note: Note) {
        managedContext.delete(note)
        saveNote()
    }
    
    // create function to retrieve a note
    static func retrieveNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        }
        catch let error as NSError{
            print("Could not fetch \(error)")
        }
        
        return []
    }
    
    
    
    
    
}
