//
//  ViewController.swift
//  MadridShops
//
//  Created by Gema on 7/9/17.
//  Copyright © 2017 Gema. All rights reserved.
//

import UIKit

class ShopsViewController: UIViewController {

    @IBOutlet weak var shopsCollectionView: UICollectionView!
    var shops: Shops?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSOpImpl()
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        /*
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            // todo OK
        }) { (error: Error) in
            // ha habido error
        }

        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            // todo OK
        })
 */
        
        downloadShopsInteractor.execute{ (shops: Shops) in
            // todo OK
            print("Name: " + shops.get(index: 0).name)
            self.shops = shops
            
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shop = self.shops?.get(index: indexPath.row)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController
            
            //let indexPath = self.shopsCollectionView.indexPathsForSelectedItems![0]
            //let shop = self.shops?.get(index: indexPath.row)
            
            vc.shop = sender as! Shop
            
        }
    }


}

