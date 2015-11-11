//
//  ContatoDAO.h
//  AgendaDeContatos
//
//  Created by Thiago Durante Pires on 09/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject

@property NSMutableArray *contatos;

-(void) adicionaContato: (Contato *) contato;
-(NSInteger) total;
-(Contato *) contatoDoIndice: (NSInteger) indice;
+(ContatoDAO *) contatoDAOInstance;
-(void) removeContato: (Contato *) contato;
-(NSInteger) indiceDoContato: (Contato *) contato;

@end
