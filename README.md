# pydio docker image

pydio version: 7.0.0

### Image tag

You can find this image in [docker hub](https://hub.docker.com/r/serenader/pydio/), and different image tag reflects to different pydio version.

- Image tag v1.0.0: pydio 6.4.2
- Image tag v2.0.0: pydio 7.0.0

### Default admin user

This is a preconfigured image, you don't need to setup your admin account and database yourself. The preconfigured account is:

```
User: admin
Password: adminadmin
```

### Usage

```bash
docker run --name some-pydio \
    -v /some/path/to/files:/var/www/pydio-core/data/files/ \
    -v /some/path/to/personal://var/www/pydio-core/data/personal/ \
    -v /some/path/to/mysql:/var/lib/mysql \
    -p 8888:80 \
    -d serenader/pydio
```

### Use an external mysql container

Although this image comes with a internal mysql database server, we recommend you use an external mysql container to store the data.

```bash
docker run --name some-pydio \
    -v /some/path/to/files:/var/www/pydio-core/data/files/ \
    -v /some/path/to/personal://var/www/pydio-core/data/personal/ \
    --link mysql:mysql \
    -p 8888:80 \
    -d serenader/pydio
```

### Use the internal mysql container

If you want to use the internal mysql database server instead of linking a mysql container, you don't have to do anything. The start up script will automatically check if there is an external database or not, if not, it will use the internal database. **Please use the internal database only in development environment.** If you use the internal database server, you may want to keep the data, just link the mysql folder to your host: `-v /some/path/to/mysql:/var/lib/mysql`.

### Environment variables

#### PYDIO_DB_HOST

The hostname of the mysql database.

#### PYDIO_DB_USER

The username of the mysql database.

#### PYDIO_DB_PASSWORD

The password of the mysql user.

#### PYDIO_DB_NAME

The pydio's database name

#### PYDIO_HOST

The hostname of pydio.
