import Foundation

public protocol EntitiesProtocol {
    func count() -> Int
    func add(entity: Entity)
    func get(index: Int) -> Entity
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
    
    public func get(index: Int) -> Entity {
        return (entityList?[index])!
    }
    
    
}
