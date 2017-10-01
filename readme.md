# MadridShops. Advanced iOS practice with Swift 4. KC V Bootcamp

## Predicate

Create a mobile application to display information of Shops and Events in Madrid, even when the user has no Internet connection. Shops and Activities should be shown in a Map.

### Requirements:

3. Cache is never invalidated, so once everything has been saved, set a flag and never ever access to the network again

### Extra Notes:

### Web Services

- Shops: [https://madrid-shops.com/json_new/getShops.php](https://madrid-shops.com/json_new/getShops.php)
- Activities: [https://madrid-shops.com/json_new/getActivities.php](https://madrid-shops.com/json_new/getActivities.php)

## Student Notes

### Build and Runtime requirements
- XCode Version 9.0 beta 6 (9M214v) 
- iOS 10.
- Emulated with my iPhone 6. 
- Extra libraries:
	-  FillableLoaders: Used to check the connection
	-  SDWebImage/WebP: Used to cache the images


### Architecture

The practice is based on the application developed during the module classes. Part of the following functionality:

- Main view with a button, when you press the view with the list of shops is displayed.
- The list of shops is displayed in a custom cell with the logo on the left and the name in the center.
- By clicking on the cell, it shows the detail of the shops, with the description and the image of it.

From here, the code is adapted to complete the detailed points of the practice.

### Code details and model decisions

From the Shop and Shop model class and core data shopCD, refactoring is done to transform it into Entity / Entities and EntityCD.

### Installation

- It is recommended to use the detailed version in the previous notes, as well as the tests on a real device.
- download project from this same repository: `` `https: // github.com / gemambu / MadridShops.git```
- pod install
- open the project workspace: MadridShops / madridshops.xcworkspace

### Additional features

- Icon and background of the application. Generated with [logojoy.com] (https://logojoy.com). Assets generated with [makeappicon.com] (makeappicon.com)
- _Easter egg_ sponsored by the wikiquote dedicated to [Gran Chiquito de la Calzada] (https://es.wikiquote.org/wiki/Chiquito_de_la_Calzada). The easter egg can be seen testing the non-connection of the device, and from the button of the community of Madrid that appears in the main screen :)

### Possible improvements
 
- In the list view, add the option to search entity by name, and in turn highlight the corresponding pin on the map and the listing only shows that entity.
- Expand the model to enter the information of Services in Madrid.
- Apply autolayout to improve the design for different devices.



# MadridShops. Práctica iOS avanzado con Swift 4. KC V Bootcamp

## Enunciado

Crear una aplicación móvil para mostrar la información de Tiendas y Eventos en Madrid, incluso cuando el usuario no tenga conexión a internet. Las tiendas y Actividades deben mostrarse en un Mapa.


### Requirements:

2. La aplicación cacheará todo localmente: imágenes, datos, etc. Incluso las imágenes de los mapas.
3. La cache nunca queda invalidada, una vez todo ha sido almacenado, se almacenará un flag y nunca se deberá acceder de nuevo a la red.
9. Toda la información debe leerse desde una base de datos de Core Data
10. Si pulsa en un pin del mapa, se abrirá un popup con el logotipo + nombre de tienda / actividad. La pulsación del popup nos lleva a la pantalla de detalle de la tienda / actividad.
11. El mapa siempre estará centrado en Madrid, mostrando también la ubicación del usuario.
12. Todos los datos estarán al menos en castellano e inglés: debe almacenar en caché todo y mostrar en español (si es el idioma de nuestro teléfono) o inglés de otra manera
13. La pantalla de detalle de la tienda / actividad debe mostrar el nombre de la tienda, la descripción, la dirección y un mapa que muestre la ubicación de la tienda / actividad sin ningún pin.

### Notas Extra:
* Utiliza un repositorio git para almacenar tu código a medida que avanza.
* Para persistir la información mientras estés offline, usa Core Data! Puede almacenar las imágenes en caché utilizando cualquier técnica que desee (datos básicos, una biblioteca, archivar archivos, etc.)
* La arquitectura limpia sería agradable: interactors, managers, etc.
* Test: modelo, DAOs
* Combinar todos los cambios de nuevo a rama master, eso es lo que voy a ver!
* ¡Añade un README al repo!
* ¡Buena suerte y diviértete codificando!

### Web Services

- Tiendas: [https://madrid-shops.com/json_new/getShops.php](https://madrid-shops.com/json_new/getShops.php)
- Actividades: [https://madrid-shops.com/json_new/getActivities.php](https://madrid-shops.com/json_new/getActivities.php)

## Notas del alumno

### Requisitos de generación y ejecución
- XCode Versión 9.0 beta 6 (9M214v) 
- iOS 10.
- Depurado y testeado con iPhone 6. 
- Librerías extra instaladas con CocoaPods:
	-  FillableLoaders: Para comprobar la conexión a la red
	-  SDWebImage/WebP: Para el cacheo de imágenes

	
### Arquitectura

La práctica se basa en la aplicación desarrollada durante las clases del módulo. Parte de la siguiente funcionalidad:

- Vista principal con un botón, al pulsar se muestra la vista con el listado de tiendas.
- El listado de tiendas se muestra en una celda personalizada, con el logo a la izquierda y el nombre en el centro.
- Al pinchar sobre la celda, se muestra el detalle de la tienda, con la descripción y la imagen de la misma.

A partir de aquí, se adapta el código para completar los puntos detallados de la práctica.

### Detalles de código y decisiones sobre el modelo

A partir de la clase de modelo Shop y Shops y de core data shopCD, se hace refactoring para transformarlo en Entity/Entities y EntityCD.


### Instalación

- Se recomienda utilizar la versión detallada en las notas previas, así como las pruebas sobre un dispoitivo real.
- descargar proyecto desde este mismo repositorio: ```https://github.com/gemambu/MadridShops.git```
- pod install
- abrir el workspace del proyecto: MadridShops/madridshops.xcworkspace

### Extras

- Icono y fondo de la aplicación. Generados con [logojoy.com](https://logojoy.com). Assets generados con [makeappicon.com](makeappicon.com)
- _Easter egg_ patrocinado por la wikiquote dedicada al [Gran Chiquito de la Calzada](https://es.wikiquote.org/wiki/Chiquito_de_la_Calzada). El easter egg puede verse probando la no-conexión del dispositivo, y desde el botón de la comunidad de madrid que aparece en la pantalla principal :)

### Posibles mejoras
 
- En la vista de listado, añadir la opción de buscar entidad por nombre, y que a su vez destaque el pin correspondiente en el mapa y el listado sólo muestre esa entidad.
- Ampliar el modelo para introducir la información de Servicios en Madrid.
- Aplicar autolayout para mejorar el diseño para diferentes dispositivos.