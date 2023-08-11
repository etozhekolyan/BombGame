//
//  CategoryQuestionsModel.swift
//  Bomb
//
//  Created by Nickolay Vasilchenko on 11.08.2023.
//

import Foundation

struct QuestionStorage {
    var questions: [Question] = [
        Question(category: .sport, question: "Назовите вид спорта, где играют мячом"),
        Question(category: .sport, question: "Назовите зимние виды спорта"),
        Question(category: .sport, question: "Назовите обладателей Золотого мяча по футболу"),
        Question(category: .sport, question: "Назовите футболиста, носившие 10 номер"),
        Question(category: .sport, question: "Каких тренеров по футболу вы знаете?"),
        Question(category: .sport, question: "Назовите пилота Формулы-1"),
        Question(category: .sport, question: "Назовите вид хобби связанный с коллекционированием?"),
        Question(category: .sport, question: "Назовите зимний вид спорта"),
        Question(category: .sport, question: "Назовите командный вид спорта"),
        Question(category: .sport, question: "Назовите вид единоборства"),
        Question(category: .sport, question: "Назовите теннисиста"),
        Question(category: .sport, question: "Назовите баскетболиста"),
        Question(category: .sport, question: "Название спорта название которого заканчивается на -бол"),
        Question(category: .sport, question: "Назовите водный вид спорта"),
        Question(category: .sport, question: "Назовите олимпийский вид спорта"),
        
        Question(category: .aboutDifferent, question: "Назовите марку машины"),
        Question(category: .aboutDifferent, question: "Назовите алкогольный напиток"),
        Question(category: .aboutDifferent, question: "Назовите карточную игру"),
        Question(category: .aboutDifferent, question: "Какое изобретение изменило мир?"),
        Question(category: .aboutDifferent, question: "Назовите семь чудес света"),
        Question(category: .aboutDifferent, question: "Назовите домашнее животное"),
        Question(category: .aboutDifferent, question: "Что берут в поход?"),
        Question(category: .aboutDifferent, question: "Назовите струнные музыкальные инструменты"),
        Question(category: .aboutDifferent, question: "Назовите предмет одежды"),
        Question(category: .aboutDifferent, question: "Назовите животное с рогами"),
        Question(category: .aboutDifferent, question: "Назовите праздник"),
        Question(category: .aboutDifferent, question: "Что можно увидеть в деревне?"),
        Question(category: .aboutDifferent, question: "Назовите язык программирования"),
        Question(category: .aboutDifferent, question: "Назовите безалкогольный напиток"),
        Question(category: .aboutDifferent, question: "Назовите профессию"),
        
        Question(category: .artAndCinema, question: "Назовите персонажа Звездных Войн"),
        Question(category: .artAndCinema, question: "Назовите актера/актрису советского кино"),
        Question(category: .artAndCinema, question: "Назовите героя Marvel"),
        Question(category: .artAndCinema, question: "Назовите героя DC"),
        Question(category: .artAndCinema, question: "Фильм с Ди Каприо"),
        Question(category: .artAndCinema, question: "Назовите фильм с Томом Хэнксом"),
        Question(category: .artAndCinema, question: "Назовите режиссера"),
        Question(category: .artAndCinema, question: "Назовите актера получивший Оскар"),
        Question(category: .artAndCinema, question: "Назовите фильм получивший Оскар"),
        Question(category: .artAndCinema, question: "Фильм Гая Ричи"),
        Question(category: .artAndCinema, question: "Фильм Кристофера Нолана"),
        Question(category: .artAndCinema, question: "Назовите зарубежный сериал"),
        Question(category: .artAndCinema, question: "Назовите фильм с Шарлиз Терон"),
        Question(category: .artAndCinema, question: "Назовите фильм со Скарлетт Йоханссон"),
        Question(category: .artAndCinema, question: "Назовите фильм с Джимом Керри"),
        
        Question(category: .celebrities, question: "Назовите русского писателя"),
        Question(category: .celebrities, question: "Назовите зарубежную актрису"),
        Question(category: .celebrities, question: "Назовите зарубежного актера"),
        Question(category: .celebrities, question: "Назовите рок-группу"),
        Question(category: .celebrities, question: "Назовите зарубежного писателя"),
        Question(category: .celebrities, question: "Назовите ученого-физика"),
        Question(category: .celebrities, question: "Назовите фамилию художника"),
        Question(category: .celebrities, question: "Назовите композитора"),
        Question(category: .celebrities, question: "Назовите президента США"),
        Question(category: .celebrities, question: "Назовите спортсмена"),
        Question(category: .celebrities, question: "Назовите космонавта"),
        Question(category: .celebrities, question: "Назовите политического деятеля"),
        Question(category: .celebrities, question: "Назовите советского актера"),
        Question(category: .celebrities, question: "Назовите советскую актрису"),
        Question(category: .celebrities, question: "Назовите режиссера фильмов"),
        
        Question(category: .nature, question: "Назовите город без буквы А в названии"),
        Question(category: .nature, question: "Назовите гору"),
        Question(category: .nature, question: "Назовите реку не в России"),
        Question(category: .nature, question: "Назовите море"),
        Question(category: .nature, question: "Назовите столицу"),
        Question(category: .nature, question: "Назовите столицу государства в Европе"),
        Question(category: .nature, question: "Государство в Африке"),
        Question(category: .nature, question: "Государство в Азии"),
        Question(category: .nature, question: "Назовите штат в США"),
        Question(category: .nature, question: "Назовите страну в Южной Америке"),
        Question(category: .nature, question: "Назовите реки России"),
        Question(category: .nature, question: "Сооружение, являющееся символом страны"),
        Question(category: .nature, question: "Назовите пустыню"),
        Question(category: .nature, question: "Страны, граничащие с Россией"),
        Question(category: .nature, question: "Город с Европе")
    ]
}

enum Category {
    case sport, aboutDifferent, adoutLife, artAndCinema, celebrities, nature
}

struct Question {
    let category: Category
    let question: String
}
