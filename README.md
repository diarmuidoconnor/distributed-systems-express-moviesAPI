

Build the image with:

   $ docker build -t image_name .

Start the container with:

   $ docker run --env-file=./.env -p 8080:8080  -d image_name

