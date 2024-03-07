package ejercicio2;

import java.util.ArrayList;
import java.util.Scanner;


public class Menus {
    private Scanner scanner = new Scanner(System.in);
    private GestionDpto gestionDpto;
    private GestionMunic gestionMunic;

    /*
    
    LA CLASE MENU NO SIGUE PRINCIPIOS SOLID POR QUE NO CREO QUE ESTE 
    PROGRAMA SEA ESCALABLE EN UN FUTURO NI QUE LAS PARTES DE ESTE MENU 
    SE PUEDAN DESACOPLAR POR LO QUE EL MENU SUFRE DE UN FUERTE ACOPLE  
    ALA LOGICA , PERO LA LOGICA PUEDE SER ESCALABLE PARA MAS ENTIDADES 
    EN UN FUTURO POR EJEMPLO SE PODRIA AGRAGAR MAS ENTIDADES PERSONA 
    O TAMBIEN SE PODRIA AGREGAR MAS FUNCIONES O OPERACIONES ALOS CICLOS DE 
    GESTION COMO TAL
    
    */
    
    
    public Menus(GestionDpto gestionDpto, GestionMunic gestionMunic) {
        this.gestionDpto = gestionDpto;
        this.gestionMunic = gestionMunic;
    }

    
    /*------------------------------MENU PRINCIPAL----------------------------------*/

    public void menuPrincipal() {
        while (true) {
            System.out.println(
            """
            
            1 - Departamentos
            2 - Municipios
            3 - Salir
            
            """);
            System.out.print("\nIngresa una opcion: ");
            int op = scanner.nextInt();
            scanner.nextLine();

            if (op == 3) {
                break;
            }

            else if (op == 1) {
                this.menuDpto();
            }
            
            else if(op == 2){
                this.menuMunc();
            }
        }
    }

    /*
     * /////////////////////////////////////////////////////////////////////////////
     * ////////////////////////////////////////
    */
     
