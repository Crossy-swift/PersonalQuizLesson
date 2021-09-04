//
//  ResultsViewController.swift
//  PersonalQuizLesson
//
//  Created by Артем Репин on 03.09.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        getResult()
        
        // ДЗ
        // 1. передать сюда массив с ответами
        // 2. определить наиболее часто встречающийся тип животного
        // 3. отобразить данные в соответствии с этим животным
        // 4. избавиться от кнопки возврата назад на экране результатов
    }
    
}

// MARK: - Private Methods

extension ResultsViewController {
    
    private func getResult() {
        
        // 1. Объявляем пустой словарь с ключем "тип животного", значением "целочисленное число"
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        // 2. Перебираем массив с ответами отбирая только Тип животного
        let animals = answers.map { $0.type }
        // 3. Извлекаем из массива конкретное животное и проверяем
        for animal in animals {
            // Если в словаре по этому ключу есть елемент увеличивает его значение на 1
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
                // Обращаемся к словарю по ключу "Animal" и присваиваем ему 1 создавая пару
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        // 4. Сортируем массив по величине
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        // 5. Присваиваем значение по первому ключу массива
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        resultAnimalLabel.text = "Вы - \(animal.rawValue)!"
        resultDescriptionLabel.text = animal.definition
    }
}

