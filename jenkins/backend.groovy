pipeline {
    agent {
        node {
            label 'maven'
        }

    }
    stages {
        stage('clone code') {
            agent none
            steps {
                container('maven') {
                    git(url: 'https://gitee.com/woniu9524/codeonline.git', branch: 'master', changelog: true, poll: false)
                }

            }
        }

        stage('maven build') {
            agent none
            steps {
                container('maven') {
                    sh 'mvn clean package -D maven.test.skip=true'
                    sh '''cp ./codeonline-gateway/target/codeonline-gateway.jar ./docker/ruoyi/gateway/jar;

cp ./codeonline-auth/target/codeonline-auth.jar ./docker/ruoyi/auth/jar;

cp ./codeonline-visual/codeonline-monitor/target/codeonline-visual-monitor.jar  ./docker/ruoyi/visual/monitor/jar;

cp ./codeonline-modules/codeonline-system/target/codeonline-modules-system.jar ./docker/ruoyi/modules/system/jar;

cp ./codeonline-modules/codeonline-file/target/codeonline-modules-file.jar ./docker/ruoyi/modules/file/jar;

cp ./codeonline-modules/codeonline-job/target/codeonline-modules-job.jar ./docker/ruoyi/modules/job/jar;


cp ./codeonline-modules/codeonline-cloud/target/codeonline-modules-cloud.jar ./docker/ruoyi/modules/cloud/jar;

cp ./codeonline-modules/codeonline-function/target/codeonline-modules-function.jar ./docker/ruoyi/modules/function/jar;'''
                }

            }
        }

        stage('docker build') {
            agent none
            steps {
                container('maven') {
                    sh 'docker build -t codeonlie-auth:$IMAGE_TAG ./docker/ruoyi/auth'
                    sh 'docker build -t codeonlie-gateway:$IMAGE_TAG ./docker/ruoyi/gateway'
                    sh 'docker build -t codeonlie-modules-file:$IMAGE_TAG ./docker/ruoyi/modules/file'
                    sh 'docker build -t codeonlie-modules-job:$IMAGE_TAG ./docker/ruoyi/modules/job'
                    sh 'docker build -t codeonlie-modules-system:$IMAGE_TAG ./docker/ruoyi/modules/system'
                    sh 'docker build -t codeonlie-visual-monitor:$IMAGE_TAG ./docker/ruoyi/visual/monitor'
                    sh '''ls
docker build -t codeonlie-modules-cloud:$IMAGE_TAG ./docker/ruoyi/modules/cloud'''
                    sh '''ls -l
docker build -t codeonlie-modules-function:$IMAGE_TAG ./docker/ruoyi/modules/function'''
                }

            }
        }

        stage('login harbor') {
            agent none
            steps {
                container('maven') {
                    sh 'docker login $REGISTRY -u \'admin\' -p \'Harbor12345\''
                }

            }
        }

        stage('default-4') {
            parallel {
                stage('push auth latest') {
                    agent none
                    steps {
                        container('maven') {
                            sh 'docker tag  codeonlie-auth:$IMAGE_TAG  $REGISTRY/codeonline-dev/codeonlie-auth:$IMAGE_TAG'
                            sh 'docker push $REGISTRY/codeonline-dev/codeonlie-auth:$IMAGE_TAG'
                        }

                    }
                }

                stage('push gateway latest') {
                    agent none
                    steps {
                        container('maven') {
                            sh 'docker tag codeonlie-gateway:$IMAGE_TAG $REGISTRY/codeonline-dev/codeonlie-gateway:$IMAGE_TAG'
                            sh 'docker push $REGISTRY/codeonline-dev/codeonlie-gateway:$IMAGE_TAG'
                        }

                    }
                }

                stage('push modules latest') {
                    agent none
                    steps {
                        container('maven') {
                            sh 'docker tag codeonlie-modules-file:$IMAGE_TAG $REGISTRY/codeonline-dev/codeonlie-modules-file:$IMAGE_TAG'
                            sh 'docker push $REGISTRY/codeonline-dev/codeonlie-modules-file:$IMAGE_TAG'
                            sh 'docker tag codeonlie-modules-job:$IMAGE_TAG $REGISTRY/codeonline-dev/codeonlie-modules-job:$IMAGE_TAG'
                            sh 'docker push $REGISTRY/codeonline-dev/codeonlie-modules-job:$IMAGE_TAG'
                            sh 'docker tag codeonlie-modules-system:$IMAGE_TAG $REGISTRY/codeonline-dev/codeonlie-modules-system:$IMAGE_TAG'
                            sh '''docker tag codeonlie-modules-cloud:$IMAGE_TAG $REGISTRY/codeonline-dev/codeonlie-modules-cloud:$IMAGE_TAG
docker push $REGISTRY/codeonline-dev/codeonlie-modules-cloud:$IMAGE_TAG'''
                            sh '''docker tag codeonlie-modules-function:$IMAGE_TAG $REGISTRY/codeonline-dev/codeonlie-modules-function:$IMAGE_TAG
docker push $REGISTRY/codeonline-dev/codeonlie-modules-function:$IMAGE_TAG'''
                        }

                    }
                }

                stage('push visual latest') {
                    agent none
                    steps {
                        container('maven') {
                            sh 'docker tag codeonlie-visual-monitor:$IMAGE_TAG $REGISTRY/codeonline-dev/codeonlie-visual-monitor:$IMAGE_TAG'
                            sh 'docker push $REGISTRY/codeonline-dev/codeonlie-visual-monitor:$IMAGE_TAG'
                        }

                    }
                }

            }
        }

        stage('deploy to dev') {
            agent none
            steps {
                container('maven') {
                    withCredentials([kubeconfigFile(credentialsId : 'k8s-config' ,variable : 'KUBECONFIG' ,)]) {
                        sh 'mkdir -p ~/.kube/'
                        sh '''echo "$KUBECONFIG_CONFIG" > ~/.kube/config
filenames=(
  "codeonline-auth"
  "codeonline-gateway"
  "codeonline-visual-monitor"
  "codeonline-modules-job"
  "codeonline-modules-system"
  "codeonline-modules-file"
  "codeonline-modules-cloud"
  "codeonline-modules-function"
  )
for item in "${filenames[@]}"
do
  sed -i s/REGISTRY_VAR/$REGISTRY/ docker/deploy/$item/deployment.ymal
  sed -i s/HARBOR_NAMESPACE_VAR/$HARBOR_NAMESPACE/ docker/deploy/$item/deployment.ymal
  sed -i s/IMAGE_TAG_VAR/$IMAGE_TAG/ docker/deploy/$item/deployment.ymal
done'''
                        sh 'kubectl apply -f docker/deploy/codeonline-auth/deployment.ymal -f docker/deploy/codeonline-auth/service.ymal'
                        sh 'kubectl apply -f docker/deploy/codeonline-gateway/deployment.ymal -f docker/deploy/codeonline-gateway/service.ymal'
                        sh 'kubectl apply -f docker/deploy/codeonline-modules-system/deployment.ymal -f docker/deploy/codeonline-modules-system/service.ymal'
                        sh 'kubectl apply -f docker/deploy/codeonline-modules-file/deployment.ymal -f docker/deploy/codeonline-modules-file/service.ymal'
                        sh 'kubectl apply -f docker/deploy/codeonline-modules-job/deployment.ymal -f docker/deploy/codeonline-modules-job/service.ymal'
                        sh 'kubectl apply -f docker/deploy/codeonline-visual-monitor/deployment.ymal -f docker/deploy/codeonline-visual-monitor/service.ymal'
                        sh 'kubectl apply -f docker/deploy/codeonline-modules-cloud/deployment.ymal -f docker/deploy/codeonline-modules-cloud/service.ymal'
                        sh 'kubectl apply -f docker/deploy/codeonline-modules-function/deployment.ymal -f docker/deploy/codeonline-modules-function/service.ymal'
                    }

                }

            }
        }

    }
    environment {
        REGISTRY = '10.135.128.2:30002'
        HARBOR_NAMESPACE = 'codeonline-dev'
        IMAGE_TAG = '1.0.0'
    }
}