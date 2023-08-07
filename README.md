# flutter_test_joke

<p class="center">
<center><a href="https://github.com/briansalvattore/flutter_test_joke" target="_blank" rel="noreferrer noopener"><img src="assets/images/joke_logo.png" width="100" alt="build"></a></center>
</p>

## Antecedentes
Este proyecto es un ejemplo de cómo mostrar un chiste.

Este chiste tiene 2 tipos, un chiste único y otro con un delivery. Si tiene delivery se debe dar la opción al usuario de ver el chiste completo.

Además el usuario puede pedir el siguiente chiste.

Se usará Joke API 
```
https://v2.jokeapi.dev/joke/Any?lang=es
```

## Propuesta
La arquitectura propuesta es [feature-first](https://sanjay-kidecha.medium.com/which-architecture-is-most-suitable-for-flutter-feature-first-or-layer-first-95eb7a6d04c1). Esta nos va a permitir flexibilidad al momento de integrar nuevas funcionalidades.

El gestor de estados propuesto es [riverpod](https://codewithandrea.com/articles/flutter-state-management-riverpod/#:~:text=Riverpod%20implements%20well%2Ddefined%20patterns,subscriptions%20to%20your%20Flutter%20apps.). Además de ser un gestor de estados completo. Está siempre en constante mantenimiento y actualización, lo que hace que se mantenga actualizado a las buenas prácticas y tendencias. Tiene una gran comunidad y documentación, esto ayuda a buscar ejemplos y en el caso de tener dudas, poder alzar la mano y pedir ayuda.

Para la carpeta *presentation* dentro de cada feature se usa [atomic design](https://www.uifrommars.com/atomic-design-ventajas/) para mantener el orden de las responsabilidades de cada widget. 

## Comentarios personales
El proyecto cuenta con una carpeta *shared* cuyo objetivo es tener código que se pueda reutilizar en cualquier feature.

La carpeta *routes* tiene todas las rutas de las pantallas dónde cada feature interacciona. De esta manera nos podemos mover entre pantallas con facilidad.


## Probarlo localmente
Antes de probar el código con un dispositivo, se debe usar la siguente sentencia para generar las traducciones.
```
flutter gen-l10n   
```
Luego de esto con facilidad se puede ejecutar
```
flutter run
```


## Se probó en

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✅    | ✅  |  x   | x  |  x   |   x    |

## Tests
Para realizar el test de integración usar:
```
flutter drive --target=test_driver/app.dart
```

Para realizar las pruebas unitarias, usar:
```
flutter test
```

## TODO
- [x] Arquitectura basada en internacionalización para que sea cómodo agregar un nuevo idioma
- [x] Mostrar el botón de "ver chiste" cuando no hay red
- [ ] Mostrar error cuando el json sea mal formateado
- [ ] Guardar en memoría los id's que se mostraron en la sesión para no volver a mostrarlos
- [ ] Si hay un id repetido volver a llamar a "ver chiste"
- [ ] Cambiar de idioma a ingles 
- [ ] Splash scrren en iOS