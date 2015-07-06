Docker image for running SSO for P2PU instances

Build image using

    docker build -t p2pu/sso:v1 .

Run image using


    docker run -it -p 5000:6666 --name sso -v `pwd`/logs:/var/logs/sso --link p2pu-postgres:p2pu-postgres
    -d p2pu/sso:v1

Requirements:

- Postgres db running in seperate image.
