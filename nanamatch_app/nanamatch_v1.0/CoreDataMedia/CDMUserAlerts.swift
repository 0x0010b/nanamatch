//
//  CDMUserAlerts.swift
//  RapiDocMedicos
//
//  Created by Kenyi Rodriguez on 17/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

public class CDMUserAlerts: NSObject {

    
    typealias acctionSheetCancelar = (()->Void)?
    
    public class func mostrarActionSheetConVariosBotones(conTitulo titulo : String?, conMensaje mensaje : String, conNombreBotones arrayBotones : [String], conBotonCancelar botonCancelar : String, enController controller : UIViewController, conCompletionBotones completion : @escaping(_ btnIndex : Int) -> Void, conCompletionCancelar completionCancelar : (() -> ())?) {
        
        let alertaController = UIAlertController(title: titulo, message: mensaje, preferredStyle: .actionSheet)
        
        for tituloBoton in arrayBotones {
            
            let accionBtn = UIAlertAction(title: tituloBoton, style: .default, handler: { (action) in
                completion(arrayBotones.index(of: tituloBoton)!)
            })
            
            alertaController.addAction(accionBtn)
        }
        
        let accionBtn = UIAlertAction(title: botonCancelar, style: .cancel, handler: { (action) in
            if completionCancelar != nil {
                completionCancelar!()
            }
        })
        
        alertaController.addAction(accionBtn)
        controller.present(alertaController, animated: true, completion: nil)
    }
    
    
    public class func mostrarAlertaConTitulo(titulo : String, conMensaje mensaje : String?, conNombreDeBotonCancelar cancelar : String, enControlador controller : UIViewController, conCompletion completion : (() -> Void)?){
        
        let alertaController = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        
        let accionCancelar = UIAlertAction(title: cancelar, style: UIAlertActionStyle.cancel) { (action : UIAlertAction) in
            
            completion?()
        }
        
        alertaController.addAction(accionCancelar)
        controller.present(alertaController, animated: true, completion: nil)
    }
    
    
    public class func mostrarAlertaConTitulo(titulo : String, conMensaje mensaje : String?, conNombreDeBotonCancelar cancelar : String, conNombreDeBotonAceptar aceptar : String, enControlador controller : UIViewController?, conCompletionCancelar completionCancelar : (() -> Void)?, conCompletionAceptar completionAceptar : (() -> Void)?){
        
        let alertaController = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        
        let accionCancelar = UIAlertAction(title: cancelar, style: .cancel) { (action : UIAlertAction) in
            
            completionCancelar?()
        }
        
        alertaController.addAction(accionCancelar)
        
        
        
        let accionAceptar = UIAlertAction(title: aceptar, style: .default) { (action : UIAlertAction) in
            
            completionAceptar?()
        }
        
        alertaController.addAction(accionAceptar)
        controller!.present(alertaController, animated: true, completion: nil)

    }
    
}
