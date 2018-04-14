# Bower Compass Grunt

[![bower-compass-grunt](http://dockeri.co/image/alexisduque/bower-compass-grunt)](https://hub.docker.com/r/alexisduque/bower-compass-grunt/)

## Included
* Node
* Git
* Grunt
* Bower
* Compass
* Ruby

## Build image

```bash
docker build -t alexisduque/bower-compass-grunt
```

## Push build version to repository

```bash
docker push alexisduque/bower-compass-grunt 
```
## Usage
### GitLab CI
This is what my .gitlab-ci.yml looks like:

```yaml
image: alexisduque/bower-compass-grunt

stages:
- build

before_script:
- export GRADLE_USER_HOME=$(pwd)/.gradle
- chmod +x ./gradlew

cache:
  key: ${CI_PROJECT_ID}
  paths:
  - .gradle/

build:
  stage: build
  script:
  - cd openmrs-module-bahmniapps/ui
  - npm install
  - bower install
  - grunt test
  - grunt

  only:
    - master
  artifacts:
    paths:
    - app/dist/
```

### Without GitLab

```bash
docker pull alexisduque/bower-compass-grunt
```
Change directory to your project directory, then run:

```bash
docker run --tty --interactive --volume=$(pwd):/opt/workspace --user `id -u` --workdir=/opt/workspace --rm alexisduque/bower-compass-grunt /bin/sh -c "grunt"
```