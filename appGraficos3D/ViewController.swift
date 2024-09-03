//
//  ViewController.swift
//  appGraficos3D
//
//  Created by braulio on 05/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//


import UIKit
import SceneKit

class ViewController: UIViewController {

    public var selectedColorLuz: CGColor = UIColor.white.cgColor // Color por defecto
    
    public var selectedColorPlano: CGColor = UIColor.yellow.cgColor // Color por defecto

    public var selectedColorFigura: CGColor?
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var sliderIntensidadLuz: UISlider!
    
    @IBOutlet weak var segmentoLuces: UISegmentedControl!
    
    
    @IBOutlet weak var segmentoFiguras: UISegmentedControl!
    
    
    
    
    
    @IBOutlet weak var sliderLuzX: UISlider!
    
    @IBOutlet weak var sliderLuzY: UISlider!
    
    @IBOutlet weak var sliderLuzZ: UISlider!
    
    
    
    @IBOutlet weak var sliderCamaraX: UISlider!
    
    
    @IBOutlet weak var sliderCamaraY: UISlider!
    
    
    @IBOutlet weak var sliderCameraZ: UISlider!
    
    
    
    @IBOutlet weak var sliderInnerAngle: UISlider!
    
    @IBOutlet weak var sliderOuterAngle: UISlider!
    
    
    @IBOutlet weak var sliderFiguraX: UISlider!
    
    
    @IBOutlet weak var sliderFiguraY: UISlider!
    
