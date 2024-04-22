import UIKit

// Assignment 4

// Each protocol MUST have 1 property and two methods.

// Trailer protocol
protocol Trailer {
    
    var brand: String {get}
    func engineStart()
    func engineStop()
    var engineOn: Bool {get set} // this will toggle the engine on and off
    
}

// WaterSystem protocol
protocol WaterSystem: Camper {
    
    var waterCapacity: Double { get }
    func fillWaterTank()
    func drainWaterTank()
    var button: Bool { get set }
    
}

// ElectricSystem protocol
protocol ElectricitySystem {
    
    var batteryLvl: Double { get }
    func chargeBattery()
    func checkBatteryLvl()
    var powerAdapter: Bool { get set }
    
}

// Create a Camper class, that conforms to TWO(or more) protocols.
class Camper: Trailer, WaterSystem, ElectricitySystem {
    
    let brand: String
    var engineOn: Bool
    var waterCapacity: Double
    var button: Bool
    var batteryLvl: Double
    var powerAdapter: Bool
    
    init() {
        self.engineOn = false
        self.brand = "Dutchman RV"
        self.waterCapacity = 100
        self.button = false
        self.batteryLvl = 100
        self.powerAdapter = false
    }
    
   /*TRAILER*/
    // function that promts for trailer brand
    func trailerBrand() {
        
        print("Your trailer is of \(self.brand) brand! 🚗")
        
    }
    
    // function that starts the engine
    func engineStart() -> Void {
        
        if !engineOn {
            print("The engine is now running! ⚡️")
            self.engineOn = !self.engineOn
            self.batteryLvl -= 20
        } else {
            print("The engine is already runnig! 😠")
        }
        
    }
    
    // function that stops the engine
    func engineStop() -> Void {
        
        if engineOn {
            print("The engine is now off ⛔️")
            self.engineOn = !self.engineOn
        } else {
            print("The engine is already off! 😤")
        }
        
    }
    
    // function checks whether the engine is on or off.
    func engineStatus() -> Void {
        
        print("Engine is now running: \(engineOn)")
        
    }
   /*TRAILER*/
   
    
    
   /*WATER SYSTEM*/
    
    // func displays how much water is in the tank
    func displayWaterCapacity() -> Void {
        
        print("Water level is at: \(waterCapacity) 💧")
        
    }
    
    func fillWaterTank() -> Void {
        
        if self.waterCapacity < 100 && self.button && self.engineOn && self.batteryLvl >= 40 {
            print("The tank has been refilled! 🛢️⬆️")
            self.waterCapacity += 100
            self.batteryLvl -= 40
        } else if self.waterCapacity < 100 && self.button == false && self.batteryLvl >= 40 {
            print("Turn on the shower first!")
        } else if self.waterCapacity == 100 && self.button && self.batteryLvl >= 40 {
            print("The tank is at full capacity!")
        } else {
            print("Let's have a look at what is happening: shower switch - \(self.button), engine - \(self.engineOn), battery - \(self.batteryLvl) 🧐")
        }
        
    }
    
    // you need to have a SHOWER switch to be ON first, in order to be able to drain the tank
    func drainWaterTank() {
        
        if self.waterCapacity == 100 && self.button && self.engineOn && self.batteryLvl >= 20 {
            print("The water is running now! 🛢️⬇️")
            self.waterCapacity -= 100
            self.batteryLvl -= 20
        } else if self.waterCapacity == 100 && !self.button && self.engineOn && self.batteryLvl >= 20 {
            print("Please turn on the shower switch on first! 🔌🚫")
        } else if self.waterCapacity == 100 && self.button && !self.engineOn && self.batteryLvl >= 20 {
            print("Please turn on the engine! ⚡️🚫")
        } else if self.waterCapacity < 100 && self.button && self.engineOn && self.batteryLvl >= 20 {
            print("The water tank is empty! 💧🚫")
        } else if self.waterCapacity == 100 && self.button && self.engineOn && self.batteryLvl < 20 {
            print("Not enough power! Please charge the battery first! ⚡️🚫")
        } else {
            print("Hmmm... Let's see what's up: water lvl - \(self.waterCapacity), shower switch - \(self.button), engine - \(self.engineOn), battery - \(batteryLvl) 🤔")
        }
        
    }

    // this function toggles the SHOWER switch ON and OFF
    func showerSwitch() {
        
        if self.batteryLvl >= 20 {
            self.button = !self.button
            print("The shower switch is now: \(self.button)")
            self.batteryLvl -= 20
        } else {
            print("Not enough power! Please charge the battery first! ⚡️🚫")
        }
    }
    
    // this checks whether the switch is on or off
    func displayShowerSwitch() {
        
        if self.button == true {
            print("The shower switch is ON! 🔌✅")
        } else {
            print("The shower switch is OFF! 🔌⛔️")
        }
        
    }
   /*WATER SYSTEM*/


   /*ELECTRIC SYSTEM*/
    func chargeBattery() {
       
        if self.batteryLvl < 100 && self.engineOn {
            print("The battery is now fully charged! 🔋⬆️")
            self.batteryLvl += 100
        }
        
    }
    
    func checkBatteryLvl() {
        
//        if self.batteryLvl == 100 && self.batteryLvl >= 80 {
//            print("The battery charge is full 🔋😃")
//        } else if self.batteryLvl < 80 && self.batteryLvl >= 50 {
//                print("The battery charge is high 🔋🙂")
//            } else if self.batteryLvl < 50 && self.batteryLvl >= 30 {
//                    print("The battery charge is low 🪫🙁")
//                } else {
//                    print("Please charge the battery now! 🪫😬")
//                }

    let batteryCharge = self.batteryLvl
        
        switch batteryCharge {
            
        case 80...100: print("The battery charge is at \(batteryLvl) % 🔋😃")
            
        case 50...80: print("The battery charge is at \(batteryLvl) % 🔋🙂")
            
        case 30...50: print("The battery charge is at \(batteryLvl) % 🪫🙁")
            
        default:
            print("The battery is only at \(batteryLvl) %! Please charge immediately! 🪫😲")
        }
        
    } //checkBatteryLvl()
   /*ELECTRIC SYSTEM*/
    
} // class Camper


var trailerParkBoys = Camper()
