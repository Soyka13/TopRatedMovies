//
//  MovieEntity+PersistanceStore.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import CoreData

extension PersistenceStore where T == MovieEntity {
    
    func saveMovie(_ movie: Movie, completion: ((Bool) -> Void)? = nil) {
        managedObjectContext.performChanges { [weak self] in
            guard let self = self else { return }
            
            let entity = MovieEntity(context: self.managedObjectContext)
            entity.movieId = Int64(movie.id)
            entity.title = movie.title
            entity.posterPath = movie.posterPath
            entity.voteAverage = movie.voteAverage ?? 0
            
            do {
                try managedObjectContext.save()
            } catch {
                print("Core Data - error saving MovieItem to persistant store.")
            }
        
            completion?(true)
        }
    }
    
    func findAll() -> [MovieEntity] {
        guard let entityName = MovieEntity.entity().name else { return [] }
        let request = NSFetchRequest<MovieEntity>(entityName: entityName)
        return (try? managedObjectContext.fetch(request)) ?? []
    }
}
