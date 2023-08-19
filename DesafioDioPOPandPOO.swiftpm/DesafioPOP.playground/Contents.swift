import UIKit

// [x] controles de fluxo
// [x] colecoes
// [x] funcoes
// [x] clousures
// [x] enuns
// [x] structs
// [x] Concorrencias

protocol Vehicule {
    var name: String { get }
    var canFly: Bool { get }
    var canRunning:Bool { get }
    
    func speedUp() async -> Void
    func slowDown() async -> Void
}

protocol Flyable {
    var altitud: Double { get }
    var velocity: Double { get }
    func fly() async -> Void
}

protocol Runner {
    var altitud: Double { get }
    var velocity: Double { get }
    
    func run() async -> Void
}

struct Helicopter: Vehicule, Flyable {
    var isActive: Bool = false
    let name: String
    let canFly: Bool = true
    let canRunning: Bool = false
    let altitud: Double
    let velocity: Double
    
    func speedUp() async {
    }
    
    func slowDown() async {
    }
    
    func fly() async {
    }
}

func IsVehiculeActive(helicopter: inout Helicopter, clousure: (inout Helicopter) -> Void ){
    helicopter.isActive = true
    clousure(&helicopter)
}

struct Bicycle: Vehicule {
    var isActive: Bool
    var name: String
    var canFly: Bool = false
    var canRunning: Bool = true
    
    func speedUp() async {
    }
    
    func slowDown() async {
    }
}

enum Airplane: Vehicule, Flyable {
    
    var isActive: Bool {
        return true
    }
    
    case comercial
    case executive
    case military
    case unknown
    
    var canFly: Bool {
        switch self {
            case .comercial, .executive, .military:
                return true
            case .unknown:
                return false
        }
    }
    
    var canRunning: Bool {
        return false
    }
    
    func speedUp() async {
    }
    
    func slowDown() async {
    }
    
    var altitud: Double {
        switch self {
            case .comercial:
                return 2000
            case .executive:
                return 2000
            case .military:
                return 8000
            case .unknown:
                return 0
        }
    }
    
    var velocity: Double {
        switch self {
            case .comercial:
                return 2000
            case .executive:
                return 2000
            case .military:
                return 4000
            case .unknown:
                return 0
        }
    }
    
    func fly() async {
    }
    
    var name: String {
        switch self {
            case .comercial:
                return ""
            case .executive:
                return ""
            case .military:
                return ""
            case .unknown:
                return ""
        }
    }
}

var helicopter = Helicopter(name: "Fox 500", altitud: 1000, velocity: 300)
await helicopter.speedUp()
await helicopter.fly()

IsVehiculeActive(helicopter: &helicopter) { helicopter in
    print("\(helicopter.name) está ativo")
}

print(helicopter.isActive)


