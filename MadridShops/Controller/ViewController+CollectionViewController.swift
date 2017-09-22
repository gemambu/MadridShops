import UIKit
import CoreData

extension EntitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let entityCell: EntityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EntityCell", for: indexPath) as! EntityCell

        let entityCD: EntityCD = fetchedResultsController.object(at: indexPath)
        entityCell.refresh(entity: mapEntityCDIntoEntity(entityCD: entityCD))
        return entityCell
    }
    
    
 
    
    
}
