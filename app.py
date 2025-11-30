from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def hello_world():
    #Obtenemos el nombre del host (será el ID del contenedor)
    hostname = socket.gethostname()
    return f'<h1>¡Hola desde un Contenedor Docker!</h1>' \
           f'<p>Servido por el host: <strong>{hostname}</strong></p>'

if __name__ == '__main__':
    # Ejecutamos la aplicación en todas las interfaces (0.0.0.0) y en el puerto 5000
    app.run(host='0.0.0.0', port=5000)