    @IBOutlet weak var sliderFiguraZ: UISlider!
    
    
    var tipoLuz: String?
    var figuraGeometrica: SCNGeometry?
    var figuraNodo: SCNNode?
    var figuraConstraint: SCNLookAtConstraint?
    var figuraMaterial: SCNMaterial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tipoLuz = "ambient"
        selectedColorFigura = UIColor.cyan.cgColor
        figuraGeometrica = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
        figuraNodo = SCNNode(geometry: SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1))
        figuraConstraint = SCNLookAtConstraint(target: SCNNode())
        figuraMaterial = SCNMaterial()
        dibujaObjeto3D()
    }
    
    //AGREGAR LOS OTROS SLIDERS DE LUZ

    @IBAction func sliderLuzX(_ sender: UISlider) {
        sliderLuzX.value = sender.value
        dibujaObjeto3D()
    }
    
    @IBAction func sliderLuzY(_ sender: UISlider) {
        sliderLuzY.value = sender.value
        dibujaObjeto3D()
    }
    
    
    @IBAction func sliderLuzZ(_ sender: UISlider) {
        sliderLuzZ.value = sender.value
        dibujaObjeto3D()

    }
    
    
    //sliders para mover la figura
    
    
    @IBAction func sliderFiguraX(_ sender: UISlider) {
        sliderFiguraX.value = sender.value
        dibujaObjeto3D()
    }
    
    
    @IBAction func sliderFiguraY(_ sender: UISlider) {
        sliderFiguraY.value = sender.value
        dibujaObjeto3D()
    }
    
    
    @IBAction func sliderFiguraZ(_ sender: UISlider) {
        sliderFiguraZ.value = sender.value
        dibujaObjeto3D()
    }
    
    
    
    //AGREGAR LOS OTROS SLIDERS DE CAMARA
    @IBAction func sliderCamaraX(_ sender: UISlider) {
        sliderCamaraX.value = sender.value
        dibujaObjeto3D()
    }
    
    
    @IBAction func sliderCameraY(_ sender: UISlider) {
        sliderCamaraY.value = sender.value
        dibujaObjeto3D()
    }
    
    
    @IBAction func sliderCameraZ(_ sender: UISlider) {
        sliderCameraZ.value = sender.value
        dibujaObjeto3D()
    }
    
    
    //Slider para los angulos interno y externo
    
    
    @IBAction func sliderInnerAngle(_ sender: UISlider) {
        sliderInnerAngle.value = sender.value
        dibujaObjeto3D()
    }
    
    
    @IBAction func sliderOuterAngle(_ sender: UISlider) {
        sliderOuterAngle.value = sender.value
        dibujaObjeto3D()
    }
    
    //slider intensidad luz
    
    
    @IBAction func sliderIntensidadLuz(_ sender: UISlider) {
        sliderIntensidadLuz.value = sender.value
        dibujaObjeto3D()
    }
    
    
    @IBAction func seleccionarColorLuz(_ sender: UIButton) {
          
          let alertController = UIAlertController(title: "Selecciona un color para la luz", message: nil, preferredStyle: .actionSheet)

                  let colors: [(String, CGColor)] = [
                      ("Rojo", UIColor.red.cgColor),
                      ("Verde", UIColor.green.cgColor),
                      ("Azul", UIColor.blue.cgColor),
                      ("Negro", UIColor.black.cgColor),
                      ("Amarillo", UIColor.yellow.cgColor),
                      ("Naranja", UIColor.orange.cgColor),
                      ("Púrpura", UIColor.purple.cgColor)
                  ]

                  for (name, color) in colors {
                      let action = UIAlertAction(title: name, style: .default) { _ in
                         self.selectedColorLuz = color
                        self.dibujaObjeto3D()
                      }
                      alertController.addAction(action)
                  }

                  let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                  alertController.addAction(cancelAction)

                  present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func seleccionarColorPlano(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Selecciona un color para el Plano", message: nil, preferredStyle: .actionSheet)

        let colors: [(String, CGColor)] = [
            ("Rojo", UIColor.red.cgColor),
            ("Verde", UIColor.green.cgColor),
            ("Azul", UIColor.blue.cgColor),
            ("Negro", UIColor.black.cgColor),
            ("Amarillo", UIColor.yellow.cgColor),
            ("Naranja", UIColor.orange.cgColor),
            ("Púrpura", UIColor.purple.cgColor)
        ]

        for (name, color) in colors {
            let action = UIAlertAction(title: name, style: .default) { _ in
               self.selectedColorPlano = color
              self.dibujaObjeto3D()
            }
            alertController.addAction(action)
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    
          
    
    @IBAction func seleccionarColorFigura(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Selecciona un color para la figura", message: nil, preferredStyle: .actionSheet)

        let colors: [(String, CGColor)] = [
            ("Rojo", UIColor.red.cgColor),
            ("Verde", UIColor.green.cgColor),
            ("Azul", UIColor.blue.cgColor),
            ("Negro", UIColor.black.cgColor),
            ("Amarillo", UIColor.yellow.cgColor),
            ("Naranja", UIColor.orange.cgColor),
            ("Púrpura", UIColor.purple.cgColor),
            ("Cyan", UIColor.cyan.cgColor)
        ]

        for (name, color) in colors {
            let action = UIAlertAction(title: name, style: .default) { _ in
               self.selectedColorFigura = color
              self.dibujaObjeto3D()
            }
            alertController.addAction(action)
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    
    @IBAction func segmentoTipoFigura(_ sender: UISegmentedControl) {
        let indice : Int = segmentoFiguras.selectedSegmentIndex
        switch indice {
        case 0:
            figuraGeometrica = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
            break;
        case 1:
            figuraGeometrica = SCNSphere(radius: 0.5)
 
            break;
         case 2:
             figuraGeometrica = SCNPyramid(width: 1.0, height: 1.0, length: 1.0)
         case 3:
             figuraGeometrica = SCNCone(topRadius: 0.5, bottomRadius: 1.0, height: 1.0)
         case 4:
             figuraGeometrica = SCNCylinder(radius: 0.5, height: 1.0)
         case 5:
             figuraGeometrica = SCNCapsule(capRadius: 0.5, height: 1.0)
         case 6:
             figuraGeometrica = SCNTube(innerRadius: 0.3, outerRadius: 0.5, height: 1.0)
         case 7:
             figuraGeometrica = SCNTorus(ringRadius: 1.0, pipeRadius: 0.3)
        default:
            figuraGeometrica = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
        }
        figuraNodo!.geometry = figuraGeometrica
        figuraConstraint!.target = figuraNodo
        dibujaObjeto3D()
    }
    

    
    
    @IBAction func segmentoTipoLuz(_ sender: UISegmentedControl) {
        let indice : Int = segmentoLuces.selectedSegmentIndex
             switch indice {
             case 0:
                 tipoLuz = "ambient"
                 break;
             case 1:
                 tipoLuz = "directional"
                 break;
             case 2:
                 tipoLuz = "omni"
                 break;
             case 3:
                 tipoLuz = "spot"
                 break;
             //AGREGAR LOS TRES TIPOS DE LUZ QUE FALTAN
                case 4:
                    tipoLuz = "area"
                case 5:
                    tipoLuz = "probe"
                case 6:
                    tipoLuz = "IES"
             default:
                 tipoLuz = "directional"
             }
             dibujaObjeto3D()
    }
    
    
    
    func dibujaObjeto3D(){
        let sceneView = SCNView(frame: self.imageView.frame)
        self.imageView.addSubview(sceneView)
        //CREAMOS LA ESCENA
        let scene = SCNScene()
        sceneView.scene = scene
        //creamos la camara
        let camara = SCNCamera()
        let camaraNodo = SCNNode()
        camaraNodo.camera = camara
        //VISTA DE FRENTE
        camaraNodo.position = SCNVector3(x: self.sliderCamaraX.value, y: self.sliderCamaraY.value, z: self.sliderCameraZ.value)
        //CREAMOS LA LUZ PARA MANEJAR DIFERENTES TIPOS
        
        let luz = SCNLight()
        //luz.type = SCNLight.LightType.IES
        luz.type = SCNLight.LightType(rawValue: tipoLuz!)
        
        //HACER INTERACTIVO LOS MOVIMIENTOS DE LOS ANGULOS
        
        luz.spotInnerAngle = CGFloat(self.sliderInnerAngle.value)
        luz.spotOuterAngle = CGFloat(self.sliderOuterAngle.value)
        
        luz.castsShadow = true;
        luz.color = selectedColorLuz
        luz.intensity = CGFloat(self.sliderIntensidadLuz.value)
        
        //CREAMOS NODO PARA LA LUZ
        let luzNodo = SCNNode()
        luzNodo.light = luz
        luzNodo.position = SCNVector3(x: sliderLuzX.value, y: sliderLuzY.value, z: sliderLuzZ.value)
        
        //Objeto Cubo
        //let geometriaCubo = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
        
        //let cuboNodo = SCNNode(geometry: geometriaCubo)
        
        //let constraint = SCNLookAtConstraint(target: cuboNodo)
        //constraint.isGimbalLockEnabled = true
        figuraConstraint!.isGimbalLockEnabled = true
        //figuraNodo?.position = SCNVector3()
       // camaraNodo.constraints = [constraint]
        camaraNodo.constraints = [figuraConstraint!]
        luzNodo.constraints = [figuraConstraint!]
        
        
        //PLANO
        let planoGeometria = SCNPlane(width: 50/3, height: 50/3)
        let planoNodo = SCNNode(geometry: planoGeometria)
        
        planoNodo.eulerAngles = SCNVector3(GLKMathDegreesToRadians(-90),0.0,0.0)
        //VALORES DE LOS ANGULOS INTERACTIVOS
        
        planoNodo.position = SCNVector3(x: 0.0, y: -0.5, z: 0.0)
        
        //COLOR DEL CUBO
       // let materialCubo = SCNMaterial()
       // materialCubo.diffuse.contents = UIColor.systemCyan
        figuraMaterial!.diffuse.contents = selectedColorFigura
        figuraMaterial!.metalness.contents = selectedColorFigura
        figuraGeometrica!.materials = [figuraMaterial!]
       //MOVER LA FIGURA CON SLIDERS
        figuraNodo!.position = SCNVector3(x: self.sliderFiguraX.value, y: self.sliderFiguraY.value, z: self.sliderFiguraZ.value)
        
        
        //DIBUJAR UNA ESFERA
        //let sphereGeometry = SCNSphere(radius: 0.5)
        //let sphereNode = SCNNode(geometry: sphereGeometry)
        //sphereGeometry.firstMaterial?.diffuse.contents = UIColor.green
        //sphereNode.position = SCNVector3(x: 2.0, y: 0, z: 0)
        
        //COLOR Y MATERIAL PLANO
        let materialPlano = SCNMaterial()
        materialPlano.diffuse.contents = selectedColorPlano
        planoGeometria.materials = [materialPlano]
        
        //AGREGAMOS LOS NODOS
        scene.rootNode.addChildNode(luzNodo)
        scene.rootNode.addChildNode(camaraNodo)
        scene.rootNode.addChildNode(figuraNodo!)
       // scene.rootNode.addChildNode(sphereNode)
        scene.rootNode.addChildNode(planoNodo)
        
        
    }

}


