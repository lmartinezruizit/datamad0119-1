# INTRODUCTION
    Mi proyecto se basa en la obtención de la mayor información de todos los miembros del grupo de meetup de Ironhack-Madrid, para ello he obtenido todos los miembros mediante la API de meetup y posteriormente he enriquecido estos datos haciendo 'scraping' en cada uno de los perfiles de cada miembro.

    Los atributos que he guardado de los miembros son los siguientes:
    * Name: Se refiere al nombre del usuario
    * Bio: Breve biografía del usuario
    * Joined: Fecha en que se unió al grupo
    * Status: Estado el usuario
    * City: Ciudad del usuario
    * Country: Pais del usuario
    * Is pro admin: Si es administrador dentro del grupo de Ironhack-Madrid
    * Role: Rol que tiene dentro del grupo
    * Photo: Photo del usuario
    * Answer: Respuesta a "¿Cómo conociste este meetup?"
    * Groups: Grupos a los que también pertenece el usuario

    De todos estos atributos, el único obtenido haciendo 'scraping' en la web, ha sido el de los grupos a los que pertenece el usuario.

# CODE
## API
    Para conseguir los datos de la API de meetup, he creado un método asíncrono(async def main()) debido a que para obtener todos los usuarios que rondan los 6400, eran necesarias 32 peticiones, ya que por cada llamada solo era posible obtener 200 usuarios. Una vez obtenidas todas las respuestas, he recorrido dichas respuestas y le he pasado los valores que he seleccionado a un objeto que he creado de la clase "Member"(clase a la que se le pasan los parámetros de los campos que quiero obtener y que está formada por getters y setters para obtener y modificar dichos valores).

## SCRAPING
    Una vez obtenidos todos los atributos de la API, he realizado una clase llamada 'IronhackMeetupMembers' la cual hace 'scraping' de manera asíncrona de cada una de las páginas de los miembros del grupo. El resultado de está clase es la obtención de todos los grupos a los que pertenece cada usuario.

## DATA SET
    Una vez he obtenido todos los datos necesarios, seteo los valores de los grupos en la clase member y obtengo el diccionario resultante.
    
# RESULT
    El data set resultante lo he guardado en un fichero JSON el cual cuenta con 6361 registros.
    
# OBSTACLES
    El principal obstáculo ha sido conseguir poder hacer las llamadas de manera asíncrona, ya que no sabía muy bien como realizarlo, pero una vez conseguido, el resultado ha sido magnífico ya que me ha permitido hacer numerosas llamadas en muy poco tiempo.
    
# LESSONS LEARNED
    Este proyecto me ha ayudado mucho a familiarizarme con las APIs y a seguir aprendiendo a hacer scraping de páginas web. Además, he incluido programación orientada a objetos, lo cuál me ha hecho entenderla un poco más.