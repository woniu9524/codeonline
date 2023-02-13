package com.codeonline.cloud.harbor.api;


import com.codeonline.cloud.harbor.api.model.Artifact;
import com.codeonline.cloud.harbor.api.model.Repository;
import com.codeonline.cloud.harbor.api.model.Tag;
import com.codeonline.cloud.utils.RestTemplateUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class RepositoryApi {
    @Value("${harbor.harborUrl}")
    private String harborUrl;

    @Value("${harbor.harborSpace}")
    private String harborSpace;

    private String getBasePath() {
        return "http://"+harborUrl+"/api/v2.0/projects/"+harborSpace+"/repositories";
    }

    private Map<String,String> getHeaders(){
        HashMap<String, String> headers = new HashMap<>();
        headers.put("Authorization" ,"Basic "+ Base64.getEncoder().encodeToString("admin:Harbor12345".getBytes()));
        return headers;
    }

    // list
    public List<Repository> listRepository() {
        try {
            ResponseEntity<String> stringResponseEntity = RestTemplateUtils.get(getBasePath(), getHeaders(), String.class);
            Gson gson = new Gson();
            return gson.fromJson(stringResponseEntity.getBody(), new TypeToken<List<Repository>>(){}.getType());
        }catch (Exception e){
            return null;
        }
    }
    // get
    public Repository getRepository(String name) {
        try{
            ResponseEntity<String> stringResponseEntity = RestTemplateUtils.get(getBasePath()+"/"+name, getHeaders(), String.class);
            Gson gson = new Gson();
            return gson.fromJson(stringResponseEntity.getBody(), Repository.class);
        }catch (Exception e){
            return null;
        }
    }
    // get tags
    public List<String> getRepositoryTags(String name) {
        try{
            ResponseEntity<String> stringResponseEntity = RestTemplateUtils.get(getBasePath()+"/"+name+"/artifacts?with_tag=true", getHeaders(), String.class);
            Gson gson = new Gson();
            List<Artifact> artifacts= gson.fromJson(stringResponseEntity.getBody(), new TypeToken<List<Artifact>>() {
            }.getType());
            // 读取tag的name
            List<String> tags = new ArrayList<>();
            for (Artifact artifact : artifacts) {
                if (artifact.getTags()!=null){
                    for (Tag tag : artifact.getTags()) {
                        tags.add(tag.getName());
                    }
                }
            }
            return tags;
        }catch (Exception e){
            return null;
        }
    }


}
