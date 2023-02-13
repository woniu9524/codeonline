package com.codeonline.cloud.k8s.model;


import com.codeonline.common.core.constant.CloudConstants;
import io.fabric8.kubernetes.api.model.*;
import io.fabric8.kubernetes.client.KubernetesClient;
import io.fabric8.kubernetes.client.KubernetesClientBuilder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: zhangcheng
 * @Date: 2023/1/9 11:54 星期一
 * @Description: k8s服务的模型
 */
public class K8sService {


    private K8sConfigure k8sConfigure;

    private String labId;

    private String studentId;

    private String teacherId;

    private List<Map<String,Integer>> ports;

    Map<String, String> labels=new HashMap<>();
    ObjectMeta serviceMetadata = new ObjectMeta();//service的metadata
    List<ServicePort> servicePorts = new ArrayList<>();//service的端口
    ServiceSpec serviceSpec = new ServiceSpec();//service的spec
    Service service = new Service();//service

    KubernetesClient client= new KubernetesClientBuilder().build();


    private void populateLabels() {
        labels.put("app", "codeonline-app");
        labels.put("teacherId", teacherId);
        labels.put("studentId", studentId);
        labels.put("labID", labId);
    }

    private void populateServiceMetadata() {
        serviceMetadata.setLabels(labels);
        serviceMetadata.setName("codeonline-service-"+labId+"-"+studentId);
        serviceMetadata.setNamespace(CloudConstants.K8S_NAMESPACE);
    }



    private void populateServicePorts() {
        for (Map<String,Integer> port:ports) {
            ServicePort servicePort = new ServicePort();
            servicePort.setName("tcp-"+port.get("port"));
            servicePort.setPort(port.get("port"));
            servicePort.setTargetPort(new IntOrString(port.get("targetPort")));
            servicePort.setProtocol("TCP");
            if (port.get("nodePort")!=null){
                servicePort.setNodePort(port.get("nodePort"));
            }
            servicePorts.add(servicePort);
        }
    }

    private void populateServiceSpec() {
        serviceSpec.setType("NodePort");
        serviceSpec.setSelector(labels);
        serviceSpec.setPorts(servicePorts);
    }

    private void populateService() {
        service.setApiVersion("v1");
        service.setMetadata(serviceMetadata);
        service.setSpec(serviceSpec);
    }



    public Service populate() {
        populateLabels();
        populateServiceMetadata();
        populateServicePorts();
        populateServiceSpec();
        populateService();
        return service;
    }


    public K8sService() {
    }

    public K8sService(K8sConfigure k8sConfigure, String labId, String studentId, String teacherId, List<Map<String, Integer>> ports) {
        this.k8sConfigure = k8sConfigure;
        this.labId = labId;
        this.studentId = studentId;
        this.teacherId = teacherId;
        this.ports = ports;
    }

    public K8sConfigure getK8sConfigure() {
        return k8sConfigure;
    }

    public void setK8sConfigure(K8sConfigure k8sConfigure) {
        this.k8sConfigure = k8sConfigure;
    }

    public String getLabId() {
        return labId;
    }

    public void setLabId(String labId) {
        this.labId = labId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public List<Map<String, Integer>> getPorts() {
        return ports;
    }

    public void setPorts(List<Map<String, Integer>> ports) {
        this.ports = ports;
    }
}