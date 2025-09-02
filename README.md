# Práctica II – Sistema de Gestión de Vehículos en Prolog  
### Autores  
- Sebastián Sánchez Gómez  
- Cristóbal Machado Sánchez  

---

## 💻 Entorno  
- **Sistema Operativo:** Windows 11 Home, Versión 24H2  
- **Instalado:** 23 de diciembre de 2024  
- **Compilación:** 26100.4946  
- **Feature Experience Pack:** 1000.26100.197.0  
- **Windows Subsystem for Linux (WSL):** versión 2.5.10.0  
- **Versión del kernel Linux:** 6.6.87.2-1  
- **WSLg:** 1.0.66  
- **Intérprete Prolog:** SWI-Prolog 9.x  

### Herramientas  
- **Git** versión 2.43.0  

---

## 📚 Fuentes de información  
- Documentación oficial de SWI-Prolog.  
- Apoyo de IA (ChatGPT) para estructuración del README y ejemplos de consultas.  

---

## 📖 Descripción  
Este proyecto implementa un **sistema de gestión de inventario de vehículos** en **Prolog**.  

El sistema permite:  
- Definir un catálogo de vehículos con atributos: **marca, referencia, tipo, precio y año**.  
- Consultar vehículos por presupuesto máximo.  
- Listar vehículos por marca.  
- Generar reportes de inventario filtrados por marca, tipo y presupuesto, validando que el total no supere un límite.  
- Probar el sistema mediante **casos de prueba**.  

---

## 🧩 Funcionalidades principales  

- **meet_budget/2** → Filtra vehículos que cumplen con un presupuesto máximo.  
- **vehicles_by_brand/2** → Lista las referencias de una marca específica.  
- **generate_report/4** → Genera un reporte con vehículos filtrados y calcula el valor total.  
- **Casos de prueba:**  
  1. Toyota SUV con precio menor a 120M.  
  2. Vehículos Ford agrupados por tipo y año.  
  3. Sedanes con valor total ≤ 2000M.  

---

## ▶️ Ejemplo de ejecución  

```prolog
?- meet_budget(corolla, 90000000).
true.

?- vehicles_by_brand(toyota, List).
List = [corolla, rav4, hilux].

?- generate_report(ford, suv, 200000000, Result).
Result = result([(explorer, 160000000)], 160000000).

?- test_case1(Result).
Result = [rav4].

?- test_case2(Result).
Result = [(sedan, 2020, focus), (suv, 2022, explorer), (pickup, 2021, ranger)].

?- test_case3(Result).
Result = result([(corolla, 88000000), (focus, 84000000), (civic, 92000000), (serie3, 180000000)], 444000000).
```  

---
