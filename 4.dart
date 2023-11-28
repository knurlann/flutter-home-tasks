// Абстрактный класс Character с общими свойствами и методами для всех персонажей
abstract class Character {
  int health;
  int strength;

  Character(this.health, this.strength);

  void attack(Character target) {
    print('$runtimeType с атакой силой $strength атакует $target');
  }

  void defend() {
    print('$runtimeType защищается');
  }

  void interact() {
    print('$runtimeType взаимодействует');
  }
}

// Интерфейс для персонажей, способных сражаться
mixin Fightable {
  void attack(Character target) {
    print('$runtimeType сражается с $target');
  }
}

// Интерфейс для персонажей, способных летать
mixin Flyable {
  void fly() {
    print('$runtimeType летит!');
  }
}

// Интерфейс для персонажей, обладающих магическими способностями
mixin Magical {
  void castSpell() {
    print('$runtimeType колдует заклинание!');
  }
}

// Класс-наследник, представляющий воина
class Warrior extends Character with Fightable {
  Warrior(int health, int strength) : super(health, strength);
}

// Класс-наследник, представляющий мага
class Mage extends Character with Fightable, Magical {
  Mage(int health, int strength) : super(health, strength);
}

// Класс-наследник, представляющий монстра
class Monster extends Character with Fightable {
  Monster(int health, int strength) : super(health, strength);
}

// Класс-наследник, представляющий предмет
class Item {
  String name;
  int weight;

  Item(this.name, this.weight);

  void use() {
    print('$name использован');
  }
}

// Класс-наследник, представляющий мир
class World {
  List<Character> characters = [];
  List<Item> items = [];

  void addCharacter(Character character) {
    characters.add(character);
  }

  void addItem(Item item) {
    items.add(item);
  }
}

void main() {
  // Пример использования созданных классов и объектов
  var warrior = Warrior(100, 20);
  var mage = Mage(80, 15);
  var monster = Monster(150, 25);

  var sword = Item('Меч', 10);
  var potion = Item('Зелье здоровья', 5);

  warrior.attack(monster);
  mage.castSpell();
  monster.defend();

  sword.use();
  potion.use();

  // Применение полиморфизма
  List<Character> characters = [warrior, mage, monster];
  for (var character in characters) {
    character.interact();
  }

  // Применение инкапсуляции
  var world = World();
  world.addCharacter(warrior);
  world.addCharacter(mage);
  world.addCharacter(monster);
  world.addItem(sword);
  world.addItem(potion);
}
