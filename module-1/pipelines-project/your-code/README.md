# PANDAS PROJECT 

## IMPORTING

Para llevar a cabo la importación de los dastos, he descargado el data set en un fichero con formato csv y mediante pandas, he obtenido los datos usando la funcion **red_to_csv**.

Además, he importado una serie de librerias que he necesitado a lo largo del proyecto, estas librerias son los siguientes:
* import numpy as np
* import pandas as pd
* import re
* import plotly as plotly
* import plotly.plotly as py
* import plotly.graph_objs as go
* from plotly.offline import *
* import argparse
* from dotenv import load_dotenv
* import os

## HYPOTESIS

Me he decidido por importar un dataset el cual contiene información de las carreras de taxi en la ciudad de Quito(Ecuador). De toda está información, he decidido obtener los datos de los puntos de espera más frecuente, gracias a la ayuda de un mapa en el que se indican dichos lugares. Para obtener dichos puntos, he realizado un bin en el cual he dividido en función de la mediana. Además, por último lugar, he realizado un diagrama apilado en el que se comparar los tres bloques en un gráfico apilado en función de los días de la semana. 

Todo esto lo he realizado con el objetivo de que la empresa de taxis pueda minimizar los tiempos de espera del cliente, ya sea distribuyendo más coches a los puntos más solicitados en los momentos exactos o incorporando más coches a la plantilla.

## CLEANING & MANIPULATION

Una vez importado los datos, he realizado una limpieza de los datos, ya que habían bastantes que no me resultaban significativos. Para ello he eliminado una serie de columnas, cuyos identificadores son los siguientes: ['store_and_fwd_flag']

## EXPORTING

Además de exportar los datos con los que he trabajado a un fichero CSV, he sacado las conclusiones que me parecen más relevantes y he realizado una serie de gráficos y de tablas para representarlo. He escogido entre gráficos y tablas en función de lo que me parece más visual para el receptor. He realizado un mapa del mundo en el que se muestran las zonas de la ciudad de quito en donde se los clientes deben esperar más para poder montarse en un taxi.

## PARAMETRIZE

He parametrizado mi pipeline, añadiendo dos posibles argumentos:
* '-q','--quite' no va a ejecutar el código
* '-h','--help' para ofrecer información de los argumentos posibles

## OBSTACLES

El principal obstaculos, ha sido encontrar un data set que me pareciera interesante para poder sacar una información valiosa y que se pueda aplicar de manera real.

## LESSON LEARNED

Con este proyecto, he continuado aprendiendo un poco a manipular datos, a sacar mis propias conclusiones y a estructurar mi código.