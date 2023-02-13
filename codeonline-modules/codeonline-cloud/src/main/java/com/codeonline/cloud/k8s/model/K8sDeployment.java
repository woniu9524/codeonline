package com.codeonline.cloud.k8s.model;

import com.codeonline.common.core.constant.CloudConstants;
import com.codeonline.common.core.utils.StringUtils;
import io.fabric8.kubernetes.api.model.*;
import io.fabric8.kubernetes.api.model.apps.Deployment;
import io.fabric8.kubernetes.api.model.apps.DeploymentSpec;
import io.fabric8.kubernetes.client.KubernetesClient;
import io.fabric8.kubernetes.client.KubernetesClientBuilder;

import java.util.*;


/**
 * @Author: zhangcheng
 * @Date: 2023/1/9 13:32 星期一
 * @Description: k8s部署模型
 */
public class K8sDeployment {

    private K8sConfigure k8sConfigure;

    private String labId;

    private String studentId;

    private String teacherId;

    private String nfsPath;

    private String nfsServer;

    KubernetesClient client = new KubernetesClientBuilder().build();

    Container container = new Container();// 容器

    List<ContainerPort> containerPorts = new ArrayList<>();// 容器端口

    List<EnvVar> envVars = new ArrayList<>();// 环境变量

    List<VolumeMount> volumeMounts = new ArrayList<>();// 挂载卷

    List<Volume> volumes = new ArrayList<>();// 卷

    Map<String, String> labels = new HashMap<>();// 标签

    ObjectMeta PodMetadata = new ObjectMeta();// Pod的metadata

    ObjectMeta deploymentMetadata = new ObjectMeta();// deployment的metadata

    PodTemplateSpec podTemplateSpec = new PodTemplateSpec();// Pod模板

    Deployment deployment = new Deployment();// deployment

    PodSpec podSpec = new PodSpec();// Pod的spec

    DeploymentSpec deploymentSpec = new DeploymentSpec();// deployment的spec

    private void populateLabels() {
        labels.put("app", "codeonline-app");
        labels.put("teacherId", teacherId);
        labels.put("studentId", studentId);
        labels.put("labID", labId);
    }

    private void populatePodMetadata() {
        PodMetadata.setLabels(labels);
        PodMetadata.setName("codeonline-pod-" + labId + "-" + studentId);
    }

    private void populateDeploymentMetadata() {
        deploymentMetadata.setLabels(labels);
        deploymentMetadata.setName("codeonline-deployment-" + labId + "-" + studentId);
        deploymentMetadata.setNamespace(CloudConstants.K8S_NAMESPACE);
    }

    private void populateContainerPorts() {
        for (int i = 0; i < containerPorts.size(); i++) {
            ContainerPort containerPort = new ContainerPort();
            containerPort.setContainerPort(containerPorts.get(i).getContainerPort());
            containerPort.setName("tcp-" + containerPorts.get(i).getContainerPort());
            containerPort.setProtocol("TCP");
            containerPorts.add(containerPort);
        }
    }

    private void populateEnvVars() {
        for (int i = 0; i < k8sConfigure.getEnvs().size(); i++) {
            Map<String, String> env = k8sConfigure.getEnvs().get(i);
            if (!env.isEmpty()) {
                EnvVar envVar = new EnvVar();
                envVar.setName(env.get("key"));
                envVar.setValue(env.get("value"));
                envVars.add(envVar);
            }
        }
    }

    private void populateVolumeMounts() {
        if(!StringUtils.isEmpty(k8sConfigure.getVolume())&&!StringUtils.isEmpty(nfsPath) && !StringUtils.isEmpty(nfsServer)){
            VolumeMount volumeMount = new VolumeMount();
            volumeMount.setName("code-volume-" + labId + "-" + studentId);
            volumeMount.setMountPath(k8sConfigure.getVolume());
            volumeMounts.add(volumeMount);
        }
    }

    private void populateVolumes() {
        if (!StringUtils.isEmpty(k8sConfigure.getVolume())&&!StringUtils.isEmpty(nfsPath) && !StringUtils.isEmpty(nfsServer)) {
            Volume volume = new Volume();
            volume.setName("code-volume-" + labId + "-" + studentId);
            volume.setNfs(new NFSVolumeSource(nfsPath, false, nfsServer));
            volumes.add(volume);
        }
    }

    private void populateContainer() {
        container.setImage(k8sConfigure.getImageName());
        container.setName("codeonline-container-" + labId + "-" + studentId);
        container.setPorts(containerPorts);
        container.setEnv(envVars);
        if (!StringUtils.isEmpty(k8sConfigure.getStartCmd())) {
            container.setCommand(Collections.singletonList(k8sConfigure.getStartCmd()));
            if(!StringUtils.isEmpty(k8sConfigure.getStartArgs())){
                String[] split = k8sConfigure.getStartArgs().split("，|,| ");
                container.setArgs(Arrays.asList(split));
            }
        }
        container.setSecurityContext(new SecurityContextBuilder().withPrivileged(k8sConfigure.isPrivilege()).build());
        container.setVolumeMounts(volumeMounts);
    }




    private void populatePodSpec() {
        podSpec.setContainers(new ArrayList<Container>() {{
            add(container);
        }});
        podSpec.setRestartPolicy("Always");
        podSpec.setDnsPolicy("ClusterFirst");
        if ("harbor".equals(k8sConfigure.getSourceFrom())){
            List<LocalObjectReference> localObjectReferences = new ArrayList<>();
            localObjectReferences.add(new LocalObjectReference("harbor-registry-secret"));
            podSpec.setImagePullSecrets(localObjectReferences);
        }
        podSpec.setSchedulerName("default-scheduler");
        podSpec.setVolumes(volumes);
    }

    private void populatePodTemplateSpec() {
        podTemplateSpec.setMetadata(PodMetadata);
        podTemplateSpec.setSpec(podSpec);
    }

    private void populateDeploymentSpec() {
        deploymentSpec.setReplicas(1);
        LabelSelector labelSelector = new LabelSelector();
        labelSelector.setMatchLabels(labels);
        deploymentSpec.setSelector(labelSelector);
        deploymentSpec.setTemplate(podTemplateSpec);
    }

    private void populateDeployment() {
        deployment.setMetadata(deploymentMetadata);
        deployment.setSpec(deploymentSpec);
    }



    public Deployment populate(){
        populateLabels();// 设置标签
        populatePodMetadata();// 设置Pod的metadata
        populateDeploymentMetadata();// 设置deployment的metadata
        populateContainerPorts();// 设置容器端口
        populateEnvVars();// 设置环境变量
        populateVolumeMounts();// 设置挂载卷
        populateContainer();// 设置容器
        populateVolumes();// 设置卷
        populatePodSpec();// 设置Pod的spec
        populatePodTemplateSpec();// 设置Pod模板
        populateDeploymentSpec();// 设置deployment的spec
        populateDeployment();// 设置deployment
        return deployment;
    }




    public K8sDeployment() {
    }

    public K8sDeployment(K8sConfigure k8sConfigure, String labId, String studentId, String teacherId,String nfsPath, String nfsServer) {
        this.k8sConfigure = k8sConfigure;
        this.labId = labId;
        this.studentId = studentId;
        this.teacherId = teacherId;
        this.nfsPath = nfsPath;
        this.nfsServer = nfsServer;
    }


}