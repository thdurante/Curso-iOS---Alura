//
//  ViewController.h
//  AgendaDeContatos
//
//  Created by Thiago Durante Pires on 09/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

// Como se fosse uma interface do java, ou seja, quem quer que assine esse "contrato" deve conseguir, de alguma forma tratar as situações propostas nestes dois métodos
// Utilizado basicamente quando alguém precisa receber (e tratar) algum tipo de informação desta entidade
@protocol ViewControllerDelegate <NSObject>

// Por padrão todos os métodos são obrigatórios (@required), se ele fosse opcional seria (@optional)
-(void)contatoAdicionado: (Contato *)contato;
-(void)contatoAtualizado: (Contato *)contato;

@end

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *site;

@property ContatoDAO *dao;
@property Contato *contato;
@property id<ViewControllerDelegate> delegate; // Qualquer entidade que concorde com o protocolo especificado

@end

