//
//  UserCategoryKeeper.swift
//  Bomb
//
//  Created by Nickolay Vasilchenko on 11.08.2023.
//

import Foundation
// This struct is needed to store the selected categories.
// It's a singleton, so it doesn't need initialization.
// You can access the selected categories from any file or object
struct UserCategoryKeeper {
    static var shared = UserCategoryKeeper()

    private init() {}

    private var selectedCategories: Set<Category> = []

    mutating func addCategory(_ selection: Category) {
        selectedCategories.insert(selection)
    }

    mutating func removeCategory(_ selection: Category) {
        selectedCategories.remove(selection)
    }

    func getSelectedCategories() -> Set<Category> {
        return selectedCategories
    }
}
