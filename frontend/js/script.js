document.getElementById('userForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const nombre = document.getElementById('nombre').value;
    const correo = document.getElementById('correo').value;
    const contraseña = document.getElementById('contraseña').value;

    // Llamada al backend para crear usuario (ejemplo con fetch)
    fetch('http://localhost:3000/crear_usuario', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ nombre, correo, contraseña })
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);
        alert('Usuario creado exitosamente');
        cargarUsuarios(); // Cargar la lista de usuarios actualizada
    })
    .catch(error => console.error('Error:', error));
});

// Función para cargar usuarios desde el backend
function cargarUsuarios() {
    fetch('http://localhost:3000/usuarios')
    .then(response => response.json())
    .then(data => {
        const tbody = document.getElementById('usuariosTable').getElementsByTagName('tbody')[0];
        tbody.innerHTML = ''; // Limpiar tabla
        data.forEach(usuario => {
            const row = tbody.insertRow();
            row.innerHTML = `<td>${usuario.nombre}</td><td>${usuario.correo}</td><td><button onclick="eliminarUsuario(${usuario.id})">Eliminar</button></td>`;
        });
    });
}

function eliminarUsuario(id) {
    fetch(`http://localhost:3000/eliminar_usuario/${id}`, { method: 'DELETE' })
    .then(response => response.json())
    .then(data => {
        console.log(data);
        cargarUsuarios(); // Cargar la lista de usuarios actualizada
    })
    .catch(error => console.error('Error:', error));
}

// Cargar usuarios al inicio
cargarUsuarios();
