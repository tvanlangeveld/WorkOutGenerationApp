//
//  coreDataManager.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/18/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    
    
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SavedWorkOutsModel")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    func createWorkOut(name: String) {
        let workOut = CoreDataWorkOut(context: persistentContainer.viewContext)
        
        workOut.name = name
        
        for exercise in WorkOuts.shared.exercises {
            let coreDataExercise = CoreDataExercise(context: persistentContainer.viewContext)
            coreDataExercise.name = exercise.name
            workOut.addToExercise(coreDataExercise)
        }
        
        do{
            try persistentContainer.viewContext.save()
        } catch{
            print("Error saving context\(error)")
        }
        
    }
    
    func fetchWorkOuts() -> [CoreDataWorkOut] {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<CoreDataWorkOut> = CoreDataWorkOut.fetchRequest()
        
        
        var returnArray: [CoreDataWorkOut] = []
        
        do{
        returnArray = try context.fetch(request)
        } catch{
            print("Error fetching context\(error)")
        }
        
        
        return returnArray
        
    }
}
