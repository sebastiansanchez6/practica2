vehicle(toyota, corolla, sedan, 88000000, 2022).
vehicle(toyota, rav4, suv, 112000000, 2021).
vehicle(toyota, hilux, pickup, 140000000, 2023).
vehicle(ford, focus, sedan, 84000000, 2020).
vehicle(ford, explorer, suv, 160000000, 2022).
vehicle(ford, ranger, pickup, 128000000, 2021).
vehicle(bmw, x5, suv, 240000000, 2021).
vehicle(bmw, serie3, sedan, 180000000, 2023).
vehicle(chevrolet, camaro, sport, 200000000, 2022).
vehicle(mazda, cx5, suv, 120000000, 2023).
vehicle(honda, civic, sedan, 92000000, 2022).

meet_budget(Reference, BudgetMax) :-
    vehicle(_, Reference, _, Price, _),
    Price =< BudgetMax.

vehicles_by_brand(Brand, List) :-
    findall(Reference, vehicle(Brand, Reference, _, _, _), List).

generate_report(Brand, Type, Budget, result(Vehicles, Total)) :-
    findall((Reference, Price),
            (vehicle(Brand, Reference, Type, Price, _), Price =< Budget),
            Vehicles),
    sum_prices(Vehicles, Total),
    Total =< 4000000000.

sum_prices([], 0).
sum_prices([(_, Price)|Tail], Total) :-
    sum_prices(Tail, Subtotal),
    Total is Price + Subtotal.

test_case1(Result) :-
    findall(Ref, (vehicle(toyota, Ref, suv, Price, _), Price < 120000000), Result).

test_case2(Result) :-
    bagof((Type, Year, Ref),
          vehicle(ford, Ref, Type, _, Year),
          Result).

test_case3(result(Vehicles, Total)) :-
    findall((Ref, Price),
            (vehicle(_, Ref, sedan, Price, _), Price =< 2000000000),
            Vehicles),
    sum_prices(Vehicles, Total),
    Total =< 2000000000.