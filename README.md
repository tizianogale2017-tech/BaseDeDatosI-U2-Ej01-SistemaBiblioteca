 Sistema de Gestión para una Biblioteca Universitaria

 Diagrama ER
![Modelo Entidad-Relación](1%20—%20Sistema%20de%20Gestión%20para%20una%20Biblioteca%20Universitaria.png)

 Lógica y Decisiones de Diseño
* **Autores y Libros:** Se usa una entidad intermedia (*Autoria*) para resolver la relación N:M, ya que un libro puede tener varios autores y viceversa.
* **Libros y Ejemplares:** Un título de libro se vincula con 1:N ejemplares físicos reales para controlar el estado y la disponibilidad individual por código de inventario.
* **Préstamos:** Los usuarios (alumnos o docentes) realizan préstamos que se detallan ítem por ítem mediante una tabla intermedia que registra las fechas de préstamo, devolución prevista y real.


---

## Normalización: Forma 0 → 1FN → 2FN → 3FN

Se muestra todo el proceso, no solo el resultado final. En todas las tablas la **clave primaria (PK) va en la primera columna** y las **claves foráneas (FK) al final**. Los datos de ejemplo son inventados.

### Forma 0 (sin normalizar)
Una sola tabla `Prestamos_Biblioteca` con todos los datos juntos. Hay celdas con **listas** (el préstamo 1 tiene dos ejemplares, con sus códigos, títulos, autores y editoriales) y el **nombre completo** del usuario y del autor en una sola celda. Los datos de Camila Ruiz y de "Cien años de soledad" se repiten (redundancia).

![Forma 0](normalizacion/00-forma-0.png)

### 1FN
Criterio: valores atómicos, sin grupos repetidos y con clave primaria definida.
1. Se separan los atributos compuestos: `nombre_usuario` en nombre y apellido, `autor` en `nombre_autor` y `apellido_autor`.
2. Se eliminan las listas: el préstamo 1 se parte en dos filas, una por ejemplar.
3. La PK pasa a ser compuesta: (`id_prestamo`, `id_ejemplar`), porque `id_prestamo` solo ya no identifica la fila.

![1FN](normalizacion/01-1fn.png)

### 2FN
Criterio: sin dependencias parciales. Cada atributo debe depender de la clave completa, no de una parte.
- `id_prestamo` → `estado`, datos del usuario, `fecha_prestamo`, `fecha_devolucion_prevista`.
- `id_ejemplar` → `codigo_inventario`, `titulo`, autor, `editorial` (el ejemplar existe aunque nadie lo pida prestado).
- Ningún atributo depende de la combinación de ambos.

Se crea una tabla por cada parte de la clave (`Prestamos`, `Ejemplares`) y `Detalle_Prestamo` queda solo con la combinación, con las dos partes como FK.

![2FN](normalizacion/02-2fn.png)

### 3FN
Criterio: sin dependencias transitivas (un atributo no clave que determina a otro no clave).
- En `Prestamos`, nombre, apellido, tipo y correo dependen de `numero_legajo`, no de `id_prestamo` → tabla `Usuario`; `Prestamo` queda con `id_usuario` como FK.
- En `Ejemplares`, título, editorial y autor dependen del libro, no del ejemplar → tablas `Libro` y `Autor`. Como un libro puede tener varios autores y un autor varios libros (N:M), se resuelve con la intermedia `Autoria`. `Ejemplar` queda con `id_libro` como FK.

![3FN](normalizacion/03-3fn.png)

### Decisiones de diseño
- Cada tabla tiene una PK `id_<entidad>` propia; el legajo y el código de inventario quedan como atributos comunes (únicos).
- `Autoria` y `Detalle_Prestamo` son las tablas intermedias de las relaciones N:M (Autor–Libro y Préstamo–Ejemplar).
- La Forma 0 se armó a partir de los datos de ejemplo del modelo, juntándolos en una sola tabla. Para que se vean las listas, el préstamo 1 se cargó con dos ejemplares.
- En este recorrido las fechas del préstamo quedaron en `Prestamo`, porque en la Forma 0 son del préstamo completo. Si cada ejemplar pudiera tener su propia fecha de devolución, pasarían a `Detalle_Prestamo`.
- El modelo del diagrama ER incluye más atributos (por ejemplo `isbn` o el estado de conservación) que se omitieron acá para centrar el ejemplo en el proceso de normalización.
