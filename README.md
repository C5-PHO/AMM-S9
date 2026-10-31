# Laboratorio 09 · Max

Trabajo individual de Aplicaciones Multiplataforma. Interfaz móvil en Flutter inspirada en Max, implementada en `lib/main.dart`.

## Ejecutar

```sh
flutter pub get
flutter run
```

## Imágenes que debes colocar

Carpeta absoluta:
`C:\Users\piero\Documents\Tecsup\C5\AMM\SemanaS9\flutter_application_1\assets\images\max`

| Nombre exacto | Contenido sugerido | Proporción recomendada |
| --- | --- | --- |
| portada.jpg | Collage o imagen promocional de Max sin textos | 16:9, 1920 × 1080 o mayor |
| the_last_of_us.jpg | Póster de The Last of Us | 2:3 |
| la_casa_del_dragon.jpg | Póster de La casa del dragón | 2:3 |
| the_batman.jpg | Póster de The Batman | 2:3 |
| dune_2.jpg | Póster de Dune: Parte dos | 2:3 |
| harry_potter.jpg | Póster de Harry Potter | 2:3 |
| friends.jpg | Póster de Friends | 2:3 |

Usar JPEG real, nombres en minúsculas y sin espacios. No basta cambiar la extensión de un PNG o WebP. Las tarjetas horizontales reutilizan los pósteres y los recortan automáticamente. Las imágenes faltantes muestran un fondo azul con el título; deben agregarse antes de entregar para completar el requisito de imágenes locales.

La carpeta ya está registrada en `pubspec.yaml`. Después de añadir los archivos ejecutar `flutter pub get` y reiniciar la aplicación por completo.

La sección de dispositivos carga una fotografía de cine desde Unsplash mediante `Image.network`. Requiere internet y muestra un fondo de reemplazo si falla. Android ya tiene permiso de internet en el manifiesto principal.

## Requisitos cubiertos

- ListView horizontal para catálogos y vertical para la pantalla de detalle.
- Row para icono y género en la ficha de cada título; Column para composición de secciones. Wrap permite adaptar grupos al ancho móvil.
- ListTile y Card para beneficios y títulos.
- Lista de mapas para los títulos y sus descripciones.
- Rutas `/` y `/detalle`, con argumentos y navegación de regreso.
- Tema global oscuro, acentos azules y tres fuentes locales: Lato, Open Sans y Bebas Neue.
- Imágenes locales configuradas e imagen en la nube.
- Navegación a catálogo y planes, detalle de título, validación de email y FAQ desplegable.

Los planes y las descripciones son ilustrativos. La aplicación no reproduce videos, no realiza compras, no autentica cuentas ni transmite el correo ingresado. Los títulos del catálogo son ejemplos de diseño, no una afirmación de disponibilidad actual.

## Validación

```sh
flutter analyze
flutter test
flutter build web
```

Tres pruebas de widgets cubren los flujos interactivos y tamaños móviles de 320 y 390 píxeles. Las pruebas de red utilizan el reemplazo de imagen; no verifican la disponibilidad del servicio externo.

## Referencias

- Consigna original: https://tecsup.instructure.com/courses/73402/assignments/1930937?module_item_id=6315504
- Referencia elegida: https://www.max.com/
- Repositorio: https://github.com/C5-PHO/AMM-S9

Alcance actualizado por indicación del docente: trabajo individual y diseño de una sola plataforma. La implementación es una interpretación visual; el sitio de referencia bloqueó el acceso automatizado.

Las licencias de las tres fuentes están incluidas en `assets/fonts/`.

