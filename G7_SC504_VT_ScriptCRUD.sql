SET SERVEROUTPUT ON;


-- 1. Tabla Estado 
CREATE TABLE FIDE_estado_TB (
    id_estado NUMBER CONSTRAINT FIDE_estado_PK PRIMARY KEY,
    Descripcion_Estado VARCHAR2(100) NOT NULL
);

-- 2. Tabla Pais
CREATE TABLE FIDE_pais_TB (
    id_pais NUMBER CONSTRAINT FIDE_pais_id_pais_PK PRIMARY KEY,
    nombre_pais VARCHAR2(100) CONSTRAINT FIDE_pais_nombre_pais_NOT_NULL NOT NULL,
    id_estado NUMBER,
    CONSTRAINT FIDE_pais_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 3. Tabla Provincia 
CREATE TABLE FIDE_provincia_TB (
    id_provincia NUMBER CONSTRAINT FIDE_provincia_id_provincia_PK PRIMARY KEY,
    nombre_provincia VARCHAR2(100) CONSTRAINT FIDE_provincia_nombre_provincia_NOT_NULL NOT NULL,
    id_pais NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_provincia_id_pais_FK FOREIGN KEY (id_pais) REFERENCES FIDE_pais_TB(id_pais),
    CONSTRAINT FIDE_provincia_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 4. Tabla Distrito 
CREATE TABLE FIDE_distrito_TB (
    id_distrito NUMBER CONSTRAINT FIDE_distrito_id_distrito_PK PRIMARY KEY,
    nombre_distrito VARCHAR2(100) CONSTRAINT FIDE_distrito_nombre_distrito_NOT_NULL NOT NULL,
    id_provincia NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_distrito_id_provincia_FK FOREIGN KEY (id_provincia) REFERENCES FIDE_provincia_TB(id_provincia),
    CONSTRAINT FIDE_distrito_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 5. Tabla Direccion 
CREATE TABLE FIDE_direccion_TB (
    id_direccion NUMBER CONSTRAINT FIDE_direccion_id_direccion_PK PRIMARY KEY,
    detalle_direccion VARCHAR2(100) CONSTRAINT FIDE_direccion_detalle_direccion_NOT_NULL NOT NULL,
    codigo_postal VARCHAR2(10) CONSTRAINT FIDE_direccion_codigo_postal_NOT_NULL NOT NULL,
    id_distrito NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_direccion_id_distrito_FK FOREIGN KEY (id_distrito) REFERENCES FIDE_distrito_TB(id_distrito),
    CONSTRAINT FIDE_direccion_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 6. Tabla Cargo 
CREATE TABLE FIDE_cargo_TB (
    id_cargo NUMBER CONSTRAINT FIDE_cargo_id_cargo_PK PRIMARY KEY,
    descripcion_cargo VARCHAR2(100) CONSTRAINT FIDE_cargo_descripcion_cargo_NOT_NULL NOT NULL,
    id_estado NUMBER,
    CONSTRAINT FIDE_cargo_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 7. Tabla Sucursal 
CREATE TABLE FIDE_sucursal_TB (
    id_sucursal NUMBER CONSTRAINT FIDE_sucursal_id_sucursal_PK PRIMARY KEY,
    nombre VARCHAR2(100) CONSTRAINT FIDE_sucursal_nombre_NOT_NULL NOT NULL,
    telefono VARCHAR2(20) CONSTRAINT FIDE_sucursal_telefono_NOT_NULL NOT NULL,
    id_direccion NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_sucursal_id_direccion_FK FOREIGN KEY (id_direccion) REFERENCES FIDE_direccion_TB(id_direccion),
    CONSTRAINT FIDE_sucursal_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 8. Tabla Cliente 
CREATE TABLE FIDE_cliente_TB (
    id_cliente NUMBER CONSTRAINT FIDE_cliente_id_cliente_PK PRIMARY KEY,
    nombre VARCHAR2(50) CONSTRAINT FIDE_cliente_nombre_NOT_NULL NOT NULL,
    apellido VARCHAR2(50) CONSTRAINT FIDE_cliente_apellido_NOT_NULL NOT NULL,
    telefono VARCHAR2(20) CONSTRAINT FIDE_cliente_telefono_NOT_NULL NOT NULL,
    email VARCHAR2(100) CONSTRAINT FIDE_cliente_email_UNIQUE UNIQUE CONSTRAINT FIDE_cliente_email_NOT_NULL NOT NULL,
    id_direccion NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_cliente_id_direccion_FK FOREIGN KEY (id_direccion) REFERENCES FIDE_direccion_TB(id_direccion),
    CONSTRAINT FIDE_cliente_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 9. Tabla Proveedor 
CREATE TABLE FIDE_proveedor_TB (
    id_proveedor NUMBER CONSTRAINT FIDE_proveedor_id_proveedor_PK PRIMARY KEY,
    nombre VARCHAR2(100) CONSTRAINT FIDE_proveedor_nombre_NOT_NULL NOT NULL,
    telefono VARCHAR2(20) CONSTRAINT FIDE_proveedor_telefono_NOT_NULL NOT NULL,
    email VARCHAR2(100) CONSTRAINT FIDE_proveedor_email_UNIQUE UNIQUE CONSTRAINT FIDE_proveedor_email_NOT_NULL NOT NULL,
    id_direccion NUMBER,
    id_sucursal NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_proveedor_id_direccion_FK FOREIGN KEY (id_direccion) REFERENCES FIDE_direccion_TB(id_direccion),
    CONSTRAINT FIDE_proveedor_id_sucursal_FK FOREIGN KEY (id_sucursal) REFERENCES FIDE_sucursal_TB(id_sucursal),
    CONSTRAINT FIDE_proveedor_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 10. Tabla Empleado 
CREATE TABLE FIDE_empleado_TB (
    id_empleado NUMBER CONSTRAINT FIDE_empleado_id_empleado_PK PRIMARY KEY,
    nombre VARCHAR2(50) CONSTRAINT FIDE_empleado_nombre_NOT_NULL NOT NULL,
    apellido VARCHAR2(50) CONSTRAINT FIDE_empleado_apellido_NOT_NULL NOT NULL,
    id_cargo NUMBER,
    id_sucursal NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_empleado_id_cargo_FK FOREIGN KEY (id_cargo) REFERENCES FIDE_cargo_TB(id_cargo),
    CONSTRAINT FIDE_empleado_id_sucursal_FK FOREIGN KEY (id_sucursal) REFERENCES FIDE_sucursal_TB(id_sucursal),
    CONSTRAINT FIDE_empleado_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 11. Tabla M�todo_Pago
CREATE TABLE FIDE_metodo_pago_TB (
    id_metodo_pago NUMBER CONSTRAINT FIDE_metodo_pago_id_metodo_pago_PK PRIMARY KEY,
    descripcion_metodo_pago VARCHAR2(100) CONSTRAINT FIDE_metodo_pago_descripcion_metodo_pago_NOT_NULL NOT NULL,
    id_estado NUMBER,
    CONSTRAINT FIDE_metodo_pago_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 12. Tabla Categoria 
CREATE TABLE FIDE_categoria_TB (
    id_categoria NUMBER CONSTRAINT FIDE_categoria_id_categoria_PK PRIMARY KEY,
    nombre VARCHAR2(100) CONSTRAINT FIDE_categoria_nombre_NOT_NULL NOT NULL,
    descripcion VARCHAR2(255) CONSTRAINT FIDE_categoria_descripcion_NOT_NULL NOT NULL,
    id_estado NUMBER,
    CONSTRAINT FIDE_categoria_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 13. Tabla Producto 
CREATE TABLE FIDE_producto_TB (
    id_producto NUMBER CONSTRAINT FIDE_producto_id_producto_PK PRIMARY KEY,
    nombre VARCHAR2(100) CONSTRAINT FIDE_producto_nombre_NOT_NULL NOT NULL,
    descripcion VARCHAR2(255) CONSTRAINT FIDE_producto_descripcion_NOT_NULL NOT NULL,
    precio NUMBER CONSTRAINT FIDE_producto_precio_NOT_NULL NOT NULL,
    id_categoria NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_producto_id_categoria_FK FOREIGN KEY (id_categoria) REFERENCES FIDE_categoria_TB(id_categoria),
    CONSTRAINT FIDE_producto_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 14. Tabla Compra_Inventario 
CREATE TABLE FIDE_compra_inventario_TB (
    id_compra NUMBER CONSTRAINT FIDE_compra_inventario_id_compra_PK PRIMARY KEY,
    fecha_compra DATE CONSTRAINT FIDE_compra_inventario_fecha_compra_NOT_NULL NOT NULL,
    monto_total NUMBER CONSTRAINT FIDE_compra_inventario_monto_total_NOT_NULL NOT NULL,
    id_proveedor NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_compra_inventario_id_proveedor_FK FOREIGN KEY (id_proveedor) REFERENCES FIDE_proveedor_TB(id_proveedor),
    CONSTRAINT FIDE_compra_inventario_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 15. Tabla Inventario 
CREATE TABLE FIDE_inventario_TB (
    id_ingrediente NUMBER CONSTRAINT FIDE_inventario_id_ingrediente_PK PRIMARY KEY,
    nombre_ingrediente VARCHAR2(100) CONSTRAINT FIDE_inventario_nombre_ingrediente_NOT_NULL NOT NULL,
    stock NUMBER CONSTRAINT FIDE_inventario_stock_NOT_NULL NOT NULL,
    unidad_medida VARCHAR2(50) CONSTRAINT FIDE_inventario_unidad_medida_NOT_NULL NOT NULL,
    id_compra NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_inventario_id_compra_FK FOREIGN KEY (id_compra) REFERENCES FIDE_compra_inventario_TB(id_compra),
    CONSTRAINT FIDE_inventario_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 16. Tabla Detalle_Compra_Inventario 
CREATE TABLE FIDE_detalle_compra_inventario_TB (
    id_detalle_inventario NUMBER CONSTRAINT FIDE_detalle_compra_inventario_id_detalle_inventario_PK PRIMARY KEY,
    cantidad NUMBER CONSTRAINT FIDE_detalle_compra_inventario_cantidad_NOT_NULL NOT NULL,
    costo_unitario NUMBER CONSTRAINT FIDE_detalle_compra_inventario_costo_unitario_NOT_NULL NOT NULL,
    id_ingrediente NUMBER,
    id_compra NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_detalle_compra_inventario_id_ingrediente_FK FOREIGN KEY (id_ingrediente) REFERENCES FIDE_inventario_TB(id_ingrediente),
    CONSTRAINT FIDE_detalle_compra_inventario_id_compra_FK FOREIGN KEY (id_compra) REFERENCES FIDE_compra_inventario_TB(id_compra),
    CONSTRAINT FIDE_detalle_compra_inventario_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 17. Tabla Pedidos_Ingrediente 
CREATE TABLE FIDE_pedidos_ingrediente_TB (
    id_pedidos_ingrediente NUMBER CONSTRAINT FIDE_pedidos_ingrediente_id_pedidos_ingrediente_PK PRIMARY KEY,
    cantidad_requerida NUMBER CONSTRAINT FIDE_pedidos_ingrediente_cantidad_requerida_NOT_NULL NOT NULL,
    id_producto NUMBER,
    id_ingrediente NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_pedidos_ingrediente_id_producto_FK FOREIGN KEY (id_producto) REFERENCES FIDE_producto_TB(id_producto),
    CONSTRAINT FIDE_pedidos_ingrediente_id_ingrediente_FK FOREIGN KEY (id_ingrediente) REFERENCES FIDE_inventario_TB(id_ingrediente),
    CONSTRAINT FIDE_pedidos_ingrediente_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 18. Tabla Orden 
CREATE TABLE FIDE_orden_TB (
    id_orden NUMBER CONSTRAINT FIDE_orden_id_orden_PK PRIMARY KEY,
    fecha DATE CONSTRAINT FIDE_orden_fecha_NOT_NULL NOT NULL,
    total NUMBER CONSTRAINT FIDE_orden_total_NOT_NULL NOT NULL,
    id_cliente NUMBER,
    id_sucursal NUMBER,
    id_empleado NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_orden_id_cliente_FK FOREIGN KEY (id_cliente) REFERENCES FIDE_cliente_TB(id_cliente),
    CONSTRAINT FIDE_orden_id_sucursal_FK FOREIGN KEY (id_sucursal) REFERENCES FIDE_sucursal_TB(id_sucursal),
    CONSTRAINT FIDE_orden_id_empleado_FK FOREIGN KEY (id_empleado) REFERENCES FIDE_empleado_TB(id_empleado),
    CONSTRAINT FIDE_orden_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 19. Tabla Detalle_orden 
CREATE TABLE FIDE_detalle_orden_TB (
    id_detalle_orden NUMBER CONSTRAINT FIDE_detalle_orden_id_detalle_orden_PK PRIMARY KEY,
    cantidad NUMBER CONSTRAINT FIDE_detalle_orden_cantidad_NOT_NULL NOT NULL,
    precio_unitario NUMBER CONSTRAINT FIDE_detalle_orden_precio_unitario_NOT_NULL NOT NULL,
    id_orden NUMBER,
    id_producto NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_detalle_orden_id_orden_FK FOREIGN KEY (id_orden) REFERENCES FIDE_orden_TB(id_orden),
    CONSTRAINT FIDE_detalle_orden_id_producto_FK FOREIGN KEY (id_producto) REFERENCES FIDE_producto_TB(id_producto),
    CONSTRAINT FIDE_detalle_orden_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);

-- 20. Tabla Pago
CREATE TABLE FIDE_pago_TB (
    id_pago NUMBER CONSTRAINT FIDE_pago_id_pago_PK PRIMARY KEY,
    fecha_pago DATE CONSTRAINT FIDE_pago_fecha_pago_NOT_NULL NOT NULL,
    monto NUMBER CONSTRAINT FIDE_pago_monto_NOT_NULL NOT NULL,
    metodo_pago NUMBER,
    id_orden NUMBER,
    id_estado NUMBER,
    CONSTRAINT FIDE_pago_metodo_pago_FK FOREIGN KEY (metodo_pago) REFERENCES FIDE_metodo_pago_TB(id_metodo_pago),
    CONSTRAINT FIDE_pago_id_orden_FK FOREIGN KEY (id_orden) REFERENCES FIDE_orden_TB(id_orden),
    CONSTRAINT FIDE_pago_id_estado_FK FOREIGN KEY (id_estado) REFERENCES FIDE_estado_TB(id_estado)
);
--------------------------------------------------------------------------------- Procedimientos --------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- Procedimientos de Create ----------------------------------------------------------------------------------
-- Procedimiento para llenado de datos en la tabla Cliente
CREATE OR REPLACE PROCEDURE FIDE_clienteAgregar_SP (
    P_nombre VARCHAR2,
    P_apellido VARCHAR2,
    P_telefono VARCHAR2,
    P_email VARCHAR2,
    P_id_direccion NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_cliente_TB (nombre, apellido, telefono, email, id_direccion, id_estado)
    VALUES (P_nombre, P_apellido, P_telefono, P_email, P_id_direccion, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en latabla Proveedor
CREATE OR REPLACE PROCEDURE FIDE_proveedorAgregar_SP (
    P_nombre VARCHAR2,
    P_telefono VARCHAR2,
    P_email VARCHAR2,
    P_id_direccion NUMBER,
    P_id_sucursal NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_proveedor_TB (nombre, telefono, email, id_direccion, id_sucursal, id_estado)
    VALUES (P_nombre, P_telefono, P_email, P_id_direccion, P_id_sucursal, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Empleado
CREATE OR REPLACE PROCEDURE FIDE_empleadoAgregar_SP (
    P_nombre VARCHAR2,
    P_apellido VARCHAR2,
    P_id_cargo NUMBER,
    P_id_sucursal NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_empleado_TB (nombre, apellido, id_cargo, id_sucursal, id_estado)
    VALUES (P_nombre, P_apellido, P_id_cargo, P_id_sucursal, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Orden
CREATE OR REPLACE PROCEDURE FIDE_ordenAgregar_SP (
    P_fecha DATE,
    P_total NUMBER,
    P_id_cliente NUMBER,
    P_id_sucursal NUMBER,
    P_id_empleado NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_orden_TB (fecha, total, id_cliente, id_sucursal, id_empleado, id_estado)
    VALUES (P_fecha, P_total, P_id_cliente, P_id_sucursal, P_id_empleado, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Detalle_orden
CREATE OR REPLACE PROCEDURE FIDE_detalle_ordenAgregar_SP (
    P_cantidad NUMBER,
    P_precio_unitario NUMBER,
    P_id_orden NUMBER,
    P_id_producto NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_detalle_orden_TB (cantidad, precio_unitario, id_orden, id_producto, id_estado)
    VALUES (P_cantidad, P_precio_unitario, P_id_orden, P_id_producto, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Pago
CREATE OR REPLACE PROCEDURE FIDE_pagoAgregar_SP (
    P_fecha_pago DATE,
    P_monto NUMBER,
    P_metodo_pago NUMBER,
    P_id_orden NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_pago_TB (fecha_pago, monto, metodo_pago, id_orden, id_estado)
    VALUES (P_fecha_pago, P_monto, P_metodo_pago, P_id_orden, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla M�todo_Pago
CREATE OR REPLACE PROCEDURE FIDE_metodo_pagoAgregar_SP (
    P_descripcion_metodo_pago VARCHAR2,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_metodo_pago_TB (descripcion_metodo_pago, id_estado)
    VALUES (P_descripcion_metodo_pago, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Sucursal
CREATE OR REPLACE PROCEDURE FIDE_sucursalAgregar_SP (
    P_nombre VARCHAR2,
    P_telefono VARCHAR2,
    P_id_direccion NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_sucursal_TB (nombre, telefono, id_direccion, id_estado)
    VALUES (P_nombre, P_telefono, P_id_direccion, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Cargo
CREATE OR REPLACE PROCEDURE FIDE_cargoAgregar_SP (
    P_descripcion_cargo VARCHAR2,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_cargo_TB (descripcion_cargo, id_estado)
    VALUES (P_descripcion_cargo, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Direccion
CREATE OR REPLACE PROCEDURE FIDE_direccionAgregar_SP (
    P_detalle_direccion VARCHAR2,
    P_codigo_postal VARCHAR2,
    P_id_distrito NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_direccion_TB (detalle_direccion, codigo_postal, id_distrito, id_estado)
    VALUES (P_detalle_direccion, P_codigo_postal, P_id_distrito, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Pais
CREATE OR REPLACE PROCEDURE FIDE_paisAgregar_SP (
    P_nombre_pais VARCHAR2,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_pais_TB (nombre_pais, id_estado)
    VALUES (P_nombre_pais, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Provincia
CREATE OR REPLACE PROCEDURE FIDE_provinciaAgregar_SP (
    P_nombre_provincia VARCHAR2,
    P_id_pais NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_provincia_TB (nombre_provincia, id_pais, id_estado)
    VALUES (P_nombre_provincia, P_id_pais, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Distrito
CREATE OR REPLACE PROCEDURE FIDE_distritoAgregar_SP (
    P_nombre_distrito VARCHAR2,
    P_id_provincia NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_distrito_TB (nombre_distrito, id_provincia, id_estado)
    VALUES (P_nombre_distrito, P_id_provincia, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Inventario
CREATE OR REPLACE PROCEDURE FIDE_inventarioAgregar_SP (
    P_nombre_ingrediente VARCHAR2,
    P_stock NUMBER,
    P_unidad_medida VARCHAR2,
    P_id_compra NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_inventario_TB (nombre_ingrediente, stock, unidad_medida, id_compra, id_estado)
    VALUES (P_nombre_ingrediente, P_stock, P_unidad_medida, P_id_compra, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Compra_Inventario
CREATE OR REPLACE PROCEDURE FIDE_compra_inventarioAgregar_SP (
    P_fecha_compra DATE,
    P_monto_total NUMBER,
    P_id_proveedor NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_compra_inventario_TB (fecha_compra, monto_total, id_proveedor, id_estado)
    VALUES (P_fecha_compra, P_monto_total, P_id_proveedor, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Detalle_Compra_Inventario
CREATE OR REPLACE PROCEDURE FIDE_detalle_compra_inventarioAgregar_SP (
    P_cantidad NUMBER,
    P_costo_unitario NUMBER,
    P_id_ingrediente NUMBER,
    P_id_compra NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_detalle_compra_inventario_TB (cantidad, costo_unitario, id_ingrediente, id_compra, id_estado)
    VALUES (P_cantidad, P_costo_unitario, P_id_ingrediente, P_id_compra, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Pedidos_Ingrediente
CREATE OR REPLACE PROCEDURE FIDE_pedidos_ingredienteAgregar_SP (
    P_cantidad_requerida NUMBER,
    P_id_producto NUMBER,
    P_id_ingrediente NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_pedidos_ingrediente_TB (cantidad_requerida, id_producto, id_ingrediente, id_estado)
    VALUES (P_cantidad_requerida, P_id_producto, P_id_ingrediente, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Categoria
CREATE OR REPLACE PROCEDURE FIDE_categoriaAgregar_SP (
    P_nombre VARCHAR2,
    P_descripcion VARCHAR2,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_categoria_TB (nombre, descripcion, id_estado)
    VALUES (P_nombre, P_descripcion, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Producto
CREATE OR REPLACE PROCEDURE FIDE_productoAgregar_SP (
    P_nombre VARCHAR2,
    P_descripcion VARCHAR2,
    P_precio NUMBER,
    P_id_categoria NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    INSERT INTO FIDE_producto_TB (nombre, descripcion, precio, id_categoria, id_estado)
    VALUES (P_nombre, P_descripcion, P_precio, P_id_categoria, P_id_estado);
END;
/

-- Procedimiento para llenado de datos en la tabla Estado
CREATE OR REPLACE PROCEDURE FIDE_estadoAgregar_SP (
    P_descripcion_estado VARCHAR2
) AS
BEGIN
    INSERT INTO FIDE_estado_TB (descripcion_estado)
    VALUES (P_descripcion_estado);
END;
/


--------------------------------------------------------------------------------- Funciones --------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- Funciones de Read  -----------------------------------------------------------------------------------


-- Lectura tabla Detalle Orden
CREATE OR REPLACE FUNCTION FIDE_detalle_ordenLeer_FN (
    P_id_detalle_orden NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_detalle_orden IS
        SELECT cantidad, precio_unitario, id_orden, id_producto, id_estado
        FROM FIDE_detalle_orden_TB
        WHERE id_detalle_orden = P_id_detalle_orden;
    
    v_cantidad NUMBER;
    v_precio_unitario NUMBER;
    v_id_orden NUMBER;
    v_id_producto NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_detalle_orden;
    FETCH c_detalle_orden INTO v_cantidad, v_precio_unitario, v_id_orden, v_id_producto, v_id_estado;
    
    IF c_detalle_orden%FOUND THEN
        resultado := v_cantidad || ',' || v_precio_unitario || ',' || v_id_orden || ',' || v_id_producto || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_detalle_orden;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_detalle_orden%ISOPEN THEN
            CLOSE c_detalle_orden;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Orden
CREATE OR REPLACE FUNCTION FIDE_ordenLeer_FN (
    P_id_orden NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_orden IS
        SELECT fecha, total, id_cliente, id_sucursal, id_empleado, id_estado
        FROM FIDE_orden_TB
        WHERE id_orden = P_id_orden;
    
    v_fecha DATE;
    v_total NUMBER;
    v_id_cliente NUMBER;
    v_id_sucursal NUMBER;
    v_id_empleado NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_orden;
    FETCH c_orden INTO v_fecha, v_total, v_id_cliente, v_id_sucursal, v_id_empleado, v_id_estado;
    
    IF c_orden%FOUND THEN
        resultado := TO_CHAR(v_fecha) || ',' || v_total || ',' || v_id_cliente || ',' || v_id_sucursal || ',' || v_id_empleado || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_orden;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_orden%ISOPEN THEN
            CLOSE c_orden;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Empleado
CREATE OR REPLACE FUNCTION FIDE_empleadoLeer_FN (
    P_id_empleado NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_empleado IS
        SELECT nombre, apellido, id_cargo, id_sucursal, id_estado
        FROM FIDE_empleado_TB
        WHERE id_empleado = P_id_empleado;
    
    v_nombre VARCHAR2(50);
    v_apellido VARCHAR2(50);
    v_id_cargo NUMBER;
    v_id_sucursal NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_empleado;
    FETCH c_empleado INTO v_nombre, v_apellido, v_id_cargo, v_id_sucursal, v_id_estado;
    
    IF c_empleado%FOUND THEN
        resultado := v_nombre || ',' || v_apellido || ',' || v_id_cargo || ',' || v_id_sucursal || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_empleado;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_empleado%ISOPEN THEN
            CLOSE c_empleado;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Sucursal
CREATE OR REPLACE FUNCTION FIDE_sucursalLeer_FN (
    P_id_sucursal NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_sucursal IS
        SELECT nombre, telefono, id_direccion, id_estado
        FROM FIDE_sucursal_TB
        WHERE id_sucursal = P_id_sucursal;
    
    v_nombre VARCHAR2(100);
    v_telefono VARCHAR2(20);
    v_id_direccion NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_sucursal;
    FETCH c_sucursal INTO v_nombre, v_telefono, v_id_direccion, v_id_estado;
    
    IF c_sucursal%FOUND THEN
        resultado := v_nombre || ',' || v_telefono || ',' || v_id_direccion || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_sucursal;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_sucursal%ISOPEN THEN
            CLOSE c_sucursal;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Pago
CREATE OR REPLACE FUNCTION FIDE_pagoLeer_FN (
    P_id_pago NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_pago IS
        SELECT fecha_pago, monto, metodo_pago, id_orden, id_estado
        FROM FIDE_pago_TB
        WHERE id_pago = P_id_pago;
    
    v_fecha_pago DATE;
    v_monto NUMBER;
    v_metodo_pago NUMBER;
    v_id_orden NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_pago;
    FETCH c_pago INTO v_fecha_pago, v_monto, v_metodo_pago, v_id_orden, v_id_estado;
    
    IF c_pago%FOUND THEN
        resultado := TO_CHAR(v_fecha_pago) || ',' || v_monto || ',' || v_metodo_pago || ',' || v_id_orden || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_pago;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_pago%ISOPEN THEN
            CLOSE c_pago;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Metodo de Pago
CREATE OR REPLACE FUNCTION FIDE_metodo_pagoLeer_FN (
    P_id_metodo_pago NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_metodo_pago IS
        SELECT descripcion_metodo_pago, id_estado
        FROM FIDE_metodo_pago_TB
        WHERE id_metodo_pago = P_id_metodo_pago;
    
    v_descripcion_metodo_pago VARCHAR2(100);
    v_id_estado NUMBER;
BEGIN
    OPEN c_metodo_pago;
    FETCH c_metodo_pago INTO v_descripcion_metodo_pago, v_id_estado;
    
    IF c_metodo_pago%FOUND THEN
        resultado := v_descripcion_metodo_pago || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_metodo_pago;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_metodo_pago%ISOPEN THEN
            CLOSE c_metodo_pago;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Proveedor
CREATE OR REPLACE FUNCTION FIDE_proveedorLeer_FN (
    P_id_proveedor NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_proveedor IS
        SELECT nombre, telefono, email, id_direccion, id_sucursal, id_estado
        FROM FIDE_proveedor_TB
        WHERE id_proveedor = P_id_proveedor;
    
    v_nombre VARCHAR2(100);
    v_telefono VARCHAR2(20);
    v_email VARCHAR2(100);
    v_id_direccion NUMBER;
    v_id_sucursal NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_proveedor;
    FETCH c_proveedor INTO v_nombre, v_telefono, v_email, v_id_direccion, v_id_sucursal, v_id_estado;
    
    IF c_proveedor%FOUND THEN
        resultado := v_nombre || ',' || v_telefono || ',' || v_email || ',' || v_id_direccion || ',' || v_id_sucursal || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_proveedor;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_proveedor%ISOPEN THEN
            CLOSE c_proveedor;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Cliente
CREATE OR REPLACE FUNCTION FIDE_clienteLeer_FN (
    P_id_cliente NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_cliente IS
        SELECT nombre, apellido, telefono, email, id_direccion, id_estado
        FROM FIDE_cliente_TB
        WHERE id_cliente = P_id_cliente;
    
    v_nombre VARCHAR2(50);
    v_apellido VARCHAR2(50);
    v_telefono VARCHAR2(20);
    v_email VARCHAR2(100);
    v_id_direccion NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_cliente;
    FETCH c_cliente INTO v_nombre, v_apellido, v_telefono, v_email, v_id_direccion, v_id_estado;
    
    IF c_cliente%FOUND THEN
        resultado := v_nombre || ',' || v_apellido || ',' || v_telefono || ',' || v_email || ',' || v_id_direccion || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_cliente;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_cliente%ISOPEN THEN
            CLOSE c_cliente;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Cargo
CREATE OR REPLACE FUNCTION FIDE_cargoLeer_FN (
    P_id_cargo NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_cargo IS
        SELECT descripcion_cargo, id_estado
        FROM FIDE_cargo_TB
        WHERE id_cargo = P_id_cargo;
    
    v_descripcion_cargo VARCHAR2(100);
    v_id_estado NUMBER;
BEGIN
    OPEN c_cargo;
    FETCH c_cargo INTO v_descripcion_cargo, v_id_estado;
    
    IF c_cargo%FOUND THEN
        resultado := v_descripcion_cargo || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_cargo;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_cargo%ISOPEN THEN
            CLOSE c_cargo;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Direccion
CREATE OR REPLACE FUNCTION FIDE_direccionLeer_FN (
    P_id_direccion NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_direccion IS
        SELECT detalle_direccion, codigo_postal, id_distrito, id_estado
        FROM FIDE_direccion_TB
        WHERE id_direccion = P_id_direccion;
    
    v_detalle_direccion VARCHAR2(100);
    v_codigo_postal VARCHAR2(10);
    v_id_distrito NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_direccion;
    FETCH c_direccion INTO v_detalle_direccion, v_codigo_postal, v_id_distrito, v_id_estado;
    
    IF c_direccion%FOUND THEN
        resultado := v_detalle_direccion || ',' || v_codigo_postal || ',' || v_id_distrito || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_direccion;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_direccion%ISOPEN THEN
            CLOSE c_direccion;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Pais
CREATE OR REPLACE FUNCTION FIDE_paisLeer_FN (
    P_id_pais NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_pais IS
        SELECT nombre_pais, id_estado
        FROM FIDE_pais_TB
        WHERE id_pais = P_id_pais;
    
    v_nombre_pais VARCHAR2(100);
    v_id_estado NUMBER;
BEGIN
    OPEN c_pais;
    FETCH c_pais INTO v_nombre_pais, v_id_estado;
    
    IF c_pais%FOUND THEN
        resultado := v_nombre_pais || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_pais;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_pais%ISOPEN THEN
            CLOSE c_pais;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Provincia
CREATE OR REPLACE FUNCTION FIDE_provinciaLeer_FN (
    P_id_provincia NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_provincia IS
        SELECT nombre_provincia, id_pais, id_estado
        FROM FIDE_provincia_TB
        WHERE id_provincia = P_id_provincia;
    
    v_nombre_provincia VARCHAR2(100);
    v_id_pais NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_provincia;
    FETCH c_provincia INTO v_nombre_provincia, v_id_pais, v_id_estado;
    
    IF c_provincia%FOUND THEN
        resultado := v_nombre_provincia || ',' || v_id_pais || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_provincia;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_provincia%ISOPEN THEN
            CLOSE c_provincia;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Distrito
CREATE OR REPLACE FUNCTION FIDE_distritoLeer_FN (
    P_id_distrito NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_distrito IS
        SELECT nombre_distrito, id_provincia, id_estado
        FROM FIDE_distrito_TB
        WHERE id_distrito = P_id_distrito;
    
    v_nombre_distrito VARCHAR2(100);
    v_id_provincia NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_distrito;
    FETCH c_distrito INTO v_nombre_distrito, v_id_provincia, v_id_estado;
    
    IF c_distrito%FOUND THEN
        resultado := v_nombre_distrito || ',' || v_id_provincia || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_distrito;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_distrito%ISOPEN THEN
            CLOSE c_distrito;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Inventario
CREATE OR REPLACE FUNCTION FIDE_inventarioLeer_FN (
    P_id_ingrediente NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_inventario IS
        SELECT nombre_ingrediente, stock, unidad_medida, id_compra, id_estado
        FROM FIDE_inventario_TB
        WHERE id_ingrediente = P_id_ingrediente;
    
    v_nombre_ingrediente VARCHAR2(100);
    v_stock NUMBER;
    v_unidad_medida VARCHAR2(50);
    v_id_compra NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_inventario;
    FETCH c_inventario INTO v_nombre_ingrediente, v_stock, v_unidad_medida, v_id_compra, v_id_estado;
    
    IF c_inventario%FOUND THEN
        resultado := v_nombre_ingrediente || ',' || v_stock || ',' || v_unidad_medida || ',' || v_id_compra || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_inventario;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_inventario%ISOPEN THEN
            CLOSE c_inventario;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Compra Inventario
CREATE OR REPLACE FUNCTION FIDE_compra_inventarioLeer_FN (
    P_id_compra NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_compra_inventario IS
        SELECT fecha_compra, monto_total, id_proveedor, id_estado
        FROM FIDE_compra_inventario_TB
        WHERE id_compra = P_id_compra;
    
    v_fecha_compra DATE;
    v_monto_total NUMBER;
    v_id_proveedor NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_compra_inventario;
    FETCH c_compra_inventario INTO v_fecha_compra, v_monto_total, v_id_proveedor, v_id_estado;
    
    IF c_compra_inventario%FOUND THEN
        resultado := TO_CHAR(v_fecha_compra) || ',' || v_monto_total || ',' || v_id_proveedor || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_compra_inventario;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_compra_inventario%ISOPEN THEN
            CLOSE c_compra_inventario;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Detalle Compra de Inventario
CREATE OR REPLACE FUNCTION FIDE_detalle_compra_inventarioLeer_FN (
    P_id_detalle_inventario NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_detalle_compra_inventario IS
        SELECT cantidad, costo_unitario, id_ingrediente, id_compra, id_estado
        FROM FIDE_detalle_compra_inventario_TB
        WHERE id_detalle_inventario = P_id_detalle_inventario;
    
    v_cantidad NUMBER;
    v_costo_unitario NUMBER;
    v_id_ingrediente NUMBER;
    v_id_compra NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_detalle_compra_inventario;
    FETCH c_detalle_compra_inventario INTO v_cantidad, v_costo_unitario, v_id_ingrediente, v_id_compra, v_id_estado;
    
    IF c_detalle_compra_inventario%FOUND THEN
        resultado := v_cantidad || ',' || v_costo_unitario || ',' || v_id_ingrediente || ',' || v_id_compra || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_detalle_compra_inventario;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_detalle_compra_inventario%ISOPEN THEN
            CLOSE c_detalle_compra_inventario;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Pedido de Ingredientes
CREATE OR REPLACE FUNCTION FIDE_pedidos_ingredienteLeer_FN (
    P_id_pedidos_ingrediente NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_pedidos_ingrediente IS
        SELECT cantidad_requerida, id_producto, id_ingrediente, id_estado
        FROM FIDE_pedidos_ingrediente_TB
        WHERE id_pedidos_ingrediente = P_id_pedidos_ingrediente;
    
    v_cantidad_requerida NUMBER;
    v_id_producto NUMBER;
    v_id_ingrediente NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_pedidos_ingrediente;
    FETCH c_pedidos_ingrediente INTO v_cantidad_requerida, v_id_producto, v_id_ingrediente, v_id_estado;
    
    IF c_pedidos_ingrediente%FOUND THEN
        resultado := v_cantidad_requerida || ',' || v_id_producto || ',' || v_id_ingrediente || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_pedidos_ingrediente;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_pedidos_ingrediente%ISOPEN THEN
            CLOSE c_pedidos_ingrediente;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Categoria
CREATE OR REPLACE FUNCTION FIDE_categoriaLeer_FN (
    P_id_categoria NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_categoria IS
        SELECT nombre, descripcion, id_estado
        FROM FIDE_categoria_TB
        WHERE id_categoria = P_id_categoria;
    
    v_nombre VARCHAR2(100);
    v_descripcion VARCHAR2(255);
    v_id_estado NUMBER;
BEGIN
    OPEN c_categoria;
    FETCH c_categoria INTO v_nombre, v_descripcion, v_id_estado;
    
    IF c_categoria%FOUND THEN
        resultado := v_nombre || ',' || v_descripcion || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_categoria;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_categoria%ISOPEN THEN
            CLOSE c_categoria;
        END IF;
        RAISE;
END;
/

-- Lectura tabla Producto
CREATE OR REPLACE FUNCTION FIDE_productoLeer_FN (
    P_id_producto NUMBER
) RETURN VARCHAR2 AS
    resultado VARCHAR2(4000);
    
    CURSOR c_producto IS
        SELECT nombre, descripcion, precio, id_categoria, id_estado
        FROM FIDE_producto_TB
        WHERE id_producto = P_id_producto;
    
    v_nombre VARCHAR2(100);
    v_descripcion VARCHAR2(255);
    v_precio NUMBER;
    v_id_categoria NUMBER;
    v_id_estado NUMBER;
BEGIN
    OPEN c_producto;
    FETCH c_producto INTO v_nombre, v_descripcion, v_precio, v_id_categoria, v_id_estado;
    
    IF c_producto%FOUND THEN
        resultado := v_nombre || ',' || v_descripcion || ',' || v_precio || ',' || v_id_categoria || ',' || v_id_estado;
    ELSE
        resultado := NULL;
    END IF;
    
    CLOSE c_producto;
    RETURN resultado;
EXCEPTION
    WHEN OTHERS THEN
        IF c_producto%ISOPEN THEN
            CLOSE c_producto;
        END IF;
        RAISE;
END;
/


--------------------------------------------------------------------------------- Procedimientos --------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- Procedimientos de Update ----------------------------------------------------------------------------------

-- Actualizaci�n tabla Detalle_Orden
CREATE OR REPLACE PROCEDURE FIDE_detalle_ordenActualizar_SP (
    P_id_detalle_orden NUMBER,
    P_cantidad NUMBER,
    P_precio_unitario NUMBER,
    P_id_orden NUMBER,
    P_id_producto NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_detalle_orden_TB
    SET cantidad = P_cantidad,
        precio_unitario = P_precio_unitario,
        id_orden = P_id_orden,
        id_producto = P_id_producto,
        id_estado = P_id_estado
    WHERE id_detalle_orden = P_id_detalle_orden;
END;
/

-- Actualizaci�n tabla Orden
CREATE OR REPLACE PROCEDURE FIDE_ordenActualizar_SP (
    P_id_orden NUMBER,
    P_fecha DATE,
    P_total NUMBER,
    P_id_cliente NUMBER,
    P_id_sucursal NUMBER,
    P_id_empleado NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_orden_TB
    SET fecha = P_fecha,
        total = P_total,
        id_cliente = P_id_cliente,
        id_sucursal = P_id_sucursal,
        id_empleado = P_id_empleado,
        id_estado = P_id_estado
    WHERE id_orden = P_id_orden;
END;
/

-- Actualizaci�n tabla Empleado
CREATE OR REPLACE PROCEDURE FIDE_empleadoActualizar_SP (
    P_id_empleado NUMBER,
    P_nombre VARCHAR2,
    P_apellido VARCHAR2,
    P_id_cargo NUMBER,
    P_id_sucursal NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_empleado_TB
    SET nombre = P_nombre,
        apellido = P_apellido,
        id_cargo = P_id_cargo,
        id_sucursal = P_id_sucursal,
        id_estado = P_id_estado
    WHERE id_empleado = P_id_empleado;
END;
/

-- Actualizaci�n tabla Sucursal
CREATE OR REPLACE PROCEDURE FIDE_sucursalActualizar_SP (
    P_id_sucursal NUMBER,
    P_nombre VARCHAR2,
    P_telefono VARCHAR2,
    P_id_direccion NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_sucursal_TB
    SET nombre = P_nombre,
        telefono = P_telefono,
        id_direccion = P_id_direccion,
        id_estado = P_id_estado
    WHERE id_sucursal = P_id_sucursal;
END;
/

-- Actualizaci�n tabla Pago
CREATE OR REPLACE PROCEDURE FIDE_pagoActualizar_SP (
    P_id_pago NUMBER,
    P_fecha_pago DATE,
    P_monto NUMBER,
    P_metodo_pago NUMBER,
    P_id_orden NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_pago_TB
    SET fecha_pago = P_fecha_pago,
        monto = P_monto,
        metodo_pago = P_metodo_pago,
        id_orden = P_id_orden,
        id_estado = P_id_estado
    WHERE id_pago = P_id_pago;
END;
/

-- Actualizaci�n tabla Metodo de Pago
CREATE OR REPLACE PROCEDURE FIDE_metodo_pagoActualizar_SP (
    P_id_metodo_pago NUMBER,
    P_descripcion_metodo_pago VARCHAR2,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_metodo_pago_TB
    SET descripcion_metodo_pago = P_descripcion_metodo_pago,
        id_estado = P_id_estado
    WHERE id_metodo_pago = P_id_metodo_pago;
END;
/

-- Actualizaci�n tabla Proveedor
CREATE OR REPLACE PROCEDURE FIDE_proveedorActualizar_SP (
    P_id_proveedor NUMBER,
    P_nombre VARCHAR2,
    P_telefono VARCHAR2,
    P_email VARCHAR2,
    P_id_direccion NUMBER,
    P_id_sucursal NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_proveedor_TB
    SET nombre = P_nombre,
        telefono = P_telefono,
        email = P_email,
        id_direccion = P_id_direccion,
        id_sucursal = P_id_sucursal,
        id_estado = P_id_estado
    WHERE id_proveedor = P_id_proveedor;
END;
/

-- Actualizaci�n tabla Cliente
CREATE OR REPLACE PROCEDURE FIDE_clienteActualizar_SP (
    P_id_cliente NUMBER,
    P_nombre VARCHAR2,
    P_apellido VARCHAR2,
    P_telefono VARCHAR2,
    P_email VARCHAR2,
    P_id_direccion NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_cliente_TB
    SET nombre = P_nombre,
        apellido = P_apellido,
        telefono = P_telefono,
        email = P_email,
        id_direccion = P_id_direccion,
        id_estado = P_id_estado
    WHERE id_cliente = P_id_cliente;
END;
/

-- Actualizaci�n tabla Cargo
CREATE OR REPLACE PROCEDURE FIDE_cargoActualizar_SP (
    P_id_cargo NUMBER,
    P_descripcion_cargo VARCHAR2,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_cargo_TB
    SET descripcion_cargo = P_descripcion_cargo,
        id_estado = P_id_estado
    WHERE id_cargo = P_id_cargo;
END;
/

-- Actualizaci�n tabla Direccion

CREATE OR REPLACE PROCEDURE FIDE_direccionActualizar_SP (
    P_id_direccion NUMBER,
    P_detalle_direccion VARCHAR2,
    P_codigo_postal VARCHAR2,
    P_id_distrito NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_direccion_TB
    SET detalle_direccion = P_detalle_direccion,
        codigo_postal = P_codigo_postal,
        id_distrito = P_id_distrito,
        id_estado = P_id_estado
    WHERE id_direccion = P_id_direccion;
END;
/

-- Actualizaci�n tabla Pais

CREATE OR REPLACE PROCEDURE FIDE_paisActualizar_SP (
    P_id_pais NUMBER,
    P_nombre_pais VARCHAR2,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_pais_TB
    SET nombre_pais = P_nombre_pais,
        id_estado = P_id_estado
    WHERE id_pais = P_id_pais;
END;
/

-- Actualizaci�n tabla Provincia
CREATE OR REPLACE PROCEDURE FIDE_provinciaActualizar_SP (
    P_id_provincia NUMBER,
    P_nombre_provincia VARCHAR2,
    P_id_pais NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_provincia_TB
    SET nombre_provincia = P_nombre_provincia,
        id_pais = P_id_pais,
        id_estado = P_id_estado
    WHERE id_provincia = P_id_provincia;
END;
/


-- Actualizaci�n tabla Distrito
CREATE OR REPLACE PROCEDURE FIDE_distritoActualizar_SP (
    P_id_distrito NUMBER,
    P_nombre_distrito VARCHAR2,
    P_id_provincia NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_distrito_TB
    SET nombre_distrito = P_nombre_distrito,
        id_provincia = P_id_provincia,
        id_estado = P_id_estado
    WHERE id_distrito = P_id_distrito;
END;
/


-- Actualizaci�n tabla Inventario
CREATE OR REPLACE PROCEDURE FIDE_inventarioActualizar_SP (
    P_id_ingrediente NUMBER,
    P_nombre_ingrediente VARCHAR2,
    P_stock NUMBER,
    P_unidad_medida VARCHAR2,
    P_id_compra NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_inventario_TB
    SET nombre_ingrediente = P_nombre_ingrediente,
        stock = P_stock,
        unidad_medida = P_unidad_medida,
        id_compra = P_id_compra,
        id_estado = P_id_estado
    WHERE id_ingrediente = P_id_ingrediente;
END;
/


-- Actualizaci�n tabla Compra de Inventario
CREATE OR REPLACE PROCEDURE FIDE_compra_inventarioActualizar_SP (
    P_id_compra NUMBER,
    P_fecha_compra DATE,
    P_monto_total NUMBER,
    P_id_proveedor NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_compra_inventario_TB
    SET fecha_compra = P_fecha_compra,
        monto_total = P_monto_total,
        id_proveedor = P_id_proveedor,
        id_estado = P_id_estado
    WHERE id_compra = P_id_compra;
END;
/


-- Actualizaci�n tabla Detalle de compra inventario
CREATE OR REPLACE PROCEDURE FIDE_detalle_compra_inventarioActualizar_SP (
    P_id_detalle_inventario NUMBER,
    P_cantidad NUMBER,
    P_costo_unitario NUMBER,
    P_id_ingrediente NUMBER,
    P_id_compra NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_detalle_compra_inventario_TB
    SET cantidad = P_cantidad,
        costo_unitario = P_costo_unitario,
        id_ingrediente = P_id_ingrediente,
        id_compra = P_id_compra,
        id_estado = P_id_estado
    WHERE id_detalle_inventario = P_id_detalle_inventario;
END;
/

-- Actualizaci�n tabla Pedido ingredientes
CREATE OR REPLACE PROCEDURE FIDE_pedidos_ingredienteActualizar_SP (
    P_id_pedidos_ingrediente NUMBER,
    P_cantidad_requerida NUMBER,
    P_id_producto NUMBER,
    P_id_ingrediente NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_pedidos_ingrediente_TB
    SET cantidad_requerida = P_cantidad_requerida,
        id_producto = P_id_producto,
        id_ingrediente = P_id_ingrediente,
        id_estado = P_id_estado
    WHERE id_pedidos_ingrediente = P_id_pedidos_ingrediente;
END;
/

-- Actualizaci�n tabla Categoria
CREATE OR REPLACE PROCEDURE FIDE_categoriaActualizar_SP (
    P_id_categoria NUMBER,
    P_nombre VARCHAR2,
    P_descripcion VARCHAR2,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_categoria_TB
    SET nombre = P_nombre,
        descripcion = P_descripcion,
        id_estado = P_id_estado
    WHERE id_categoria = P_id_categoria;
END;
/



-- Actualizaci�n tabla Producto
CREATE OR REPLACE PROCEDURE FIDE_productoActualizar_SP (
    P_id_producto NUMBER,
    P_nombre VARCHAR2,
    P_descripcion VARCHAR2,
    P_precio NUMBER,
    P_id_categoria NUMBER,
    P_id_estado NUMBER
) AS
BEGIN
    UPDATE FIDE_producto_TB
    SET nombre = P_nombre,
        descripcion = P_descripcion,
        precio = P_precio,
        id_categoria = P_id_categoria,
        id_estado = P_id_estado
    WHERE id_producto = P_id_producto;
END;
/

--------------------------------------------------------------------------------- Procedimientos --------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------- Procedimientos de Delete(borrado l�gico) ----------------------------------------------------------------------------------


-- Actualizar estado de tabla Detalle Orden 
CREATE OR REPLACE PROCEDURE FIDE_detalle_ordenEliminar_SP (
    P_id_detalle_orden NUMBER
) AS
BEGIN
    UPDATE FIDE_detalle_orden_TB
    SET id_estado = 0
    WHERE id_detalle_orden = P_id_detalle_orden;
    COMMIT;
END;
/

-- Actualizar estado de tabla Orden 
CREATE OR REPLACE PROCEDURE FIDE_ordenEliminar_SP (
    P_id_orden NUMBER
) AS
BEGIN
    UPDATE FIDE_orden_TB
    SET id_estado = 0
    WHERE id_orden = P_id_orden;
    COMMIT;
END;
/

-- Actualizar estado de tabla Empleado 
CREATE OR REPLACE PROCEDURE FIDE_empleadoEliminar_SP (
    P_id_empleado NUMBER
) AS
BEGIN
    UPDATE FIDE_empleado_TB
    SET id_estado = 0
    WHERE id_empleado = P_id_empleado;
    COMMIT;
END;
/

-- Actualizar estado de tabla Sucursal 
CREATE OR REPLACE PROCEDURE FIDE_sucursalEliminar_SP (
    P_id_sucursal NUMBER
) AS
BEGIN
    UPDATE FIDE_sucursal_TB
    SET id_estado = 0
    WHERE id_sucursal = P_id_sucursal;
    COMMIT;
END;
/

-- Actualizar estado de tabla Pago 
CREATE OR REPLACE PROCEDURE FIDE_pagoEliminar_SP (
    P_id_pago NUMBER
) AS
BEGIN
    UPDATE FIDE_pago_TB
    SET id_estado = 0
    WHERE id_pago = P_id_pago;
    COMMIT;
END;
/

-- Actualizar estado de tabla Metodo de Pago 
CREATE OR REPLACE PROCEDURE FIDE_metodo_pagoEliminar_SP (
    P_id_metodo_pago NUMBER
) AS
BEGIN
    UPDATE FIDE_metodo_pago_TB
    SET id_estado = 0
    WHERE id_metodo_pago = P_id_metodo_pago;
    COMMIT;
END;
/

-- Actualizar estado de tabla Proveedor
CREATE OR REPLACE PROCEDURE FIDE_proveedorEliminar_SP (
    P_id_proveedor NUMBER
) AS
BEGIN
    UPDATE FIDE_proveedor_TB
    SET id_estado = 0
    WHERE id_proveedor = P_id_proveedor;
    COMMIT;
END;
/

-- Actualizar estado de tabla Cliente 
CREATE OR REPLACE PROCEDURE FIDE_clienteEliminar_SP (
    P_id_cliente NUMBER
) AS
BEGIN
    UPDATE FIDE_cliente_TB
    SET id_estado = 0
    WHERE id_cliente = P_id_cliente;
    COMMIT;
END;
/

-- Actualizar estado de tabla Cargo 
CREATE OR REPLACE PROCEDURE FIDE_cargoEliminar_SP (
    P_id_cargo NUMBER
) AS
BEGIN
    UPDATE FIDE_cargo_TB
    SET id_estado = 0
    WHERE id_cargo = P_id_cargo;
    COMMIT;
END;
/

-- Actualizar estado de tabla Direccion
CREATE OR REPLACE PROCEDURE FIDE_direccionEliminar_SP (
    P_id_direccion NUMBER
) AS
BEGIN
    UPDATE FIDE_direccion_TB
    SET id_estado = 0
    WHERE id_direccion = P_id_direccion;
    COMMIT;
END;
/

-- Actualizar estado de tabla Pais
CREATE OR REPLACE PROCEDURE FIDE_paisEliminar_SP (
    P_id_pais NUMBER
) AS
BEGIN
    UPDATE FIDE_pais_TB
    SET id_estado = 0
    WHERE id_pais = P_id_pais;
    COMMIT;
END;
/

-- Actualizar estado de tabla Provincia
CREATE OR REPLACE PROCEDURE FIDE_provinciaEliminar_SP (
    P_id_provincia NUMBER
) AS
BEGIN
    UPDATE FIDE_provincia_TB
    SET id_estado = 0
    WHERE id_provincia = P_id_provincia;
    COMMIT;
END;
/

-- Actualizar estado de tabla Distrito
CREATE OR REPLACE PROCEDURE FIDE_distritoEliminar_SP (
    P_id_distrito NUMBER
) AS
BEGIN
    UPDATE FIDE_distrito_TB
    SET id_estado = 0
    WHERE id_distrito = P_id_distrito;
    COMMIT;
END;
/

-- Actualizar estado de tabla Inventario
CREATE OR REPLACE PROCEDURE FIDE_inventarioEliminar_SP (
    P_id_ingrediente NUMBER
) AS
BEGIN
    UPDATE FIDE_inventario_TB
    SET id_estado = 0
    WHERE id_ingrediente = P_id_ingrediente;
    COMMIT;
END;
/

-- Actualizar estado de tabla Compra Inventario
CREATE OR REPLACE PROCEDURE FIDE_compra_inventarioEliminar_SP (
    P_id_compra NUMBER
) AS
BEGIN
    UPDATE FIDE_compra_inventario_TB
    SET id_estado = 0
    WHERE id_compra = P_id_compra;
    COMMIT;
END;
/

-- Actualizar estado de tabla Detalle Compra Inventario
CREATE OR REPLACE PROCEDURE FIDE_detalle_compra_inventarioEliminar_SP (
    P_id_detalle_inventario NUMBER
) AS
BEGIN
    UPDATE FIDE_detalle_compra_inventario_TB
    SET id_estado = 0
    WHERE id_detalle_inventario = P_id_detalle_inventario;
    COMMIT;
END;
/

-- Actualizar estado de tabla Pedido Ingrediente
CREATE OR REPLACE PROCEDURE FIDE_pedidos_ingredienteEliminar_SP (
    P_id_pedidos_ingrediente NUMBER
) AS
BEGIN
    UPDATE FIDE_pedidos_ingrediente_TB
    SET id_estado = 0
    WHERE id_pedidos_ingrediente = P_id_pedidos_ingrediente;
    COMMIT;
END;
/

-- Actualizar estado de tabla Categoria
CREATE OR REPLACE PROCEDURE FIDE_categoriaEliminar_SP (
    P_id_categoria NUMBER
) AS
BEGIN
    UPDATE FIDE_categoria_TB
    SET id_estado = 0
    WHERE id_categoria = P_id_categoria;
    COMMIT;
END;
/

-- Actualizar estado de tabla Producto
CREATE OR REPLACE PROCEDURE FIDE_productoEliminar_SP (
    P_id_producto NUMBER
) AS
BEGIN
    UPDATE FIDE_producto_TB
    SET id_estado = 0
    WHERE id_producto = P_id_producto;
    COMMIT;
END;
/
--------------------------------------------------------------------------------- Vistas --------------------------------------------------------------------------------------------
-- 1. Vista Materializada para FIDE_estado_TB
CREATE MATERIALIZED VIEW FIDE_estado_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT id_estado, Descripcion_Estado
FROM FIDE_estado_TB;

-- 2. Vista Materializada para FIDE_pais_TB
CREATE MATERIALIZED VIEW FIDE_pais_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT p.id_pais, p.nombre_pais, p.id_estado, e.Descripcion_Estado
FROM FIDE_pais_TB p
JOIN FIDE_estado_TB e ON p.id_estado = e.id_estado;

-- 3. Vista Materializada para FIDE_provincia_TB
CREATE MATERIALIZED VIEW FIDE_provincia_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT pr.id_provincia, pr.nombre_provincia, pr.id_pais, p.nombre_pais, 
       pr.id_estado, e.Descripcion_Estado
FROM FIDE_provincia_TB pr
JOIN FIDE_pais_TB p ON pr.id_pais = p.id_pais
JOIN FIDE_estado_TB e ON pr.id_estado = e.id_estado;

-- 4. Vista Materializada para FIDE_distrito_TB
CREATE MATERIALIZED VIEW FIDE_distrito_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT d.id_distrito, d.nombre_distrito, d.id_provincia, p.nombre_provincia,
       d.id_estado, e.Descripcion_Estado
FROM FIDE_distrito_TB d
JOIN FIDE_provincia_TB p ON d.id_provincia = p.id_provincia
JOIN FIDE_estado_TB e ON d.id_estado = e.id_estado;

-- 5. Vista Simple para FIDE_direccion_TB
CREATE OR REPLACE VIEW FIDE_direccion_VW AS
SELECT dir.id_direccion, dir.detalle_direccion, dir.codigo_postal, 
       dir.id_distrito, d.nombre_distrito, dir.id_estado, e.Descripcion_Estado
FROM FIDE_direccion_TB dir
JOIN FIDE_distrito_TB d ON dir.id_distrito = d.id_distrito
JOIN FIDE_estado_TB e ON dir.id_estado = e.id_estado;

-- 6. Vista Materializada para FIDE_cargo_TB
CREATE MATERIALIZED VIEW FIDE_cargo_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT c.id_cargo, c.descripcion_cargo, c.id_estado, e.Descripcion_Estado
FROM FIDE_cargo_TB c
JOIN FIDE_estado_TB e ON c.id_estado = e.id_estado;

-- 7. Vista Materializada para FIDE_sucursal_TB
CREATE MATERIALIZED VIEW FIDE_sucursal_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT s.id_sucursal, s.nombre, s.telefono, s.id_direccion, 
       d.detalle_direccion, d.codigo_postal, s.id_estado, e.Descripcion_Estado
FROM FIDE_sucursal_TB s
JOIN FIDE_direccion_TB d ON s.id_direccion = d.id_direccion
JOIN FIDE_estado_TB e ON s.id_estado = e.id_estado;

-- 8. Vista Simple para FIDE_cliente_TB
CREATE OR REPLACE VIEW FIDE_cliente_VW AS
SELECT c.id_cliente, c.nombre, c.apellido, c.telefono, c.email, 
       c.id_direccion, d.detalle_direccion, c.id_estado, e.Descripcion_Estado
FROM FIDE_cliente_TB c
JOIN FIDE_direccion_TB d ON c.id_direccion = d.id_direccion
JOIN FIDE_estado_TB e ON c.id_estado = e.id_estado;

-- 9. Vista Simple para FIDE_proveedor_TB
CREATE OR REPLACE VIEW FIDE_proveedor_VW AS
SELECT p.id_proveedor, p.nombre, p.telefono, p.email, 
       p.id_direccion, d.detalle_direccion, 
       p.id_sucursal, s.nombre AS nombre_sucursal,
       p.id_estado, e.Descripcion_Estado
FROM FIDE_proveedor_TB p
JOIN FIDE_direccion_TB d ON p.id_direccion = d.id_direccion
JOIN FIDE_sucursal_TB s ON p.id_sucursal = s.id_sucursal
JOIN FIDE_estado_TB e ON p.id_estado = e.id_estado;

-- 10. Vista Simple para FIDE_empleado_TB
CREATE OR REPLACE VIEW FIDE_empleado_VW AS
SELECT e.id_empleado, e.nombre, e.apellido, 
       e.id_cargo, c.descripcion_cargo, 
       e.id_sucursal, s.nombre AS nombre_sucursal,
       e.id_estado, est.Descripcion_Estado
FROM FIDE_empleado_TB e
JOIN FIDE_cargo_TB c ON e.id_cargo = c.id_cargo
JOIN FIDE_sucursal_TB s ON e.id_sucursal = s.id_sucursal
JOIN FIDE_estado_TB est ON e.id_estado = est.id_estado;

-- 11. Vista Materializada para FIDE_metodo_pago_TB
CREATE MATERIALIZED VIEW FIDE_metodo_pago_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT mp.id_metodo_pago, mp.descripcion_metodo_pago, 
       mp.id_estado, e.Descripcion_Estado
FROM FIDE_metodo_pago_TB mp
JOIN FIDE_estado_TB e ON mp.id_estado = e.id_estado;

-- 12. Vista Materializada para FIDE_categoria_TB
CREATE MATERIALIZED VIEW FIDE_categoria_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT c.id_categoria, c.nombre, c.descripcion, 
       c.id_estado, e.Descripcion_Estado
FROM FIDE_categoria_TB c
JOIN FIDE_estado_TB e ON c.id_estado = e.id_estado;

-- 13. Vista Materializada para FIDE_producto_TB
CREATE MATERIALIZED VIEW FIDE_producto_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT p.id_producto, p.nombre, p.descripcion, p.precio, 
       p.id_categoria, c.nombre AS nombre_categoria,
       p.id_estado, e.Descripcion_Estado
FROM FIDE_producto_TB p
JOIN FIDE_categoria_TB c ON p.id_categoria = c.id_categoria
JOIN FIDE_estado_TB e ON p.id_estado = e.id_estado;

-- 14. Vista Simple para FIDE_compra_inventario_TB
CREATE OR REPLACE VIEW FIDE_compra_inventario_VW AS
SELECT ci.id_compra, ci.fecha_compra, ci.monto_total, 
       ci.id_proveedor, p.nombre AS nombre_proveedor,
       ci.id_estado, e.Descripcion_Estado
FROM FIDE_compra_inventario_TB ci
JOIN FIDE_proveedor_TB p ON ci.id_proveedor = p.id_proveedor
JOIN FIDE_estado_TB e ON ci.id_estado = e.id_estado;

-- 15. Vista Simple para FIDE_inventario_TB
CREATE OR REPLACE VIEW FIDE_inventario_VW AS
SELECT i.id_ingrediente, i.nombre_ingrediente, i.stock, i.unidad_medida, 
       i.id_compra, ci.fecha_compra,
       i.id_estado, e.Descripcion_Estado
FROM FIDE_inventario_TB i
JOIN FIDE_compra_inventario_TB ci ON i.id_compra = ci.id_compra
JOIN FIDE_estado_TB e ON i.id_estado = e.id_estado;

-- 16. Vista Simple para FIDE_detalle_compra_inventario_TB
CREATE OR REPLACE VIEW FIDE_detalle_compra_inventario_VW AS
SELECT dci.id_detalle_inventario, dci.cantidad, dci.costo_unitario, 
       dci.id_ingrediente, i.nombre_ingrediente,
       dci.id_compra, ci.fecha_compra,
       dci.id_estado, e.Descripcion_Estado
FROM FIDE_detalle_compra_inventario_TB dci
JOIN FIDE_inventario_TB i ON dci.id_ingrediente = i.id_ingrediente
JOIN FIDE_compra_inventario_TB ci ON dci.id_compra = ci.id_compra
JOIN FIDE_estado_TB e ON dci.id_estado = e.id_estado;

-- 17. Vista Materializada para FIDE_pedidos_ingrediente_TB
CREATE MATERIALIZED VIEW FIDE_pedidos_ingrediente_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT pi.id_pedidos_ingrediente, pi.cantidad_requerida, 
       pi.id_producto, p.nombre AS nombre_producto,
       pi.id_ingrediente, i.nombre_ingrediente,
       pi.id_estado, e.Descripcion_Estado
FROM FIDE_pedidos_ingrediente_TB pi
JOIN FIDE_producto_TB p ON pi.id_producto = p.id_producto
JOIN FIDE_inventario_TB i ON pi.id_ingrediente = i.id_ingrediente
JOIN FIDE_estado_TB e ON pi.id_estado = e.id_estado;

-- 18. Vista Simple para FIDE_orden_TB
CREATE OR REPLACE VIEW FIDE_orden_VW AS
SELECT o.id_orden, o.fecha, o.total, 
       o.id_cliente, c.nombre AS nombre_cliente, c.apellido AS apellido_cliente,
       o.id_sucursal, s.nombre AS nombre_sucursal,
       o.id_empleado, e.nombre AS nombre_empleado, e.apellido AS apellido_empleado,
       o.id_estado, est.Descripcion_Estado
FROM FIDE_orden_TB o
JOIN FIDE_cliente_TB c ON o.id_cliente = c.id_cliente
JOIN FIDE_sucursal_TB s ON o.id_sucursal = s.id_sucursal
JOIN FIDE_empleado_TB e ON o.id_empleado = e.id_empleado
JOIN FIDE_estado_TB est ON o.id_estado = est.id_estado;

-- 19. Vista Simple para FIDE_detalle_orden_TB
CREATE OR REPLACE VIEW FIDE_detalle_orden_VW AS
SELECT do.id_detalle_orden, do.cantidad, do.precio_unitario, 
       do.id_orden, o.fecha AS fecha_orden,
       do.id_producto, p.nombre AS nombre_producto,
       do.id_estado, e.Descripcion_Estado
FROM FIDE_detalle_orden_TB do
JOIN FIDE_orden_TB o ON do.id_orden = o.id_orden
JOIN FIDE_producto_TB p ON do.id_producto = p.id_producto
JOIN FIDE_estado_TB e ON do.id_estado = e.id_estado;

-- 20. Vista Simple para FIDE_pago_TB
CREATE OR REPLACE VIEW FIDE_pago_VW AS
SELECT p.id_pago, p.fecha_pago, p.monto, 
       p.metodo_pago, mp.descripcion_metodo_pago,
       p.id_orden, o.fecha AS fecha_orden,
       p.id_estado, e.Descripcion_Estado
FROM FIDE_pago_TB p
JOIN FIDE_metodo_pago_TB mp ON p.metodo_pago = mp.id_metodo_pago
JOIN FIDE_orden_TB o ON p.id_orden = o.id_orden
JOIN FIDE_estado_TB e ON p.id_estado = e.id_estado;

-- Vista Materializada para an�lisis de ventas por cliente
CREATE MATERIALIZED VIEW FIDE_analisis_ventas_cliente_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT 
    c.id_cliente,
    c.nombre || ' ' || c.apellido AS nombre_completo,
    COUNT(o.id_orden) AS total_ordenes,
    SUM(o.total) AS monto_total_compras,
    AVG(o.total) AS promedio_por_orden,
    MIN(o.fecha) AS primera_compra,
    MAX(o.fecha) AS ultima_compra,
    COUNT(DISTINCT o.id_sucursal) AS sucursales_visitadas
FROM FIDE_cliente_TB c
JOIN FIDE_orden_TB o ON c.id_cliente = o.id_cliente
WHERE o.id_estado = (SELECT id_estado FROM FIDE_estado_TB WHERE Descripcion_Estado = 'ACTIVO')
GROUP BY c.id_cliente, c.nombre, c.apellido;

-- Vista Materializada para an�lisis de productos m�s vendidos
CREATE MATERIALIZED VIEW FIDE_productos_top_MV
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT 
    p.id_producto,
    p.nombre,
    p.descripcion,
    p.precio,
    c.nombre AS categoria,
    SUM(do.cantidad) AS unidades_vendidas,
    SUM(do.cantidad * do.precio_unitario) AS ingresos_totales,
    COUNT(DISTINCT o.id_orden) AS apariciones_en_ordenes
FROM FIDE_producto_TB p
JOIN FIDE_categoria_TB c ON p.id_categoria = c.id_categoria
JOIN FIDE_detalle_orden_TB do ON p.id_producto = do.id_producto
JOIN FIDE_orden_TB o ON do.id_orden = o.id_orden
WHERE p.id_estado = (SELECT id_estado FROM FIDE_estado_TB WHERE Descripcion_Estado = 'ACTIVO')
GROUP BY p.id_producto, p.nombre, p.descripcion, p.precio, c.nombre
ORDER BY unidades_vendidas DESC;
COMMIT;