package com.codeonline.cloud.utils;

import com.codeonline.cloud.shell.ShellMan;
import com.codeonline.common.core.constant.CloudConstants;
import io.fabric8.kubernetes.api.model.*;
import io.fabric8.kubernetes.api.model.apps.Deployment;
import io.fabric8.kubernetes.api.model.extensions.Ingress;
import io.fabric8.kubernetes.client.KubernetesClient;
import io.fabric8.kubernetes.client.KubernetesClientBuilder;
import io.fabric8.kubernetes.client.dsl.ServiceResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/9 10:48 星期一
 * @Description:
 */
@Component
public class K8sUtil {

    @Autowired
    private ShellMan shellMan;


    KubernetesClient client = new KubernetesClientBuilder().build();

    public K8sUtil() throws IOException {
    }


    /*
     *  获取一个可以使用的NodePort
     * */
    public Integer readNodePortCanUse() throws IOException {
        String exec = shellMan.exec("kubectl get svc --all-namespaces -o go-template='{{range .items}}{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{\"\\n\"}}{{end}}{{end}}{{end}}'");
        String[] split = exec.split("\n");
        List<Integer> usedPorts = new ArrayList<>();
        for (String s : split) {
            usedPorts.add(Integer.valueOf(s));
        }
        // 默认端口范围：30000-32767，我使用30500-32767
        for (int i = 30500; i < 32767; i++) {
            if (!usedPorts.contains(i)) {
                return i;
            }
        }
        return null;
    }

    /*
    * 删除一个Deployment
    * */
    public List<StatusDetails> deleteDeployment(String deploymentName) {
        return client.apps().deployments().inNamespace(CloudConstants.K8S_NAMESPACE).withName(deploymentName).delete();
    }

    /*
    * 删除一个Service
     */
    public List<StatusDetails> deleteService(String serviceName) {
        return client.services().inNamespace(CloudConstants.K8S_NAMESPACE).withName(serviceName).delete();
    }

    /*
    * 删除一个Pod
     */
    public List<StatusDetails> deletePod(String podName) {
        return client.pods().inNamespace(CloudConstants.K8S_NAMESPACE).withName(podName).delete();
    }

    /*
    * 删除一个Namespace
     */
    public List<StatusDetails> deleteNamespace(String namespaceName) {
        return client.namespaces().withName(namespaceName).delete();
    }

    /*
    * 删除一个Ingress
     */
    public List<StatusDetails> deleteIngress(String ingressName) {
        return client.extensions().ingresses().inNamespace(CloudConstants.K8S_NAMESPACE).withName(ingressName).delete();
    }

    /*
    * 删除一个ConfigMap
     */
    public List<StatusDetails> deleteConfigMap(String configMapName) {
        return client.configMaps().inNamespace(CloudConstants.K8S_NAMESPACE).withName(configMapName).delete();
    }

    /*
    * 删除一个Secret
     */
    public List<StatusDetails> deleteSecret(String secretName) {
        return client.secrets().inNamespace(CloudConstants.K8S_NAMESPACE).withName(secretName).delete();
    }

    /*
    * 获取一个Deployment
    * */
    public Deployment getDeployment(String deploymentName) {
        return client.apps().deployments().inNamespace(CloudConstants.K8S_NAMESPACE).withName(deploymentName).get();
    }

    /*
    * 获取一个Service
    *
     */
    public Service getService(String serviceName) {
        return client.services().inNamespace(CloudConstants.K8S_NAMESPACE).withName(serviceName).get();
    }

    /*
    *  通过Deployment删除Deployment
    * */
    public List<StatusDetails> deleteDeployment(Deployment deployment) {
        return client.apps().deployments().inNamespace(CloudConstants.K8S_NAMESPACE).withName(deployment.getMetadata().getName()).delete();
    }

    /*
    *  通过Service删除Service
    * */
    public List<StatusDetails> deleteService(Service service) {
        return client.services().inNamespace(CloudConstants.K8S_NAMESPACE).withName(service.getMetadata().getName()).delete();
    }

    /*
    * 获取一个Pod
     */
    public Pod getPod(String podName) {
        return client.pods().inNamespace(CloudConstants.K8S_NAMESPACE).withName(podName).get();
    }

    /*
    * 获取一个Namespace
     */
    public Namespace getNamespace(String namespaceName) {
        return client.namespaces().withName(namespaceName).get();
    }

    /*
    * 获取一个Ingress
     */
    public Ingress getIngress(String ingressName) {
        return client.extensions().ingresses().inNamespace(CloudConstants.K8S_NAMESPACE).withName(ingressName).get();
    }

    /*
    * 获取一个ConfigMap
     */
    public ConfigMap getConfigMap(String configMapName) {
        return client.configMaps().inNamespace(CloudConstants.K8S_NAMESPACE).withName(configMapName).get();
    }

