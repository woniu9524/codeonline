pipeline {
    agent {
        kubernetes {
            inheritFrom 'nodejs base'
            containerTemplate {
                name 'nodejs'
                image 'node:16.19.0'
            }

        }

    }
    stages {
        stage('Clone repository') {
            agent none
            steps {
                container('nodejs') {
                    git(url: 'https://gitee.com/woniu9524/codeonline-frontend.git', branch: 'master', changelog: true, poll: false)
                }

            }
        }

        stage('Run build') {
            agent none
            steps {
                container('nodejs') {
                    sh '''
yarn --registry=https://registry.npmmirror.com
yarn build:prod'''
                    sh 'cp -r ./dist ./nginx/'
                    sh 'ls ./nginx'
                }

            }
        }

        stage('docker push') {
            agent none
            steps {
                container('base') {
                    sh 'ls ./nginx'
                    sh 'docker build -t codeonlie-frontend:$IMAGE_TAG . -f ./nginx/dockerfile'
                    sh 'docker login $REGISTRY -u \'admin\' -p \'Harbor12345\''
                    sh 'docker tag codeonlie-frontend:$IMAGE_TAG $REGISTRY/$HARBOR_NAMESPACE/codeonlie-frontend:$IMAGE_TAG'
                    sh 'docker push $REGISTRY/$HARBOR_NAMESPACE/codeonlie-frontend:$IMAGE_TAG'
                }

            }
        }

        stage('deploy to dev') {
            agent none
            steps {
                container('base') {
                    withCredentials([kubeconfigFile(credentialsId : 'k8s-config' ,variable : 'KUBECONFIG' ,)]) {
                        sh 'mkdir -p ~/.kube/'
                        sh '''echo "$KUBECONFIG_CONFIG" > ~/.kube/config
sed -i s/REGISTRY_VAR/$REGISTRY/ nginx/deploy/deployment.ymal
sed -i s/HARBOR_NAMESPACE_VAR/$HARBOR_NAMESPACE/ nginx/deploy/deployment.ymal
sed -i s/IMAGE_TAG_VAR/$IMAGE_TAG/ nginx/deploy/deployment.ymal'''
                        sh 'kubectl apply -f nginx/deploy/deployment.ymal -f nginx/deploy/service.ymal'
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