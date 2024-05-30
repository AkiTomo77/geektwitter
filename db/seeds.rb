# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# プレイヤーの作成
players = Player.create([
  { name: "さとこ", attack: 10, defense: 5},
  { name: "あきねん", attack: 15, defense: 10},
  { name: "りょう", attack: 8, defense: 3}
])

# 装備の作成
coordinates = Coordinate.create([
  { name: "めがねんのメガネ", attack: 89, defense: 78},
  { name: "しゃつねんのシャツ", attack: 40, defense: 99},
  { name: "しんちゃんの赤い車", attack: 50, defense: 50},
  { name: "さとこーキャップ", attack: 1, defense: 1},
  { name: "さとこーのびくドンズボン", attack: 80, defense: 2000},
  { name: "さとこーの穴あきズボン", attack: 100, defense: -50}
])

# プレイヤーに装備を割り当てる
players[0].coordinates << coordinates[0]  # HeroにSwordを装備
players[0].coordinates << coordinates[1]  # HeroにShieldを装備
players[0].coordinates << coordinates[4]  # HeroにShoesを装備

players[1].coordinates << coordinates[0]  # WarriorにSwordを装備
players[1].coordinates << coordinates[2]  # WarriorにHelmetを装備
players[1].coordinates << coordinates[5]  # WarriorにShirtを装備

players[2].coordinates << coordinates[3]  # MageにBootsを装備
players[2].coordinates << coordinates[4]  # MageにShoesを装備
players[2].coordinates << coordinates[5]  # MageにShirtを装備