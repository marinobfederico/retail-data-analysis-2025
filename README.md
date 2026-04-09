Trabajo Integrador: Análisis de Ventas Retail 2025 (UTN Rosario) 📊
Este repositorio contiene el desarrollo del proyecto final para el curso "Aprende SQL y domina las bases de datos (MySQL)" dictado por la Asociación de Graduados de la UTN Facultad Regional Rosario. El objetivo principal fue realizar un análisis de ventas detallado para una empresa de productos tecnológicos durante el ejercicio fiscal 2025.

🎯 Objetivo del Proyecto
El trabajo consistió en aplicar consultas SQL avanzadas sobre un entorno multicanal para extraer información relevante y transformarla en insights de negocio, diferenciando claramente entre la extracción técnica y el análisis conceptual de los datos.

📂 Estructura de Datos
Se trabajó con los siguientes datasets en formato CSV:

clientes.csv: Información demográfica y categorías de clientes.

sucursales.csv: Datos de ubicación y gerencia de los puntos de venta.

productos.csv: Catálogo con nombres, categorías y precios unitarios.

ventas.csv: Tabla de hechos con los registros generales de facturación.

detalles_venta.csv: Desglose de cada transacción por producto y cantidad.

🛠️ Desarrollo del Desafío
Parte 1: Nivel Técnico (Extracción SQL)
Se desarrollaron scripts para resolver las siguientes métricas clave solicitadas por la gerencia:

Facturación Total: Cálculo del ingreso bruto global de 2025.

Desempeño Geográfico: Total facturado por cada sucursal.

Volumen de Unidades: Conteo de la cantidad total de productos vendidos.

Frecuencia de Operaciones: Cantidad de ventas realizadas por cada punto de venta.

Estacionalidad: Evolución de la facturación a nivel mensual.

Parte 2: Comprensión Analítica
Más allá del código, se realizó una interpretación conceptual de los datos para responder:

Precisión de Informes: ¿Por qué es crítico filtrar por año en reportes gerenciales?

Calidad del Dato: El impacto de los valores nulos o registros en cero en los promedios de ventas.

Diagnóstico de Sucursales: Análisis de escenarios con alto volumen de ventas pero facturación baja (Ticket Promedio).

Arquitectura de Consultas: Justificación de por qué la tabla de ventas por sí sola no permite identificar los productos más vendidos.

🔍 Proceso de Auditoría y Validación
Validación Cruzada: Se realizó una limpieza previa de los archivos CSV convirtiéndolos a tablas estructuradas en Excel, lo que permitió detectar discrepancias en los encabezados antes de la carga final en MySQL.

Integridad Referencial: El script SQL final incluye el uso de Claves Primarias y Foráneas para asegurar que la relación entre los tickets y los productos sea exacta.

Desarrollado por Federico Marino Estudiante de Licenciatura en Ciencia de Datos
