# How to Dockerize a sveltekit app?

This is a demo project to help you dockerize your sveltekit app

## How to use it?

```sh
npm install
docker build --tag sveltekit-test .
docker-compose up
```

Then open `http://localhost:5173/`

### Verify your .dockerignore and build context

To test what's in your current build context and verify your `.dockerignore` file you can do the following (copy-paste in your cli):

```sh
#  create an image that includes the entire build context
docker build -t test-context -f - . <<EOF
FROM busybox
COPY . /context
WORKDIR /context
CMD find .
EOF

# run the image which executes the find command
docker container run --rm test-context

# cleanup the built image
docker image rm test-context
```
