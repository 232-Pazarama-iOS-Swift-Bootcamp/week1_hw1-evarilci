//
//  main.swift
//  witchergGame
//
//  Created by Eymen Varilci on 25.09.2022.
//

import Foundation

var inBlacksmith = false
var isGame = false
var inVendor = false
var inElixir = false
var inQuest = false


print()
print("Narrator: \"Welcome to this long forgotten village, Witcher. You shall break the curse that once casted so long ago and set the villagers free...\"\n    * type \"start\" to begin your jurney. Remember you can always quit game by typing \"quit\" * ")
print()
// MARK: Witcher struct contains properties that we need to play and finish the game

    struct Witcher {
   
        var items = [String]()
        var coins = 100
        var potions = [String]()
        var health = 100
        var mana = 100

        
        mutating func addItem(_ itemIn: String) {
          
          let item = itemIn
            items.append(item)
        }
        
       mutating func addCoin(_ addQuantiti: Int) {
           let coin = addQuantiti
           self.coins += coin
       }
       mutating func extractCoin(_ extractQuantiti: Int) {
           let coin = extractQuantiti
           self.coins -= coin
       }
        mutating func addPotion(_ potionIn: String) {
            let potion = potionIn
            self.potions.append(potion)
        }
           mutating func decreasHealth(_ healthIn: Int) {
               let health = healthIn
               self.health -= health
           }
           mutating func increaseHealth(_ healthIn: Int) {
               let health = healthIn
               self.health += health
           }
           
           mutating func decreasMana(_ manaIn: Int) {
               let mana = manaIn
               self.mana -= mana
           }
           
           mutating func increaseMana(_ manaIn: Int) {
               let mana = manaIn
               self.mana += mana
           }
           
       }
       var player = Witcher()






enum Items  {
  
   case sword, arrow, armor


    var items : String {
        switch self {
    
        case .sword:

           return "Broad Sword"
        case .arrow:

           return "Elven Bow"
        case .armor:

           return "Body Armor"
        }

    }

}

enum Potions  {
    case mana, health, spirit
   var pots : String {
        switch self {
        case .mana:
           return "Mana pot"
        case .health:
           return "Health pot"
        case .spirit:
           return "Spirit pot"
        }

    }

}
enum Costs {
    case sword, arrow, armor, mana, health, spirit, upgradeSword
    var costs : Int {
        switch self {
        case .sword :
            return 75
        case .arrow :
            return 100
        case .armor :
            return 30
        case .health :
            return 10
        case .mana :
            return 10
        case .spirit :
            return 15
        case .upgradeSword :
            return 50
       }
    }
}


       
    

while let input1 = readLine() {
    guard input1 != "quit" else {
        break
    }
    if input1 == "start" {
        isGame = true
        if isGame {
            print("    * You are at village square. You can visit Vendor to buy weapons by typing \"vendor\", visit Elixir shop to get potions by typing \"elixir\" or you can go blacksmith by typing \"blacksmith\" to have your weaponary upgraded. Now let's go to the Vendor. *")
            print()
            while let input2 = readLine() {
                guard input2 != "quit" else {
                    break
                }
                if input2 == "vendor" {
                    inVendor = true
                    if inVendor {
                        print()
                        print("Vendor: \"Welcome Witcher. You may heard what is going on. We were waiting for you to come and set us free from our destiny. The sun shall shine upon us again! So... Witcher! Here what I got for you. You can buy -- \(Items.sword.items) for \(Costs.sword.costs) silver | \(Items.arrow.items) for \(Costs.arrow.costs) silver | \(Items.armor.items) for \(Costs.armor.costs) silver -- \"\n    * type \"sword\" to buy \(Items.sword.items). You will need this in your first quest! And remember you have 100 silver. By completing quests you earn silver. you can always see your status by typing \"stats\" *")
                        print()
                        
                        while let input3 = readLine() {
                            guard input3 != "quit" else {
                                break
                            }
                            if input3 == "stats" {
                                print("items: \(player.items) - silver: \(player.coins) - potions: \(player.potions)")
                            }
                            
                            if input3 == "\(Items.sword)" || input3 == "\(Items.arrow)" || input3 == "\(Items.armor)" {
                                
                                if player.items.contains(input3) {
                                    print("* You have already got that! *")
                                }
                                if player.coins > Costs.sword.costs || player.coins > Costs.arrow.costs || player.coins > Costs.armor.costs {
                                    player.extractCoin(Costs.sword.costs)
                                    player.addItem(input3)
                                    if input3 == "\(Items.sword)"  {
                                        print("Vendor: Aye! this \(Items.sword.items) will obey you well. ")
                                    }
                                    if input3 == "\(Items.arrow)"  {
                                        print("Vendor: With this \(Items.arrow.items) you will hunt them... Silently.   ")
                                    }
                                    if input3 == "\(Items.armor)"  {
                                        print("Vendor: This \(Items.armor.items) made of tear of a star. Nothing can penetrate it. ")
                                    }
                                } else {
                                    print(" * You don't have enough silver for this")
                                }
                            } else {
                                print("Vendor: \"You can't buy \(input3) from my shop\".")
                            }
                        }
                    } else if input1 == "blacksmith" {
                        inBlacksmith = true
                    } else if input1 == "elixir" {
                        inElixir = true
                    } else if input1 == "quest" {
                        inQuest = true
                    } else {
                        isGame = true
                    }
                }
                
            }
        }
    }
}


