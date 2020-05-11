# istio-proxy-build-env
a docker build env for istio-proxy

u can build istio, istio-proxy in this docker which already installed bazel, clang, automake etc.
if u need build istio image in this docker, u need run like this:
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wade23/istio-proxy-build-env

# attension
default bazel version is 0.28.1 in Dockerfile,but u must chose appropriate bazel version to build defferent envoy version.
* 0.28.1 is for istio-proxy 1.3
* 1.1.0 is for istio-proxy 1.4

# script
u can run "start_envoy_docker_env.sh" to start docker env. 

# Use
docker build -t john_istio:0.1 .
docker run --rm -it john_istio:0.1 bash
