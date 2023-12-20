import Foundation
import CoreData


extension Dish {
    
    static func existsInCore(menuItem: MenuItem, 
                             _ context: NSManagedObjectContext) -> Bool {
        
        // 1. setup query
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", menuItem.title);
        let request = Dish.fetchRequest();
        request.predicate = predicate;
        
        // 2. make query
        let res: [Dish]?;
        do {
            res = try context.fetch(request);
        } catch {
            print("There was an error while fetching the core data Dish contents");
            return false;
        }
        
        // 3. return existence
        if (res == nil) {
            return false;
        } else {
            return res!.count > 0;
        }
        
    }

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        
        for menuItem in menuItems {
            // 1. ignore existing menu items
            if existsInCore(menuItem: menuItem, context) {
                continue;
            }
            
            // 2. create Dish representations
            let d = Dish(context: context);
            d.name = menuItem.title;
            if let price = Float(menuItem.price) {
                d.price = price;
            }
            d.textDescription = menuItem.description;
            d.image = menuItem.image;
            d.category = menuItem.category;
        }
        
        
        if (context.hasChanges) {
            do {
                try context.save()
            } catch {
                print("There was an error saving the context changes");
            }
        }
        
    }
    
}
