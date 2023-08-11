//
//  FilterQuestions.swift
//  Bomb
//
//  Created by Nickolay Vasilchenko on 11.08.2023.
//

import Foundation

class FilterQuastions {
    private var filteredQuestions: [Question] = []
    // the class that stores an array of the questions
    private var questionsStorage: QuestionStorage?
    
    init(questions questionsStorage: QuestionStorage) {
        self.questionsStorage = questionsStorage
    }
    
    func filter() {
        guard let questions = questionsStorage?.questions else { return }
        let selectedCategories = UserCategoryKeeper.shared.getSelectedCategories()
        if selectedCategories.isEmpty {
            //In case the user has not selected any categories
            filteredQuestions = questions
        } else {
            filteredQuestions = questions.filter {selectedCategories.contains($0.category)}
        }
    }
    
    func getFilteredQuestions() -> [Question] {
        return filteredQuestions
    }
}
