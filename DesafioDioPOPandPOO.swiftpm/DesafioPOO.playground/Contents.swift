import UIKit

// [x] controles de fluxo
// [x] colecoes
// [x] funcoes
// [x] clousures
// [x] enuns
// [x] structs
// [x] Concorrencias

enum VeiculeType {
    case moto
    case carro
    case barco
    case aviao
}

class Veiculo {
    var veiculeType: VeiculeType?
    var isRunning: Bool?
    var velocity: Double?
    
    init(veiculeType: VeiculeType, isRunning: Bool, velocity: Double) {
        self.veiculeType = veiculeType
        self.isRunning = isRunning
        self.velocity = velocity
    }
    
    func correr(clousure: @escaping (_ veiculeType: VeiculeType) -> Void) {
        clousure(veiculeType ?? .carro)
    }
}

struct Motorista {
    var name: String?
    var hasCNH: Bool?
    weak var myCar: Veiculo?
    
    init(name: String, hasCNH: Bool, myCar: Veiculo) {
        self.name = name
        self.hasCNH = hasCNH
        self.myCar = myCar
    }
    
    func CanDrive() -> Bool {
        return hasCNH ?? false
    }
}

class Camiote: Veiculo {
    var carName: String?
    
    init(name: String, veiculeType: VeiculeType, isRunning: Bool, velocity: Double) {
        self.carName = name
        super.init(veiculeType: veiculeType, isRunning: isRunning, velocity: velocity)
    }
}

func fetchMotorista() async -> Motorista {
    return await Motorista(name: "Pedro", hasCNH: false, myCar: MinhaCamionete)
}

var MinhaCamionete = Camiote(name: "Corsinha", veiculeType: .carro, isRunning: true, velocity: 100.0)

var MotoristaPedro = await fetchMotorista()

MinhaCamionete.correr { veiculeType in
    switch veiculeType {
        case .carro, .moto:
            print("\(veiculeType) esta correndo")
        case .aviao:
            print("\(veiculeType) esta voando")
        case .barco:
            print("\(veiculeType) esta flutuando")
    }
}

if(MotoristaPedro.CanDrive()){
    print("Pode dirigir!")
}else{
    print("Não pode dirigir!")
}

