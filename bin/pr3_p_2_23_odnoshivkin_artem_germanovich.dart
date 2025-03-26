import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:matrices/matrices.dart';

class NavarBattle {
  var matUser = Matrix();
  var matBot = Matrix();
  var matForFight = Matrix();
  NavarBattle(this.matUser, this.matBot, this.matForFight);
  void getLine(Matrix mat) {
    print("     а    б    в    г    д    е    ж    з    к    и");
    for (var i = 0; i < 10; i++) {
      if (i == 9) {
        print("${i + 1}.${mat[i]}");
      } else {
        print("${i + 1}. ${mat[i]}");
      }
    }
    print('-' * 53);
  }

  void getTools(List list) {
    //int len = list.length;
    for (var i = 0; i < list.length; i++) {
      print(list[i]);
    }
  }

  void placement() async {
    var random = Random();
    int min = 1;
    int minSide = 0;
    int max = 11;
    int maxSide = 0;
    String off = '-';
    String side = '';
    int x = 0;
    int y = 0;
    int sideBot = 0;
    var list = [];

    print("Чтобы преждевременно выйти из игры введите: exit");
    off = stdin.readLineSync(encoding: utf8)!;
    if (off == 'exit') {
      return;
    }
    print(
        "${" " * 10}Вам необходимо расставить всего 10 кораблей.\n- 1 четырехпалубный.\n- 2 трехпалубных.\n- 3 двухпалубных.\n- 4 однопалубных.\n\nНачнем с четырехпалубного и так по убыванию.");
    while (true) {
      print("Введите x (горизонтальное положение начала корабля): ");
      x = int.parse(stdin.readLineSync(encoding: utf8)!);
      print("Введите y (вертикальное положение положение начала корабля): ");
      y = int.parse(stdin.readLineSync(encoding: utf8)!);

      if (y - 4 >= 0) {
        if (matUser[y - 1][x - 1] == 0.0 &&
            matUser[y - 2][x - 1] == 0.0 &&
            matUser[y - 3][x - 1] == 0.0 &&
            matUser[y - 4][x - 1] == 0.0) {
          list.add('top');
        }
      }
      if (x + 3 <= 10) {
        if (matUser[y - 1][x - 1] == 0.0 &&
            matUser[y - 1][x] == 0.0 &&
            matUser[y - 1][x + 1] == 0.0 &&
            matUser[y - 1][x + 2] == 0.0) {
          list.add('right');
        }
      }
      if (y + 3 <= 10) {
        if (matUser[y - 1][x - 1] == 0.0 &&
            matUser[y][x - 1] == 0.0 &&
            matUser[y + 1][x - 1] == 0.0 &&
            matUser[y + 2][x - 1] == 0.0) {
          list.add('bottom');
        }
      }
      if (x - 4 >= 0) {
        if (matUser[y - 1][x - 1] == 0.0 &&
            matUser[y - 1][x - 2] == 0.0 &&
            matUser[y - 1][x - 3] == 0.0 &&
            matUser[y - 1][x - 4] == 0.0) {
          list.add('left');
        }
      }
      if (list.isEmpty) {
        print('Выберите другую начальную точку коробля..');
      } else {
        break;
      }
    }
    print(
        "Направления, куда вы можете расположить корабль по выбранной начальной точке: ");
    getTools(list);
    side = stdin.readLineSync(encoding: utf8)!;
    if (side != 'top' &&
        side != 'right' &&
        side != 'bottom' &&
        side != 'left') {
      print("Вы неверно ввели сторону!");
      while (side != 'top' &&
          side != 'right' &&
          side != 'bottom' &&
          side != 'left') {
        side = stdin.readLineSync(encoding: utf8)!;
      }
    }
    if (side == "top") {
      matUser[y - 1][x - 1] = 1.1;
      matUser[y - 2][x - 1] = 1.1;
      matUser[y - 3][x - 1] = 1.1;
      matUser[y - 4][x - 1] = 1.1;
    } else if (side == "right") {
      matUser[y - 1][x - 1] = 1.1;
      matUser[y - 1][x] = 1.1;
      matUser[y - 1][x + 1] = 1.1;
      matUser[y - 1][x + 2] = 1.1;
    } else if (side == "bottom") {
      matUser[y - 1][x - 1] = 1.1;
      matUser[y][x - 1] = 1.1;
      matUser[y + 1][x - 1] = 1.1;
      matUser[y + 2][x - 1] = 1.1;
    } else {
      matUser[y - 1][x - 1] = 1.1;
      matUser[y - 1][x - 2] = 1.1;
      matUser[y - 1][x - 3] = 1.1;
      matUser[y - 1][x - 4] = 1.1;
    }
    getLine(matUser);
    list = [];
    // ---------------------------------------3
    print('Далее необходимо расставить 2 трехпулбника');
    for (var i = 0; i <= 1; i++) {
      while (true) {
        print("Введите x (горизонтальное положение начала корабля): ");
        x = int.parse(stdin.readLineSync(encoding: utf8)!);
        print("Введите y (вертикальное положение положение начала корабля): ");
        y = int.parse(stdin.readLineSync(encoding: utf8)!);
        if (y - 3 >= 0) {
          if (matUser[y - 1][x - 1] == 0.0 &&
              matUser[y - 2][x - 1] == 0.0 &&
              matUser[y - 3][x - 1] == 0.0) {
            list.add('top');
          }
        }
        if (x + 2 <= 10) {
          if (matUser[y - 1][x - 1] == 0.0 &&
              matUser[y - 1][x] == 0.0 &&
              matUser[y - 1][x + 1] == 0.0) {
            list.add('right');
          }
        }
        if (y + 2 <= 10) {
          if (matUser[y - 1][x - 1] == 0.0 &&
              matUser[y][x - 1] == 0.0 &&
              matUser[y + 1][x - 1] == 0.0) {
            list.add('bottom');
          }
        }
        if (x - 3 >= 0) {
          if (matUser[y - 1][x - 1] == 0.0 &&
              matUser[y - 1][x - 2] == 0.0 &&
              matUser[y - 1][x - 3] == 0.0) {
            list.add('left');
          }
        }
        if (list.isEmpty) {
          print('Выберите другую начальную точку коробля..');
        } else {
          break;
        }
      }
      print(
          "Направления, куда вы можете расположить корабль по выбранной начальной точке: ");
      getTools(list);
      side = stdin.readLineSync(encoding: utf8)!;
      if (side != 'top' &&
          side != 'right' &&
          side != 'bottom' &&
          side != 'left') {
        print("Вы неверно ввели сторону!");
        while (side != 'top' &&
            side != 'right' &&
            side != 'bottom' &&
            side != 'left') {
          side = stdin.readLineSync(encoding: utf8)!;
        }
      }
      if (side == "top") {
        matUser[y - 1][x - 1] = 1.1;
        matUser[y - 2][x - 1] = 1.1;
        matUser[y - 3][x - 1] = 1.1;
      } else if (side == "right") {
        matUser[y - 1][x - 1] = 1.1;
        matUser[y - 1][x] = 1.1;
        matUser[y - 1][x + 1] = 1.1;
      } else if (side == "bottom") {
        matUser[y - 1][x - 1] = 1.1;
        matUser[y][x - 1] = 1.1;
        matUser[y + 1][x - 1] = 1.1;
      } else {
        matUser[y - 1][x - 1] = 1.1;
        matUser[y - 1][x - 2] = 1.1;
        matUser[y - 1][x - 3] = 1.1;
      }
      getLine(matUser);
      list = [];
    }
    // ---------------------------------------2
    print('Далее необходимо расставить 3 двухпалубника');
    for (var i = 0; i <= 2; i++) {
      while (true) {
        print("Введите x (горизонтальное положение начала корабля): ");
        x = int.parse(stdin.readLineSync(encoding: utf8)!);
        print("Введите y (вертикальное положение положение начала корабля): ");
        y = int.parse(stdin.readLineSync(encoding: utf8)!);
        if (y - 2 >= 0) {
          if (matUser[y - 1][x - 1] == 0.0 && matUser[y - 2][x - 1] == 0.0) {
            list.add('top');
          }
        }
        if (x + 1 <= 10) {
          if (matUser[y - 1][x - 1] == 0.0 && matUser[y - 1][x] == 0.0) {
            list.add('right');
          }
        }
        if (y + 1 <= 10) {
          if (matUser[y - 1][x - 1] == 0.0 && matUser[y][x - 1] == 0.0) {
            list.add('bottom');
          }
        }
        if (x - 2 >= 0) {
          if (matUser[y - 1][x - 1] == 0.0 && matUser[y - 1][x - 2] == 0.0) {
            list.add('left');
          }
        }
        if (list.isEmpty) {
          print('Выберите другую начальную точку коробля..');
        } else {
          break;
        }
      }
      print(
          "Направления, куда вы можете расположить корабль по выбранной начальной точке: ");
      getTools(list);
      side = stdin.readLineSync(encoding: utf8)!;
      if (side != 'top' &&
          side != 'right' &&
          side != 'bottom' &&
          side != 'left') {
        print("Вы неверно ввели сторону!");
        while (side != 'top' &&
            side != 'right' &&
            side != 'bottom' &&
            side != 'left') {
          side = stdin.readLineSync(encoding: utf8)!;
        }
      }
      if (side == "top") {
        matUser[y - 1][x - 1] = 1.1;
        matUser[y - 2][x - 1] = 1.1;
      } else if (side == "right") {
        matUser[y - 1][x - 1] = 1.1;
        matUser[y - 1][x] = 1.1;
      } else if (side == "bottom") {
        matUser[y - 1][x - 1] = 1.1;
        matUser[y][x - 1] = 1.1;
      } else {
        matUser[y - 1][x - 1] = 1.1;
        matUser[y - 1][x - 2] = 1.1;
      }
      getLine(matUser);
      list = [];
    }
    // ---------------------------------------1
    print('Далее необходимо расставить 4 однопалубника');
    for (var i = 0; i <= 3; i++) {
      while (true) {
        print("Введите x (горизонтальное положение начала корабля): ");
        x = int.parse(stdin.readLineSync(encoding: utf8)!);
        print("Введите y (вертикальное положение положение начала корабля): ");
        y = int.parse(stdin.readLineSync(encoding: utf8)!);
        if (y - 1 >= 0) {
          if (matUser[y - 1][x - 1] == 0.0) {
            list.add('top');
          }
        }
        if (x <= 10) {
          if (matUser[y - 1][x - 1] == 0.0) {
            list.add('right');
          }
        }
        if (y <= 10) {
          if (matUser[y - 1][x - 1] == 0.0) {
            list.add('bottom');
          }
        }
        if (x - 1 >= 0) {
          if (matUser[y - 1][x - 1] == 0.0) {
            list.add('left');
          }
        }
        if (list.isEmpty) {
          print('Выберите другую начальную точку коробля..');
        } else {
          break;
        }
      }
      print(
          "Направления, куда вы можете расположить корабль по выбранной начальной точке: ");
      getTools(list);
      side = stdin.readLineSync(encoding: utf8)!;
      if (side != 'top' &&
          side != 'right' &&
          side != 'bottom' &&
          side != 'left') {
        print("Вы неверно ввели сторону!");
        while (side != 'top' &&
            side != 'right' &&
            side != 'bottom' &&
            side != 'left') {
          side = stdin.readLineSync(encoding: utf8)!;
        }
      }
      if (side == "top") {
        matUser[y - 1][x - 1] = 1.1;
      } else if (side == "right") {
        matUser[y - 1][x - 1] = 1.1;
      } else if (side == "bottom") {
        matUser[y - 1][x - 1] = 1.1;
      } else {
        matUser[y - 1][x - 1] = 1.1;
      }
      getLine(matUser);
      list = [];
    }
    // ---------------------------------------
    // расстановка кораблей бота
    // ---------------------------------------4
    while (true) {
      x = random.nextInt(max - min) + min;
      y = random.nextInt(max - min) + min;
      if (y - 4 >= 0) {
        if (matBot[y - 1][x - 1] == 0.0 &&
            matBot[y - 2][x - 1] == 0.0 &&
            matBot[y - 3][x - 1] == 0.0 &&
            matBot[y - 4][x - 1] == 0.0) {
          list.add('top');
        }
      }
      if (x + 3 <= 10) {
        if (matBot[y - 1][x - 1] == 0.0 &&
            matBot[y - 1][x] == 0.0 &&
            matBot[y - 1][x + 1] == 0.0 &&
            matBot[y - 1][x + 2] == 0.0) {
          list.add('right');
        }
      }
      if (y + 3 <= 10) {
        if (matBot[y - 1][x - 1] == 0.0 &&
            matBot[y][x - 1] == 0.0 &&
            matBot[y + 1][x - 1] == 0.0 &&
            matBot[y + 2][x - 1] == 0.0) {
          list.add('bottom');
        }
      }
      if (x - 4 >= 0) {
        if (matBot[y - 1][x - 1] == 0.0 &&
            matBot[y - 1][x - 2] == 0.0 &&
            matBot[y - 1][x - 3] == 0.0 &&
            matBot[y - 1][x - 4] == 0.0) {
          list.add('left');
        }
      }
      if (list.isEmpty) {
      } else {
        break;
      }
    }
    maxSide = list.length;
    sideBot = random.nextInt(maxSide - minSide) + minSide;
    if (list[sideBot] == "top") {
      matBot[y - 1][x - 1] = 1.1;
      matBot[y - 2][x - 1] = 1.1;
      matBot[y - 3][x - 1] = 1.1;
      matBot[y - 4][x - 1] = 1.1;
    } else if (list[sideBot] == "right") {
      matBot[y - 1][x - 1] = 1.1;
      matBot[y - 1][x] = 1.1;
      matBot[y - 1][x + 1] = 1.1;
      matBot[y - 1][x + 2] = 1.1;
    } else if (list[sideBot] == "bottom") {
      matBot[y - 1][x - 1] = 1.1;
      matBot[y][x - 1] = 1.1;
      matBot[y + 1][x - 1] = 1.1;
      matBot[y + 2][x - 1] = 1.1;
    } else {
      matBot[y - 1][x - 1] = 1.1;
      matBot[y - 1][x - 2] = 1.1;
      matBot[y - 1][x - 3] = 1.1;
      matBot[y - 1][x - 4] = 1.1;
    }
    list = [];
    // ---------------------------------------3
    for (var i = 0; i <= 1; i++) {
      while (true) {
        x = random.nextInt(max - min) + min;
        y = random.nextInt(max - min) + min;
        if (y - 3 >= 0) {
          if (matBot[y - 1][x - 1] == 0.0 &&
              matBot[y - 2][x - 1] == 0.0 &&
              matBot[y - 3][x - 1] == 0.0) {
            list.add('top');
          }
        }
        if (x + 2 <= 10) {
          if (matBot[y - 1][x - 1] == 0.0 &&
              matBot[y - 1][x] == 0.0 &&
              matBot[y - 1][x + 1] == 0.0) {
            list.add('right');
          }
        }
        if (y + 2 <= 10) {
          if (matBot[y - 1][x - 1] == 0.0 &&
              matBot[y][x - 1] == 0.0 &&
              matBot[y + 1][x - 1] == 0.0) {
            list.add('bottom');
          }
        }
        if (x - 3 >= 0) {
          if (matBot[y - 1][x - 1] == 0.0 &&
              matBot[y - 1][x - 2] == 0.0 &&
              matBot[y - 1][x - 3] == 0.0) {
            list.add('left');
          }
        }
        if (list.isEmpty) {
        } else {
          break;
        }
      }
      maxSide = list.length;
      sideBot = random.nextInt(maxSide - minSide) + minSide;
      if (list[sideBot] == "top") {
        matBot[y - 1][x - 1] = 1.1;
        matBot[y - 2][x - 1] = 1.1;
        matBot[y - 3][x - 1] = 1.1;
      } else if (list[sideBot] == "right") {
        matBot[y - 1][x - 1] = 1.1;
        matBot[y - 1][x] = 1.1;
        matBot[y - 1][x + 1] = 1.1;
      } else if (list[sideBot] == "bottom") {
        matBot[y - 1][x - 1] = 1.1;
        matBot[y][x - 1] = 1.1;
        matBot[y + 1][x - 1] = 1.1;
      } else {
        matBot[y - 1][x - 1] = 1.1;
        matBot[y - 1][x - 2] = 1.1;
        matBot[y - 1][x - 3] = 1.1;
      }
      list = [];
    }
    // ---------------------------------------2
    for (var i = 0; i <= 2; i++) {
      while (true) {
        x = random.nextInt(max - min) + min;
        y = random.nextInt(max - min) + min;
        if (y - 2 >= 0) {
          if (matBot[y - 1][x - 1] == 0.0 && matBot[y - 2][x - 1] == 0.0) {
            list.add('top');
          }
        }
        if (x + 1 <= 10) {
          if (matBot[y - 1][x - 1] == 0.0 && matBot[y - 1][x] == 0.0) {
            list.add('right');
          }
        }
        if (y + 1 <= 10) {
          if (matBot[y - 1][x - 1] == 0.0 && matBot[y][x - 1] == 0.0) {
            list.add('bottom');
          }
        }
        if (x - 2 >= 0) {
          if (matBot[y - 1][x - 1] == 0.0 && matBot[y - 1][x - 2] == 0.0) {
            list.add('left');
          }
        }
        if (list.isEmpty) {
        } else {
          break;
        }
      }
      maxSide = list.length;
      sideBot = random.nextInt(maxSide - minSide) + minSide;
      if (list[sideBot] == "top") {
        matBot[y - 1][x - 1] = 1.1;
        matBot[y - 2][x - 1] = 1.1;
      } else if (list[sideBot] == "right") {
        matBot[y - 1][x - 1] = 1.1;
        matBot[y - 1][x] = 1.1;
      } else if (list[sideBot] == "bottom") {
        matBot[y - 1][x - 1] = 1.1;
        matBot[y][x - 1] = 1.1;
      } else {
        matBot[y - 1][x - 1] = 1.1;
        matBot[y - 1][x - 2] = 1.1;
      }
      list = [];
    }
    // ---------------------------------------1
    for (var i = 0; i <= 3; i++) {
      while (true) {
        x = random.nextInt(max - min) + min;
        y = random.nextInt(max - min) + min;
        if (y - 1 >= 0) {
          if (matBot[y - 1][x - 1] == 0.0) {
            list.add('top');
          }
        }
        if (x <= 10) {
          if (matBot[y - 1][x - 1] == 0.0) {
            list.add('right');
          }
        }
        if (y <= 10) {
          if (matBot[y - 1][x - 1] == 0.0) {
            list.add('bottom');
          }
        }
        if (x - 1 >= 0) {
          if (matBot[y - 1][x - 1] == 0.0) {
            list.add('left');
          }
        }
        if (list.isEmpty) {
        } else {
          break;
        }
      }
      maxSide = list.length;
      sideBot = random.nextInt(maxSide - minSide) + minSide;
      if (list[sideBot] == "top") {
        matBot[y - 1][x - 1] = 1.1;
      } else if (list[sideBot] == "right") {
        matBot[y - 1][x - 1] = 1.1;
      } else if (list[sideBot] == "bottom") {
        matBot[y - 1][x - 1] = 1.1;
      } else {
        matBot[y - 1][x - 1] = 1.1;
      }
      list = [];
    }
  }

