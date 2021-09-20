//
//  main.swift
//  gb3
//
//  Created by Patros on 20.09.2021.
//

import Foundation

enum Windows: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

enum Engine: String {
    case start = "Двигатель запущен"
    case stop = "Двигатель остановлен"
}

struct SportCar {
    let mark: String
    let year: Int
    let color: String
    let type: String
    let countDoor: Int
    let engineCapacity: Double
    let enginePower: Int
    let transmission: String
    var volumeTrunk: Int
    var volumeTrunkComplete: Int
    var windowsStatus: Windows
    var engineStatus: Engine

    mutating func engineStart() {
        engineStatus = .start
        print(engineStatus.rawValue)
    }
    mutating func engineStop() {
        engineStatus = .stop
        print(engineStatus.rawValue)
    }

    mutating func WindowsOpen () {
        windowsStatus = .open
        print(windowsStatus.rawValue)
    }
    mutating func WindowsClose () {
        windowsStatus = .close
        print(windowsStatus.rawValue)
    }

    mutating func TrunkAdd (freight: Int) {
        volumeTrunkComplete + freight < volumeTrunk ? volumeTrunkComplete += freight : print("не загрузим")
    }
    mutating func TrunkRemove (freight: Int) {
        volumeTrunkComplete - freight >= 0 ? volumeTrunkComplete -= freight : print("столько нет груза")
    }

    func printCar() {
        print(mark, year, "года выпуска, цвет", color, ", тип кузова ", type, countDoor, "-х дверный, ",
              "объем двигателя -", engineCapacity, ", мощность ", enginePower, " л.с., ", transmission,
              ", занято в багажнике", volumeTrunkComplete, " из ", volumeTrunk, ".", windowsStatus.rawValue,
              "и ", engineStatus.rawValue, ".")
    }

}

struct TruckCar {
    let mark: String
    let year: Int
    let color: String
    var trailer: Bool
    let trailerMark: String
    let engineCapacity: Double
    let enginePower: Int
    let transmission: String
    let fuel: String
    let weight: Double
    let loadCapacity: Int
    var load: Int
    let wheelFormula: String
    let engineStatus: Engine
    let windowsOpen: Windows

     func trailerTunk () -> String {
        trailer ? (trailerMark) : "отсутствует"

    }

    mutating func TrunkAdd (freight: Int) {
        load + freight < loadCapacity ? load += freight : print("не загрузим")
    }
    mutating func TrunkRemove (freight: Int) {
        load - freight >= 0 ? load -= freight : print("столько нет груза")
    }

    func printCar() {
        print(mark, year, "года выпуска, прицеп - ", trailerTunk(), transmission, ", топливо - ", fuel, ", длина - ", weight, ", колесная формула - ", wheelFormula, ". Загружено ", load, " из ", loadCapacity, ".", engineStatus.rawValue, "и", windowsOpen.rawValue)
    }
}

var car1 = SportCar (mark: "Hyundai Tiburon", year: 1996, color: "черный", type: "купе", countDoor: 2, engineCapacity: 2.0, enginePower: 139, transmission: "АКПП", volumeTrunk: 360, volumeTrunkComplete: 10, windowsStatus: .close, engineStatus: .stop)

var car2 = SportCar (mark: "Lamborghini Aventador", year: 2011, color: "красный", type: "купе", countDoor: 2, engineCapacity: 6.5, enginePower: 700, transmission: "МКПП", volumeTrunk: 0, volumeTrunkComplete: 0, windowsStatus: .open, engineStatus: .start)

var car3 = TruckCar (mark: "DAF", year: 1998, color: "синий", trailer: true, trailerMark: "Wielton", engineCapacity: 12.9, enginePower: 410, transmission: "МКПП", fuel: "Дизель", weight: 10.5, loadCapacity: 20, load: 0, wheelFormula: "6x2", engineStatus: .start, windowsOpen: .open)

car1.volumeTrunkComplete += 40
car1.TrunkRemove(freight: 30)
car1.printCar()
car2.printCar()
car3.TrunkAdd(freight: 15)
car3.printCar()

