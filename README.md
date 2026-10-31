# Laboratorio 09 · Netflix y Prime Video

Maquetas móviles en Flutter correspondientes a la parte de Piero del trabajo en pareja. Las pantallas de Disney+ y Max corresponden a la otra parte del equipo.

## Ejecutar

```sh
flutter pub get
flutter run
```

## Colocar las imágenes

Todas las rutas parten de la raíz de este proyecto. Usar exactamente los nombres indicados, en minúsculas y con extensión `.jpg` (convertir el archivo a JPEG; no basta cambiar la extensión).

| Carpeta | Archivo | Imagen sugerida |
| --- | --- | --- |
| assets/images/netflix/ | portada.jpg | Collage de películas y series, horizontal, 1920 × 1080 recomendado |
| assets/images/netflix/ | stranger_things.jpg | Póster vertical de Stranger Things |
| assets/images/netflix/ | merlina.jpg | Póster vertical de Merlina |
| assets/images/netflix/ | el_juego_del_calamar.jpg | Póster vertical de El juego del calamar |
| assets/images/netflix/ | la_casa_de_papel.jpg | Póster vertical de La casa de papel |
| assets/images/prime/ | portada.jpg | Imagen promocional horizontal de Prime Video, 1920 × 1080 recomendado |
| assets/images/prime/ | the_boys.jpg | Imagen horizontal de The Boys |
| assets/images/prime/ | fallout.jpg | Imagen horizontal de Fallout |
| assets/images/prime/ | los_anillos_de_poder.jpg | Imagen horizontal de Los anillos de poder |
| assets/images/prime/ | reacher.jpg | Imagen horizontal de Reacher |

Pósteres Netflix: proporción 2:3. Tarjetas Prime: proporción 16:9. Las imágenes se recortan para llenar su espacio. Elegir portadas sin textos pequeños porque la interfaz superpone el contenido.

Los directorios ya están registrados en `pubspec.yaml`. Después de agregar nuevos archivos ejecutar `flutter pub get` y reiniciar la app por completo. Mientras falten imágenes se muestra un fondo con el nombre del título, sin interrumpir la navegación.

La sección «Una experiencia de cine» utiliza una imagen en la nube de Unsplash, requiere internet y tiene fondo de reemplazo si falla. Su URL se encuentra en `PrimePage` dentro de `lib/main.dart`.

## Relación con la consigna

- ListView vertical para las páginas y horizontal para los catálogos.
- Row y Column para composición; ListTile y Card para menú y beneficios.
- Listas de mapas para los títulos; rutas `/`, `/netflix` y `/prime`.
- Tema global oscuro.
- Tres fuentes locales: Lato, Bebas Neue y Open Sans; licencias en `assets/fonts/`.
- Imágenes locales preparadas e imagen remota configurada.
- Formulario con validación local, FAQ desplegable y detalle de títulos.

Las imágenes locales deben agregarse antes de la entrega para completar ese requisito. El proyecto es una demostración académica: no reproduce videos, no autentica cuentas y no envía correos.

## Validación

```sh
flutter analyze
flutter test
flutter build web
```

Pruebas de navegación, validación del formulario, FAQ y ausencia de errores de layout en dispositivos de 390 px y 320 px.

## Referencias

- Consigna: https://tecsup.instructure.com/courses/73402/assignments/1930937?module_item_id=6315504
- Netflix Perú: https://www.netflix.com/pe/
- Prime Video: https://www.primevideo.com/

Repositorio local con commits por responsabilidad. El remoto se configurará cuando se indique su URL.
