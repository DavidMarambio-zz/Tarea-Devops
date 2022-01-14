# Tarea Postulación Desarrollador DevOps. Jr. <a href="https://app.bors.tech/repositories/40928"><img src="https://bors.tech/images/badge_small.svg" alt="Bors enabled"></a>

Este repositorio corresponde al desarrollo de la tarea relacionada con la postulación a Desarrollador DevOps Jr de la Universidad de Chile.

* [Requerimientos](#requerimientos)
* [Instrucciones iniciales](#instrucciones-iniciales)
    * [Variable de entorno](#variable-de-entorno)
    * [Correr aplicación](#correr-aplicación)
* [Imagen Pública](#imagen-pública)
* [Correr test](#correr-test)

## Requerimientos
Para poder levantar este proyecto con contenedores se requieren dos programas:

- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [docker-compose](https://docs.docker.com/compose/install/) 


## Instrucciones iniciales

Para levantar el sistema de forma local con Docker debes realizar los siguientes pasos:

1. Crear archivo .env con la variable de entorno solicitada
2. Construir la imagen y correrla como servicio en un contenedor

### 1. Variable de entorno

Se ha optado por asignar una variable de entorno a la aplicación para el correcto manejo del SECRET_KEY. Para crear un archivo (estando en la raiz del proyecto) y asignarle un valor a la variable, ejecuta el siguiente comando:

```
echo 'SECRET_KEY="<random-string>"' >> .env
```

### 2. Correr aplicación

Para esta tarea debemos construir la imagen de nuestra aplicación para luego correrla como un contenedor. Estos dos pasos podemos realizarlos con un solo comando:

```
docker-compose up -d --build
```

Una vez levantado el servicio, podemos acceder a la aplicación a través del link http://localhost:3005.

## Imagen pública

Actualmente existe una imagen pública del proyecto, la cual fue generado con el workflow de github actions.
Para poder utilizarla, se bede modificar el archivo docker-compose.yml en la siguientes lineas:

```
version: '3'
services:
  app:
    #build: ./
    image: ghcr.io/davidmarambio/tarea_devops:latest
    ...
```

## Correr test

Si deseas correr el test habilitado en la aplicación, podrás ejecutar los siguientes comandos una vez este corriendo tu aplicación a través de docker-compose.

Con comando docker-compose:
```
docker-compose exec app /bin/sh -c "pytest"
```

Con comando docker:
```
docker exec django pytest
```