  void fight() async {
    var random = Random();
    int x;
    int y;
    int? xEnemy = 0;
    int yEnemy = 0;
    int minEnemy = 1;
    int maxEnemy = 11;
    int healthEnemy = 20;
    int healthUser = 20;
    print(
        "Начинается бой!\nУсловные знаки:\n7.7 - корабль подбит\n5.5 - промах\n 0.0 - неизвестная клетка.\nВы стреляете первым!");
    while (healthUser != 0 && healthEnemy != 0) {
      print("Введите x (горизонтальное положение корабля противника): ");
      x = int.parse(stdin.readLineSync(encoding: utf8)!);
      if (x < 1 || x > 10) {
        print("Неверный диапозон.");
        while (x < 1 || x > 10) {
          x = int.parse(stdin.readLineSync(encoding: utf8)!);
        }
      }
      print("Введите y (вертикальное положение положение начала противника): ");
      y = int.parse(stdin.readLineSync(encoding: utf8)!);
      if (y < 1 || y > 10) {
        print("Неверный диапозон.");
        while (y < 1 || y > 10) {
          y = int.parse(stdin.readLineSync(encoding: utf8)!);
        }
      }
      if (matBot[y - 1][x - 1] == 1.1) {
        matForFight[y - 1][x - 1] = 7.7;
        healthEnemy -= 1;
        print("Вы попали!");
      } else if (matBot[y - 1][x - 1] == 0.0) {
        matForFight[y - 1][x - 1] = 5.5;
      } else if (matBot[y - 1][x - 1] == 5.5 || matUser[y - 1][x - 1] == 7.7) {}
      getLine(matForFight);
      xEnemy = random.nextInt(maxEnemy - minEnemy) + minEnemy;
      yEnemy = random.nextInt(maxEnemy - minEnemy) + minEnemy;
      if (matUser[yEnemy - 1][xEnemy - 1] == 1.1) {
        matUser[yEnemy - 1][xEnemy - 1] = 7.7;
        healthUser -= 1;
      } else if (matUser[yEnemy - 1][xEnemy - 1] == 5.5 ||
          matUser[yEnemy - 1][xEnemy - 1] == 7.7) {
      } else {
        matUser[yEnemy - 1][xEnemy - 1] = 5.5;
      }
      getLine(matUser);
    }
    if (healthUser == 0) {
      print("Вы проиграли");
    } else {
      print("Вы победили");
    }
  }
}

void main() {
  var matUser = Matrix.zero(10, 10);
  var matBot = Matrix.zero(10, 10);
  var matForFight = Matrix.zero(10, 10);
  NavarBattle one = NavarBattle(matUser, matBot, matForFight);
  one.getLine(matUser);
  one.placement();
  one.fight();
}
