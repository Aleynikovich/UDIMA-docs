## Author: Alexander Sebastian Kalis
## Created: 2018-12-23

function kalis_sebastian_alexander_octave()
  
  #Opcion A
  #Crear un algoritmo que permita resolver un sistema de ecuaciones
  #como el que se muestra acontinuaci�n y dibujar la progresi�n de 
  #cada una de las 3 variables de salida X1, X2 y X3 para todos lasposibles
  #valores del par�metro V. Los valores de los par�metros di son los 8 
  #d�gitos de vuestro DNI y elpar�metro d es el valor medio de las 8 cifras 
  #de dicho DNI. Los par�metros V y R var�an de la siguientemanera: V tomar�
  #51 valores equiespaciados entre -10 y 10. R es 1 valor aleatorio entre 0 y 10.
  
  #d1X+d2Y+d3Z=d
  #d4X+d5Y+d6Z=V
  #d7X+d8Y+dZ=R
  
  dv    =   [3 1 0 8 3 5 2 0];                            #El último dígito es 0 ya que el NIE tiene sólo 7 dígitos
  d     =   mean(dv);                                     #Media del DNI
  V     =   linspace(-10,10,51);                          #Vector con los valores de V
  R     =   rand*10;                                      #Numero aleatorio de 0 a 10
  A     =   [dv(1:3); dv(4:6); dv(7:8) d];                #Matriz A
  invA  =   inv(A);                                       #Inversa de A
  XYZ   =   zeros(51,3);                                  #Declaracion de vector vacio XYZ 51x3
  
  for i=1:51                                              #Bucle for va iterando entre los 51 valores de V
      B         =   [d; V(i); R]                          #Matriz B
      XYZ(i,:)  =   invA*B                                #Extraccion de los valores
  end 
  
  ##Gráfica de XYZ en relación a V
  plot(XYZ,V);
  title("XYZ en relación a V");
  legend('X', 'Y', 'Z');
  xlabel("XYZ");
  ylabel("V");

  save kalis_sebastian_alexander_octave.csv XYZ V         #Se guardan los datos en un fichero CSV                             

endfunction
