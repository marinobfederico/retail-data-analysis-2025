/*
PROYECTO: Análisis de Ventas Retail 2025
AUTOR: Fede
DESCRIPCIÓN: Creación de base de datos, extracción de métricas y auditoría de KPIs.
*/

CREATE DATABASE IF NOT EXISTS Trabajo_integrador_SQL;
USE Trabajo_integrador_SQL;

-- =============================================
-- 1. CREACIÓN DE ESTRUCTURA (DDL)
-- =============================================

CREATE TABLE sucursales (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sucursal VARCHAR(100),
    ciudad VARCHAR(250),
    telefono VARCHAR(100),
    responsable_gerencia VARCHAR(250)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(200),
    edad INT,
    creado_en DATE,
    categoria_cliente VARCHAR(100)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(150),
    categoria VARCHAR(100),
    precio DECIMAL(10,2)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_cliente INT,
    fk_id_sucursal INT,
    fecha DATE,
    metodo_pago VARCHAR(50),
    cantidad_productos INT,
    total DECIMAL(10,2),
    descuento DECIMAL(5,2),
    descuento_monto DECIMAL(10,2),
    CONSTRAINT fk_ventas_sucursal FOREIGN KEY (fk_id_sucursal) REFERENCES sucursales(id_sucursal)
);

CREATE TABLE detalles_venta (
    fk_id_venta INT,
    fk_id_producto INT,
    cantidad INT,
    CONSTRAINT fk_detalles_venta FOREIGN KEY (fk_id_venta) REFERENCES ventas(id_venta),
    CONSTRAINT fk_detalles_producto FOREIGN KEY (fk_id_producto) REFERENCES productos(id_producto)
);

-- =============================================
-- 2. REQUERIMIENTOS TÉCNICOS (PARTE 1)
-- =============================================

-- 1) Total facturado global 2025
SELECT SUM(total) AS ventas_totales_2025 
FROM ventas 
WHERE YEAR(fecha) = 2025;

-- 2) Total facturado por sucursal
SELECT s.nombre_sucursal, SUM(v.total) AS total_sucursal
FROM ventas v
INNER JOIN sucursales s ON v.fk_id_sucursal = s.id_sucursal
WHERE YEAR(v.fecha) = 2025
GROUP BY s.nombre_sucursal;

-- 3) Cantidad total de unidades vendidas
SELECT SUM(cantidad_productos) AS cantidad_productos_2025 
FROM ventas 
WHERE YEAR(fecha) = 2025;

-- 4) Cantidad de transacciones por sucursal
SELECT s.nombre_sucursal, COUNT(v.id_venta) AS cantidad_de_ventas_2025
FROM ventas v
INNER JOIN sucursales s ON v.fk_id_sucursal = s.id_sucursal
WHERE YEAR(v.fecha) = 2025
GROUP BY s.nombre_sucursal;

-- 5) Evolución de facturación mensual
SELECT MONTH(fecha) AS mes, SUM(total) AS ventas_totales_2025
FROM ventas
WHERE YEAR(fecha) = 2025
GROUP BY MONTH(fecha)
ORDER BY mes;

-- =============================================
-- 3. ANÁLISIS AVANZADO Y AUDITORÍA (PARTE 2)
-- =============================================

-- Análisis de Mix de Productos para Sucursal Centro (Bajo Ticket Promedio)
SELECT 
    p.nombre_producto,
    p.categoria,
    SUM(dv.cantidad) AS unidades_vendidas,
    AVG(p.precio) AS precio_unitario_promedio,
    SUM(dv.cantidad * p.precio) AS total_generado
FROM ventas v
INNER JOIN sucursales s ON v.fk_id_sucursal = s.id_sucursal
INNER JOIN detalles_venta dv ON v.id_venta = dv.fk_id_venta
INNER JOIN productos p ON dv.fk_id_producto = p.id_producto
WHERE s.nombre_sucursal = 'Sucursal Centro' AND YEAR(v.fecha) = 2025
GROUP BY p.nombre_producto, p.categoria
ORDER BY unidades_vendidas DESC;

-- Comparativa de Ticket Promedio y Volumen entre las 3 sucursales
SELECT 
    s.nombre_sucursal,
    COUNT(DISTINCT v.id_venta) AS cantidad_tickets,
    SUM(v.cantidad_productos) AS total_unidades,
    SUM(v.total) AS facturacion_total,
    ROUND(SUM(v.total) / COUNT(DISTINCT v.id_venta), 2) AS ticket_promedio
FROM sucursales s
LEFT JOIN ventas v ON s.id_sucursal = v.fk_id_sucursal AND YEAR(v.fecha) = 2025
GROUP BY s.nombre_sucursal
ORDER BY ticket_promedio DESC;

-- Auditoría de Política de Descuentos por Sucursal
SELECT 
    s.nombre_sucursal,
    AVG(v.descuento) AS porcentaje_desc_promedio,
    SUM(v.descuento_monto) AS total_descuentos_aplicados,
    AVG(v.total) AS ticket_promedio
FROM ventas v
INNER JOIN sucursales s ON v.fk_id_sucursal = s.id_sucursal
WHERE YEAR(v.fecha) = 2025
GROUP BY s.nombre_sucursal
ORDER BY porcentaje_desc_promedio DESC;