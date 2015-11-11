//
//  Contato.m
//  AgendaDeContatos
//
//  Created by Thiago Durante Pires on 09/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description {
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ E-mail: %@ Telefone: %@ Endereço: %@ Site: %@", self.nome, self.email, self.telefone, self.endereco, self.site];
    return dados;
}

@end
