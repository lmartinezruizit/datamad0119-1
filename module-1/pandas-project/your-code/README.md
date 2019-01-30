# PANDAS PROJECT 

## IMPORTING

Para llevar a cabo la importación de los dastos, he descargado el data set en un fichero con formato csv y mediante pandas, he obtenido los datos usando la funcion **red_to_csv**.

Además, he importado una serie de librerias que he necesitado a lo largo del proyecto, estas librerias son los siguientes:
* pandas
* pygal.world.maps (usada para crear gráficos con el mapa del mundo)
* pygal (usada para crear gráficos)
* SVG, HTML (usada para mostrar los gráficos)
* statistics (usada para hacer operaciones como la mediana)


## CLEANING & MANIPULATION

Una vez importado los datos, he realizado una limpieza de los datos, ya que habían bastantes que no me resultaban significativos. Para ello he eliminado una serie de columnas, cuyos identificadores son los siguientes: ['Name', 'Case Number.1', 'Case Number.2', 'original order', 'Unnamed: 22','Unnamed: 23', 'pdf', 'href formula', 'href']

Por otro lado, he modificado los valores nulos de las columnas de "Species" y modificado los valores de las columnas "Fatal (Y/N)" y "Sex" debido a que para el mismo valor, se habian introducido caracteres adicionales. Además, he eliminado una serie de valores para quedarme con unos datos más específicos, como los de los paiseses donde se han producido un número de ataques bastante reducido y como los ataques producidos antes del año 1900.

## EXPORTING

Además de exportar los datos con los que he trabajado a un fichero CSV, he sacado las conclusiones que me parecen más relevantes y he realizado una serie de gráficos y de tablas para representarlo. He escogido entre gráficos y tablas en función de lo que me parece más visual para el receptor.He realizado un mapa del mundo en el que se muestran los paises con mayores ataques de tiburón, un "pie chart" con la división de los ataques por país y un diagrama de líneas en el que se muestran los ataques en los tres paises con mayor número de ataques durante el siglo actual.

## OBSTACLES

El principal obstaculos, ha sido que quería trabajar un poco más con los datos de "Species" y "Injury" para trabajar conjuntamente con ambas, pero me he encontrado con que los datos no están nada normalizados, ya que es complicado encontrar dos valores iguales en la misma columna. Por lo tanto, no he trabajado con estos datos ya que me suponía un tiempo muy alto.

## LESSON LEARNED

Con este proyecto, he aprendido un poco a manipular datos, a sacar mis propias conclusiones de unos datos que pueden tener muchas formas de interpretarse y sobretodo a enfrentarme a un problema sin ningún tipo de ayuda ni guión para resolverlo.