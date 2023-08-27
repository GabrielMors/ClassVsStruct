//
//  main.swift
//  ClassVsStruct
//
//  Created by Gabriel Mors  on 27/08/23.
//

import Foundation

//MARK: --------------------------------------Classe--------------------------------------

//- MARK: Herança:
//Uma classe pode ser usada como base para outras classes, permitindo a herança de membros e comportamentos.

//- MARK: Tipo de Valor vs. Tipo de Referência:
//As instâncias de classe são tipos de referência, o que significa que são alocadas no heap e manipuladas através de referências.

//- MARK: Semântica de Cópia:
//Quando uma instância de classe é atribuída a outra variável ou passada para uma função, ambas as variáveis apontam para a mesma instância.

//- MARK: Eficiência e Overhead:
//Pode ter um pouco mais de overhead devido à alocação dinâmica de memória e gerenciamento de referência.

//- MARK: Inicialização e Construtores:
//Pode ter construtores personalizados para inicialização e um construtor padrão é gerado automaticamente se nenhum for definido.

//- MARK: Métodos e Propriedades:
//Pode ter métodos e propriedades, permitindo a definição de comportamento adicional.

//- MARK: Nullabilidade:
//As variáveis de classe podem ser nulas (dependendo da linguagem que suporta tipos nulos).

//- MARK: Modificadores de Acesso:
//Pode definir membros com diferentes níveis de acesso, como públicos, privados, protegidos ou internos.

//- MARK: Uso Típico:
//Usada para modelar objetos complexos com estado e comportamento.


//MARK: --------------------------------------Struct--------------------------------------

//- MARK: Herança:
// Não suporta herança. Não é possível herdar de uma struct.

//- MARK: Tipo de Valor vs. Tipo de Referência:
// As instâncias de struct são tipos de valor, alocadas na stack ou inline, e cópias independentes são criadas quando atribuídas a outras variáveis ou passadas para funções.

//- MARK: Semântica de Cópia:
//Quando uma instância de struct é atribuída a outra variável ou passada para uma função, uma cópia completa da struct é feita.

//- MARK: Eficiência e Overhead:
//Tende a ser mais eficiente em termos de uso de memória e velocidade, especialmente para structs pequenas.

//- MARK: Inicialização e Construtores:
//Pode ter construtores personalizados para inicialização, mas não tem um construtor padrão gerado automaticamente.

//- MARK: Métodos e Propriedades:
//Pode ter métodos e propriedades, mas não pode definir métodos mutáveis para instâncias específicas (em algumas linguagens).

//- MARK: Nullabilidade:
//As variáveis de struct não podem ser nulas, uma vez que são tipos de valor.

//- MARK: Modificadores de Acesso:
//Pode ter modificadores de acesso em algumas linguagens, mas geralmente possui uma semântica de acessibilidade mais simples.

//- MARK: Uso Típico:
//Usada para representar tipos de dados pequenos e sem estado, como coordenadas, datas, etc.


//MARK: --------------------------------------Diferenças--------------------------------------

//- MARK: Herança:
// Classes suportam herança, enquanto structs não.

//- MARK: Tipo de Valor vs. Tipo de Referência:
//Classes são tipos de referência, structs são tipos de valor.

//- MARK: Semântica de Cópia:
//Classes criam cópias que ainda apontam para a mesma instância, structs criam cópias independentes.

//- MARK: Eficiência:
//Structs tendem a ser mais eficientes em termos de memória e velocidade.

//- MARK: Inicialização e Construtores:
//Classes têm construtores padrão gerados automaticamente, structs não têm.

//- MARK: Nullabilidade:
//Classes podem ser nulas (em algumas linguagens), structs não podem.

//- MARK: Modificadores de Acesso:
//Classes podem ter modificadores de acesso mais complexos.

//- MARK: Uso Típico:
//Classes para objetos complexos, structs para tipos de dados simples.


// ===========================================//===========================================

//MARK: class

class Carro {
    var modelo: String?
    var ano: Int?

    init(modelo: String?, ano: Int?) {
        self.modelo = modelo
        self.ano = ano
    }

    func printCarro() {
        print("========Class=======\nmodelo: \(self.modelo ?? "")\nano: \(self.ano ?? 0)")
    }
}

var carro: Carro = Carro(modelo: "Chevette", ano: 1989)
print(carro.printCarro())

// ---------------------------------------------------------------------------

//MARK: struct

struct Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func printCoordinates() {
        print("(\(x), \(y))")
    }
}

// Criando uma instância da struct Point
var point1 = Point(x: 2, y: 3)

// Cópia por valor
var point2 = point1
point2.x = 5

point1.printCoordinates()  // Output: (2, 3)
point2.printCoordinates()  // Output: (5, 3)

// -------------------------------------------------------------------------------------

//MARK: Exemplo utilizando a semântica de cópia

//Quando você atribui uma instância de classe a outra variável ou a passa para uma função, na verdade, ambas as variáveis passam a se referir à mesma instância no heap. Isso significa que, se você modificar os dados dentro da instância usando uma variável, as mudanças serão refletidas em todas as outras variáveis que se referem à mesma instância.

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let person1 = Person(name: "Gabriel")
let person2 = person1

person2.name = "Mors"

print(person1.name)  // Output: Mors


//Quando você atribui uma instância de struct a outra variável ou a passa para uma função, uma cópia independente da instância é criada. Isso significa que as mudanças feitas em uma cópia não afetarão outras cópias.

struct Apontar {
    var x: Int
    var y: Int
}

var apontar1 = Apontar(x: 2, y: 3)
var apontar2 = apontar1

apontar2.x = 5

print(point1.x)  // Output: 2
print(point2.x)  // Output: 5


// ------------------------------------------------------------------------------------

//MARK: Nullabilidade

class Pessoa {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var pessoa1: Pessoa? = Pessoa(name: "Alice")  // Usando um opcional para permitir nulo
var pessoa2: Pessoa? = nil  // Nulo também é possível

// Structs não podem ser nulas
struct Point2 {
    var x: Int
    var y: Int
}

var point: Point2? = Point2(x: 2, y: 3)  // Isso causaria um erro, pois Point não é opcional

