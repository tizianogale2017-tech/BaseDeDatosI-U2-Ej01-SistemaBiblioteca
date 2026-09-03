 Sistema de Gestión para una Biblioteca Universitaria

 Diagrama ER
![Modelo Entidad-Relación](1%20—%20Sistema%20de%20Gestión%20para%20una%20Biblioteca%20Universitaria.png)

 Lógica y Decisiones de Diseño
* **Autores y Libros:** Se usa una entidad intermedia (*Autoria*) para resolver la relación N:M, ya que un libro puede tener varios autores y viceversa.
* **Libros y Ejemplares:** Un título de libro se vincula con 1:N ejemplares físicos reales para controlar el estado y la disponibilidad individual por código de inventario.
* **Préstamos:** Los usuarios (alumnos o docentes) realizan préstamos que se detallan ítem por ítem mediante una tabla intermedia que registra las fechas de préstamo, devolución prevista y real.
