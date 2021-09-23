# recasta integrations
Integrations into external systems for our forever free cloud, using the free single-target API. To enable as much as possible modularization we have split the plugins into two main streams:  

* ### generic packages
   * [pkg](pkg)  
   pkg contains shared code to connect to our single target and free API, retrieve token and iterate over /objects to find devices in the desired namespace  
   * [redisstream](redistream)  
   shared code for generic cache and stream, based on redis. This package can be included into future plugins.
   
* ### Plugins and connectors
   * [Elastic](Elastic)  
   extract data from recasta.cloud for [Elastic](https://elastic.co).
   * [Timeseries](timeseries)  
   [Redis-timeseries](https://oss.redislabs.com/redistimeseries/) with [Grafana](https://grafana.com/) for Time Series Analysis and rapid prototyping, can be used in production when configured as a Redis cluster and ready to be hosted via [Redis-Cloud](https://redislabs.com/redis-enterprise-cloud/overview/). 
   * [SAPHana](SAPHana)  
   extract data from recasta.cloud for [SAP Hana](https://www.sap.com/products/hana.html)
   * [Snowflake](Snowflake)  
   extract data from recasta.cloud for [Snowflake](https://www.snowflake.com/)  
   * [Cloud Connect](CloudConnect)  
   extract data from recasta.cloud to AWS, GCP and Azure blob storage offering. This plugin enables customers to use their own cloud infrastructure and extract data from recasta.cloud for to other services, like [Scalytics](https://www.scalytics.io), using their own cloud native data pipelines and integration tools. 
  
More plugins will follow, please refer to the plugin directory for any developer friendly documentation.
  
## Building plugins
checkout and build docker based environments starting in the / directory of plugins, like:  
```
git clone https://github.com/recasta/integrations.git  
cd plugins  
docker-compose -f timeseries/docker-compose.yml --project-directory . up --build
```
Please read the notes in the different plugin directories how to set ```username``` / ```password``` and API Endpoint (if not using [recasta.cloud](https://control.recasta.cloud)).  

## Deploy to any Kubernetes / OpenShift  
We recommend to use [kompose](https://kompose.io/) to translate the dockerfiles into kubernetes ready deployments. As example:  
```
# verify that it works via docker-compose  
docker-compose -f Elastic/docker-compose.yml --project-directory . up --build  
  
# convert to k8s yaml  
kompose -f Elastic/docker-compose.yml convert  
  
# prepare env - this makes sure that when we run `docker build` the image is accessible via minikube  
eval $(minikube docker-env)  
  
# build images and change the image name so that the k8s cluster doesn't try to pull it from some registry  
docker build -f ./redisstream/Dockerfile -t redisstream:0.0.1 . # change the image in producer-pod.yaml to redisstream:0.0.1  
docker build -f ./Elastic/Dockerfile -t elastic:0.0.1 . # change the image in consumer-pod.yaml to elastic:0.0.1  
  
# apply each yaml file
kubectl apply -f xxx.yaml  
  
# verify that it's working, eg via logs  
kubectl logs producer  

```

