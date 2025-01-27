-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña TEXT NOT NULL,
    direccion TEXT,
    telefono VARCHAR(15),
    rol VARCHAR(20) CHECK (rol IN ('cliente', 'admin', 'repartidor')) DEFAULT 'cliente',
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de categorías
CREATE TABLE IF NOT EXISTS categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion TEXT,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de productos
CREATE TABLE IF NOT EXISTS productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    categoria_id INT REFERENCES categorias(id) ON DELETE SET NULL,
    imagen VARCHAR(255),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de carrito de compras
CREATE TABLE IF NOT EXISTS carrito (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id) ON DELETE CASCADE,
    producto_id INT REFERENCES productos(id) ON DELETE CASCADE,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    agregado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id) ON DELETE SET NULL,
    estado VARCHAR(20) CHECK (estado IN ('pendiente', 'enviado', 'entregado', 'cancelado')) DEFAULT 'pendiente',
    metodo_pago VARCHAR(20) CHECK (metodo_pago IN ('tarjeta', 'paypal', 'efectivo')),
    total DECIMAL(10,2) NOT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de detalles de pedidos
CREATE TABLE IF NOT EXISTS pedido_detalles (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id) ON DELETE CASCADE,
    producto_id INT REFERENCES productos(id) ON DELETE SET NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL
);

-- Crear la tabla de entregas
CREATE TABLE IF NOT EXISTS entregas (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(id) ON DELETE CASCADE,
    repartidor_id INT REFERENCES usuarios(id) ON DELETE SET NULL,
    direccion_entrega TEXT NOT NULL,
    fecha_entrega DATE,
    estado VARCHAR(20) CHECK (estado IN ('pendiente', 'en camino', 'entregado')) DEFAULT 'pendiente'
);

-- Insertar datos de ejemplo en la tabla de usuarios
INSERT INTO usuarios (nombre, correo, contraseña, direccion, telefono, rol)
VALUES
('Juan Pérez', 'juan.perez@example.com', 'password123', 'Calle Falsa 123', '555-1234', 'cliente'),
('Ana Gómez', 'ana.gomez@example.com', 'password123', 'Avenida Siempre Viva 456', '555-5678', 'admin');

-- Insertar datos de ejemplo en la tabla de categorías
INSERT INTO categorias (nombre, descripcion)
VALUES
('Electrónica', 'Productos electrónicos'),
('Ropa', 'Ropa de moda');

-- Insertar datos de ejemplo en la tabla de productos
INSERT INTO productos (nombre, descripcion, precio, stock, categoria_id, imagen)
VALUES
('Smartphone', 'Teléfono móvil Android', 199.99, 50, 1, 'smartphone.jpg'),
('Camiseta', 'Camiseta de algodón', 15.99, 100, 2, 'camiseta.jpg');

-- Insertar datos de ejemplo en la tabla de pedidos
INSERT INTO pedidos (usuario_id, estado, metodo_pago, total)
VALUES
(1, 'pendiente', 'tarjeta', 215.98),
(2, 'enviado', 'paypal', 231.97);

-- Insertar datos de ejemplo en la tabla de detalles de pedidos
INSERT INTO pedido_detalles (pedido_id, producto_id, cantidad, precio_unitario)
VALUES
(1, 1, 1, 199.99),
(1, 2, 1, 15.99),
(2, 1, 1, 199.99),
(2, 2, 2, 15.99);

-- Insertar datos de ejemplo en la tabla de entregas
INSERT INTO entregas (pedido_id, repartidor_id, direccion_entrega, fecha_entrega, estado)
VALUES
(1, 1, 'Calle Falsa 123', '2025-01-28', 'en camino'),
(2, 2, 'Avenida Siempre Viva 456', '2025-01-28', 'pendiente');
