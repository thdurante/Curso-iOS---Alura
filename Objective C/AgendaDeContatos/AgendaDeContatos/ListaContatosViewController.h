//
//  ListaContatosViewController.h
//  AgendaDeContatos
//
//  Created by Thiago Durante Pires on 09/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "ViewController.h"


@interface ListaContatosViewController : UITableViewController<ViewControllerDelegate> // O que vem entre <> é a interface que ele implementa, ou melhor, o protocolo que ele assina

@property ContatoDAO *dao;
@property Contato *contatoSelecionado;
@property NSInteger linhaSelecionada;

@end
