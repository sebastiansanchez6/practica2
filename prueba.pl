vehiculo(toyota, corolla, sedan, 88000000, 2022).
vehiculo(toyota, rav4, suv, 112000000, 2021).
vehiculo(toyota, hilux, pickup, 140000000, 2023).
vehiculo(ford, focus, sedan, 84000000, 2020).
vehiculo(ford, explorer, suv, 160000000, 2022).
vehiculo(ford, ranger, pickup, 128000000, 2021).
vehiculo(bmw, x5, suv, 240000000, 2021).
vehiculo(bmw, serie3, sedan, 180000000, 2023).
vehiculo(chevrolet, camaro, deportivo, 200000000, 2022).
vehiculo(mazda, cx5, suv, 120000000, 2023).
vehiculo(honda, civic, sedan, 92000000, 2022).

cumple_presupuesto(Referencia, PresupuestoMaximo) :-
    vehiculo(_, Referencia, _, Precio, _),
    Precio =< PresupuestoMaximo.

vehiculos_por_marca(Marca, Lista) :-
    findall(Referencia, vehiculo(Marca, Referencia, _, _, _), Lista).

generar_reporte(Marca, Tipo, Presupuesto, resultado(Vehiculos, Total)) :-
    findall((Referencia, Precio),
            (vehiculo(Marca, Referencia, Tipo, Precio, _), Precio =< Presupuesto),
            Vehiculos),
    sumar_precios(Vehiculos, Total),
    Total =< 4000000000.

sumar_precios([], 0).
sumar_precios([(_, Precio)|Cola], Total) :-
    sumar_precios(Cola, Subtotal),
    Total is Precio + Subtotal.

caso_prueba1(Resultado) :-
    findall(Ref, (vehiculo(toyota, Ref, suv, Precio, _), Precio < 120000000), Resultado).

caso_prueba2(Resultado) :-
    bagof((Tipo, Año, Ref),
          vehiculo(ford, Ref, Tipo, _, Año),
          Resultado).

caso_prueba3(resultado(Vehiculos, Total)) :-
    findall((Ref, Precio),
            (vehiculo(_, Ref, sedan, Precio, _), Precio =< 2000000000),
            Vehiculos),
    sumar_precios(Vehiculos, Total),
    Total =< 2000000000.