    /*------------------------------MENU DEPARTAMENTO----------------------------------*/
    
    
      public void menuDpto() {
        while (true) {
            System.out.print(
            """

            1 - Agregar departamento
            2 - Calcular censo de departamento
            3 - Calcular area total de departamento
            4 - Listar gobernador de departamento
            5 - Salir
            
            
            """
            );
            System.out.print("\nIngresa una opcion: ");
            int op = scanner.nextInt();
            scanner.nextLine();

            if (op == 5) {
                System.out.print("\n\nSSALIENDO DEL MENU DEPARTAMENTO\n\nS");
                break;
            }

            else if (op == 1) {
                 
                System.out.print(
                """
                
                   
                VAS A AGREGAR UN NUEVO DEPARTAMENTO A LA BASE DE DATOS
                TEN ENCUENTA QUE PARA ESTO DEBERAS AGREGAR EL NOMBRE DEL DEPARTAMENTO
                SEGUIDO  DE LOS DATOS DEL GOBERNADOR DE ESTE DEPARTAMENTO !!
                
                                              
                """);
                ///////////// nombre del departamento anadir
                System.out.print("\nIngrese el nombre del departamento a anadir:");
                String nombreDpto = scanner.nextLine();
                
                System.out.print("\n\n DEPARTAMENTO AGREGADO EXITOSAMENTE PASO 1/2 \n\n ");
                
                
                //////////// anadir el gobernador
                // nombre gobernador
                System.out.print("\n Ingresa el nombre del gobernador del dpto de " + nombreDpto + " : ");
                String nombreGobernador = scanner.nextLine();
                
                // numero de telefono gobernador
                
                System.out.print("\n Ingresa el numero de telefono del gobernador de " + nombreDpto + " : ");
                String telefonoGobernador = scanner.nextLine();
                
                
                // correo eletronico del gobernador
                
                System.out.print("\n Ingresa el correo eletronico del gobernador de " + nombreDpto + " : ");
                String correoGobernador = scanner.nextLine();
                
                // partido politico gobernador
                
                System.out.print("\n Ingresa el partido politico del gobernador de " + nombreDpto + " : ");
                String partidoGobernador = scanner.nextLine();
                
                try{
                    this.gestionDpto.agregarDepartamento(new Departamento(nombreDpto,new Gobernador(nombreGobernador,telefonoGobernador,correoGobernador,partidoGobernador)));
                    System.out.print("\n\nEL DEPARTAMENTO FUE CREADO EXITOSAMENTE PASO 2/2\n\n");
                }catch(RuntimeException e){
                    System.out.print("\n\n" +e.getMessage()+ "\n\n");
                }
                
            }
            
            else if(op == 2){
                
                //se anadira por teclado el nombre del departamento a censar
                System.out.print("\nIngrese el nombre del departamento a censar:");
                String nombreDpto = scanner.nextLine();
                
                try {
                    int censoPersonas = this.gestionDpto.calcularCenso(nombreDpto);
                    System.out.print("El departamento de " + nombreDpto + "tiene una poblacion aproximada de" + censoPersonas);
                }catch (RuntimeException e){
                    System.out.print("\n\n" +e.getMessage()+ "\n\n");
                }
            }
            
            else if(op == 3){
                //se anadira por teclado el nombre del departamento para allar el area
                System.out.print("\nIngrese el nombre del departamento a allar el area :");
                String nombreDpto = scanner.nextLine();
                
                try {
                    double areaDpto = this.gestionDpto.calcularArea(nombreDpto);
                    System.out.print("\nEl departamento de " + nombreDpto + "tiene un area aproximada de" + areaDpto);
                }catch (RuntimeException e){
                    System.out.print("\n\n" +e.getMessage()+ "\n\n");
                }
                
            }
             
            
            else if(op == 4 ){
                //se anadira por teclado el nombre del departamento para listar su gobernador
                System.out.print("\nIngrese el nombre del departamento para ver su gobernador :");
                String nombreDpto = scanner.nextLine();
                
                try {
                    String areaDpto = this.gestionDpto.listarGobernador(nombreDpto);
                    System.out.print("\n\n" + areaDpto + "\n\n");
                }catch (RuntimeException e){
                    System.out.print("\n\n" +e.getMessage()+ "\n\n");
                }
            
            }
            
            
        }
    }
    
    
    /*
     * /////////////////////////////////////////////////////////////////////////////
     * ////////////////////////////////////////
    */
      
      
       /*------------------------------MENU MUNICIPIO---------------------------------*/
    
    
      public void menuMunc() {
        while (true) {
            System.out.println("""
            1 - Agregar Municipio
            2 - Eliminar Municipio
            3 - Listar Municipios de departamento
            4 - Salir
            """);
            System.out.print("\nIngresa una opcion: ");
            int op = scanner.nextInt();
            scanner.nextLine();

            if (op == 4) {
                System.out.print("\n\nSALIENDO DEL MENU DE MUNICIPIOS\n\n");
                break;
            }

            else if (op == 1) {
                System.out.print(
                """
                
                   
                VAS A AGREGAR UN MUNICIPIO A UN  DEPARTAMENTO A LA BASE DE DATOS
                TEN ENCUENTA QUE PARA ESTO DEBERAS AGREGAR EL NOMBRE DEL DEPARTAMENTO 
                AL CUAL VAS A AGREGAR EL MUNICIPIO
                SEGUIDO  DE LOS DATOS DEL MUNICIPIO !!
                
                                              
                """);
                
                // nombre del departamento al que anadira el municipio
                System.out.print("\nIngrese el nombre del departamento a anadir :");
                String nombreDepartamento = scanner.nextLine();
                
                
                System.out.print("\n\nPASO 1/2\n\n");
                
                // nombre del departamento al que anadira el municipio
                System.out.print("\nIngrese el nombre del Municipio a anadir :");
                String nombreMunicipio = scanner.nextLine();
              
                
                
                
                
                // numero de poblacion que tendra este municipio
                
                System.out.print("\nIngrese el numero de personas que hay en el municipio de " + nombreDepartamento+ " : " );
                int cantidadPersonas = scanner.nextInt();
                scanner.nextLine(); 

                
                // cantidad de area del municipio
                
                System.out.print("\nIngrese el area total del municipio de " + nombreDepartamento+ " : " );
                double areaDepartamento = scanner.nextDouble();
                scanner.nextLine(); 
                
                try {
                    gestionMunic.agregarMunc(nombreDepartamento, new Municipio(nombreMunicipio,cantidadPersonas,areaDepartamento));
                    System.out.print("\n\nEL MUNICIPIO FUE ASIGNADO Y CREADO EXITOSAMENTE PASO 2/2\n\n");
                }catch(RuntimeException e){
                    System.out.print("\n\n" +e.getMessage()+ "\n\n");
                }
                
                
            }
            
            else if(op == 2){
                 /*se anadira por teclado el nombre del departamento
                a buscar el municipio para verificar luego que el municipio que desea eliminar se encuentra
                en el departamento y asi eliminarlo exitosamente*/
                System.out.print("\nIngrese el nombre del departamento en el cual desea buscar el muncipio a eliminar:");
                String nombreDpto = scanner.nextLine();
                
                
                System.out.print("\nIngrese el nombre del municipio que desea eliminar del departamento:");
                String nombreMunc = scanner.nextLine();
                
                try {
                    gestionMunic.eliminarMunicipio(nombreDpto, nombreMunc);
                    System.out.print("\n\nEL MUNICIPIO FUE ELIMNADO EXITOSAMENTE\n\n");

                }catch (RuntimeException e){
                    System.out.print("\n\n" +e.getMessage()+ "\n\n");
                }
            }
            
             
            else if(op == 3){
                //se anadira por teclado el nombre del departamento para listar los municipios de este departamento
                System.out.print("\nIngrese el nombre del departamento para ver sus municipios :");
                String nombreDpto = scanner.nextLine();
                
                try {
                    ArrayList<String> datosMunc = gestionMunic.listarMunicipios(nombreDpto);
                  
                    for(String dMunc : datosMunc ){
                        System.out.print("\n"+dMunc+"\n");
                    }
                    
                    
                }catch (RuntimeException e){
                    System.out.print("\n\n" +e.getMessage()+ "\n\n");
                }
            }
            
            
        }
    }
    
    
    /*
     * /////////////////////////////////////////////////////////////////////////////
     * ////////////////////////////////////////
    */
}
