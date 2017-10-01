import Foundation

public protocol EntitiesProtocol {
    func count() -> Int
    func add(entity: Entity)
    func get(index: Int) -> Entity
    func addAll(entities: [Entity])
    func getAll() -> [Entity]
}

public class Entities: EntitiesProtocol {

    private var entityList: [Entity]?
    
    public init(){
        self.entityList = []
    }
    
    public func count() -> Int {
        return entityList == nil ? 0 : (entityList?.count)!
    }
    
    public func add(entity: Entity) {
        entityList?.append(entity)
    }
    
    public func addAll(entities: [Entity]) {
        for entity in entities {
            self.add(entity: entity)
        }
       
    }
    
    public func get(index: Int) -> Entity {
        return (entityList?[index])!
    }
    
    public func getAll() -> [Entity] {
        return entityList != nil ? entityList! : []
    }
    
    
    
}
