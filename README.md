## Project Running Guidelines

#### Prerequisites:
* Must be setup [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) in your local machine

### Follow the steps one by one
1. clone `raremark` project repository in your local machine
2. go to `raremark` project repository `cd raremark`  
3. run `docker-compose -f docker-compose.yml -p=prj build` to build docker image, it will take some time
4. after build docker image run `docker-compose -f docker-compose.yml -p=prj up -d` in your terminal
5. after successfully running docker image go to web browser and write listed app name
    * For `Admin` app `http://localhost:3000`
    * For `Search` app `http://localhost:3001`
    * For `ElasticSearch` server `http://localhost:9200`   
6. For stop running project `docker-compose -f docker-compose.yml -p=prj down`
