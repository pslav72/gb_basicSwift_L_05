import UIKit

let delimiter = "============================"

enum BodyType: String {
    case liftback
    case sedan
    case SUV
    case truck
    case sportCar
}

enum NumberOfBridges: String {
    case twoBriges
    case threBridges
}

enum controlObject {
    case doors(DoorsAction)
    case windows(WindowsAction)
    case climateControl(ClimateControl)
    case engine(EngineAction)
    
    enum DoorsAction {
            case open, close
        }
    
    enum WindowsAction {
            case open, close
        }
    
    enum ClimateControl {
        case auto, manual, off
    }
    
    enum EngineAction {
        case start, stop
    }
    
}

protocol ProtocolCar {
    func controlObject (_ object: controlObject)
}

extension ProtocolCar {
    func controlObject (_ object: controlObject) {
        switch object {

        case let .climateControl(action):
            print(delimiter)
            print("Work mode clima \(action)")

        case let .doors(action):
            print(delimiter)
            print("\(action) doors")

        case let .windows(action):
            print(delimiter)
            print("\(action) windows")

        case let .engine(action):
            print(delimiter)
            print("\(action) engine")

        }
    }
}

class SportCar: ProtocolCar {
    let brand: String
    let year: Int
    let maxTrunkVolume: Int
    let climateControl: controlObject.ClimateControl
    let bodyType: BodyType
    
    init(brand: String, year: Int, maxTrunkVolume: Int, climateControl: controlObject.ClimateControl, bodyType: BodyType) {
        self.brand = brand
        self.year = year
        self.maxTrunkVolume = maxTrunkVolume
        self.climateControl = climateControl
        self.bodyType = bodyType
    }
}

extension SportCar: CustomStringConvertible {
    var description: String{
        return "Create SportCar"
    }
}

class TrunkCar: ProtocolCar {
    let brand: String
    let year: Int
    let climateControl: controlObject.ClimateControl
    let numberOfBridges: NumberOfBridges
    
    init(brand: String, year: Int, climateControl: controlObject.ClimateControl, numberOfBridges: NumberOfBridges) {
        self.brand = brand
        self.year = year
        self.climateControl = climateControl
        self.numberOfBridges = numberOfBridges
    }
}

extension TrunkCar: CustomStringConvertible{
    var description: String{
        return "Create TrunkCar"
    }
}


let productionYear = Calendar.current.dateComponents([.year], from: Date()).year!

var trunkCar: ProtocolCar = TrunkCar(brand: "Renault", year: productionYear, climateControl: .auto, numberOfBridges: .threBridges)
print(trunkCar)
trunkCar.controlObject(.climateControl(.auto))
trunkCar.controlObject(.doors(.open))
trunkCar.controlObject(.windows(.open))
trunkCar.controlObject(.engine(.start))

print(delimiter)
var sedanCar: ProtocolCar = SportCar(brand: "Volvo", year: productionYear, maxTrunkVolume: 100, climateControl: .auto, bodyType: .sedan)
print(sedanCar)
sedanCar.controlObject(.doors(.open))
sedanCar.controlObject(.engine(.start))
sedanCar.controlObject(.engine(.stop))
