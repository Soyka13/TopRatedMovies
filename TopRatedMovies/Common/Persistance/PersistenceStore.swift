//
//  PersistenceStore.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import CoreData

class PersistenceStore<T: NSManagedObject>: NSObject {
    
    private let persistentContainer: NSPersistentContainer
    private var fetchedResultsController: NSFetchedResultsController<T>?
    
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init(_ persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
        super.init()
    }
    
    func configureResultsContoller(batchSize: Int = 5, limit: Int = 0,
                                   sortDescriptors: [NSSortDescriptor] = [],
                                   predicate: NSPredicate? = nil) {
        
        guard let entityName = T.entity().name else { fatalError() }

        let request =  NSFetchRequest<T>(entityName: entityName)
        request.fetchBatchSize = batchSize
        request.fetchLimit = limit
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.returnsObjectsAsFaults = false


        fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                              managedObjectContext: managedObjectContext,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        fetch()
    }

    
    func fetch() {
        do {
            try fetchedResultsController?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func clear() {
        guard let entityName = T.entity().name else { return }
        managedObjectContext.deleteAllData(for: entityName)
    }
}
