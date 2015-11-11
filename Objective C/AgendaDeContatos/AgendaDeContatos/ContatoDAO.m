//
//  ContatoDAO.m
//  AgendaDeContatos
//
//  Created by Thiago Durante Pires on 09/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO

static ContatoDAO *defaultDao = nil;

-(id)init{
    self = [super init];
    if(self){
        self.contatos = [NSMutableArray new];
    }
    return self;
}

// Recebe o mais porque é um método de classe, equivalente ao static no java
// Padrão singleton, somente uma instância do dao
+(ContatoDAO *) contatoDAOInstance {
    // Se não tiver uma instância, cria uma nova, se não, retorna
    if(!defaultDao){
        defaultDao = [ContatoDAO new];
    }
    return  defaultDao;
}

-(void) adicionaContato: (Contato *) contato {
    [self.contatos addObject:contato];
}

-(void) removeContato: (Contato *) contato {
    [self.contatos removeObject:contato];
}

-(NSInteger) total{
    return self.contatos.count;
}

-(Contato *) contatoDoIndice: (NSInteger) indice {
    return self.contatos[indice];
}

-(NSInteger) indiceDoContato: (Contato *) contato {
    return [self.contatos indexOfObject:contato];
}

@end
