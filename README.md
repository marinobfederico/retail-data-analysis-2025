# Trabajo Integrador: Análisis de Ventas Retail 2025 (UTN Rosario) 📊

[cite_start]Este repositorio contiene el desarrollo del proyecto final para el curso **"Aprende SQL y domina las bases de datos (MySQL)"** dictado por la Asociación de Graduados de la UTN Facultad Regional Rosario[cite: 107, 108]. [cite_start]El objetivo principal fue realizar un análisis de ventas detallado para una empresa de productos tecnológicos durante el ejercicio fiscal 2025[cite: 157, 163].

## 🎯 Objetivo del Proyecto
[cite_start]El trabajo consistió en aplicar consultas SQL avanzadas sobre un entorno multicanal para extraer información relevante y transformarla en insights de negocio, diferenciando claramente entre la extracción técnica y el análisis conceptual de los datos[cite: 168, 169, 170].

## 📂 Estructura de Datos
[cite_start]Se trabajó con los siguientes datasets en formato CSV:
* [cite_start]`clientes.csv`: Información demográfica y categorías de clientes. [cite: 172]
* [cite_start]`sucursales.csv`: Datos de ubicación y gerencia de los puntos de venta. [cite: 174]
* [cite_start]`productos.csv`: Catálogo con nombres, categorías y precios unitarios. [cite: 175]
* [cite_start]`ventas.csv`: Tabla de hechos con los registros generales de facturación. [cite: 173]
* [cite_start]`detalles_venta.csv`: Desglose de cada transacción por producto y cantidad. [cite: 176]

## 🛠️ Desarrollo del Desafío

### [cite_start]Parte 1: Nivel Técnico (Extracción SQL) [cite: 187]
[cite_start]Se desarrollaron scripts para resolver las siguientes métricas clave solicitadas por la gerencia: [cite: 163, 189]
1. [cite_start]**Facturación Total:** Cálculo del ingreso bruto global de 2025. [cite: 190]
2. [cite_start]**Desempeño Geográfico:** Total facturado por cada sucursal. [cite: 191]
3. [cite_start]**Volumen de Unidades:** Conteo de la cantidad total de productos vendidos. [cite: 192]
4. [cite_start]**Frecuencia de Operaciones:** Cantidad de ventas realizadas por cada punto de venta. [cite: 193]
5. [cite_start]**Estacionalidad:** Evolución de la facturación a nivel mensual. [cite: 194]

### [cite_start]Parte 2: Comprensión Analítica [cite: 195]
[cite_start]Más allá del código, se realizó una interpretación conceptual de los datos para responder: [cite: 197, 198]
* [cite_start]**Precisión de Informes:** ¿Por qué es crítico filtrar por año en reportes gerenciales? [cite: 199]
* [cite_start]**Calidad del Dato:** El impacto de los valores nulos o registros en cero en los promedios de ventas. [cite: 200]
* [cite_start]**Diagnóstico de Sucursales:** Análisis de escenarios con alto volumen de ventas pero facturación baja (Ticket Promedio). [cite: 201]
* [cite_start]**Arquitectura de Consultas:** Justificación de por qué la tabla de ventas por sí sola no permite identificar los productos más vendidos. [cite: 202]

## 🔍 Proceso de Auditoría y Validación
* **Validación Cruzada:** Se realizó una limpieza previa de los archivos CSV convirtiéndolos a tablas estructuradas en Excel, lo que permitió detectar discrepancias en los encabezados antes de la carga final en MySQL.
* **Integridad Referencial:** El script SQL final incluye el uso de Claves Primarias y Foráneas para asegurar que la relación entre los tickets y los productos sea exacta.

---
[cite_start]**Desarrollado por Federico Marino** *Estudiante de Ciencia de Datos - UNR Rosario* [cite: 110]