    /*
    * 获取一个Secret
     */
    public Secret getSecret(String secretName) {
        return client.secrets().inNamespace(CloudConstants.K8S_NAMESPACE).withName(secretName).get();
    }

    /*
    * 创建一个Deployment
     */
    public Deployment createDeployment(Deployment deployment) {
        return client.apps().deployments().inNamespace(CloudConstants.K8S_NAMESPACE).resource(deployment).create();
    }

    /*
    * 创建一个Service
     */
    public Service createService(Service service) {
        return client.services().inNamespace(CloudConstants.K8S_NAMESPACE).resource(service).create();
    }

    /*
    * 创建一个Pod
     */
    public Pod createPod(Pod pod) {
        return client.pods().inNamespace(CloudConstants.K8S_NAMESPACE).resource(pod).create();
    }

    /*
    * 创建一个Namespace
     */
    public Namespace createNamespace(Namespace namespace) {
        return client.namespaces().resource(namespace).create();
    }

    /*
    * 创建一个Ingress
     */
    public Ingress createIngress(Ingress ingress) {
        return client.extensions().ingresses().inNamespace(CloudConstants.K8S_NAMESPACE).resource(ingress).create();
    }

    /*
    * 创建一个ConfigMap
     */
    public ConfigMap createConfigMap(ConfigMap configMap) {
        return client.configMaps().inNamespace(CloudConstants.K8S_NAMESPACE).resource(configMap).create();
    }

    /*
    * 创建一个Secret
     */
    public Secret createSecret(Secret secret) {
        return client.secrets().inNamespace(CloudConstants.K8S_NAMESPACE).resource(secret).create();
    }

    /*
    * 更新一个Deployment
     */
    public Deployment updateDeployment(Deployment deployment) {
        return client.apps().deployments().inNamespace(CloudConstants.K8S_NAMESPACE).resource(deployment).createOrReplace();
    }

    /*
    * 更新一个Service
     */
    public Service updateService(Service service) {
        return client.services().inNamespace(CloudConstants.K8S_NAMESPACE).resource(service).createOrReplace();
    }

    /*
    * 更新一个Pod
     */
    public Pod updatePod(Pod pod) {
        return client.pods().inNamespace(CloudConstants.K8S_NAMESPACE).resource(pod).createOrReplace();
    }

    /*
    * 更新一个Namespace
     */
    public Namespace updateNamespace(Namespace namespace) {
        return client.namespaces().createOrReplace(namespace);
    }

    /*
    * 更新一个Ingress
     */
    public Ingress updateIngress(Ingress ingress) {
        return client.extensions().ingresses().inNamespace(CloudConstants.K8S_NAMESPACE).resource(ingress).createOrReplace();
    }

    /*
    * 更新一个ConfigMap
     */
    public ConfigMap updateConfigMap(ConfigMap configMap) {
        return client.configMaps().inNamespace(CloudConstants.K8S_NAMESPACE).resource(configMap).createOrReplace();
    }

    /*
    * 更新一个Secret
     */
    public Secret updateSecret(Secret secret) {
        return client.secrets().inNamespace(CloudConstants.K8S_NAMESPACE).resource(secret).createOrReplace();
    }

    /*
    * 获取所有的Deployment
     */
    public List<Deployment> listDeployment() {
        return client.apps().deployments().inNamespace(CloudConstants.K8S_NAMESPACE).list().getItems();
    }

    /*
    * 获取所有的Service
     */
    public List<Service> listService() {
        return client.services().inNamespace(CloudConstants.K8S_NAMESPACE).list().getItems();
    }

    /*
    * 获取所有的Pod
     */
    public List<Pod> listPod() {
        return client.pods().inNamespace(CloudConstants.K8S_NAMESPACE).list().getItems();
    }

    /*
    * 获取所有的Namespace
     */
    public List<Namespace> listNamespace() {
        return client.namespaces().list().getItems();
    }

    /*
    * 获取所有的Ingress
     */
    public List<Ingress> listIngress() {
        return client.extensions().ingresses().inNamespace(CloudConstants.K8S_NAMESPACE).list().getItems();
    }

    /*
    * 获取所有的ConfigMap
     */
    public List<ConfigMap> listConfigMap() {
        return client.configMaps().inNamespace(CloudConstants.K8S_NAMESPACE).list().getItems();
    }

    /*
    * 获取所有的Secret
     */
    public List<Secret> listSecret() {
        return client.secrets().inNamespace(CloudConstants.K8S_NAMESPACE).list().getItems();
    }

    /*
    * 获取service的port,targetPort,NodePort
     */
    public List<ServicePort> getServicePort(String serviceName) {
        ServiceResource<Service> serviceServiceResource = client.services().inNamespace(CloudConstants.K8S_NAMESPACE).withName(serviceName);
        if (serviceServiceResource == null) {
            return null;
        }
        return serviceServiceResource.get().getSpec().getPorts();
    }


}