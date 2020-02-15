## Project Setup Guidelines  

#### Prerequisites:
* Must be setup [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) in your local machine

### Project Setup
1. clone project repository in your local machine
2. go to project repository `cd project`  
3. execute `docker-compose -f docker-compose.yml -p=prj up --build -d` in your terminal
4. after successfully execute browse project your machine browser
    * For `Admin` app `http://localhost:3000`
    * For `Search` app `http://localhost:3001`
    * For `ElasticSearch` server `http://localhost:9200`   
5. For stop running project `docker-compose -f docker-compose.yml -p=prj down`
   
