package com.codeonline.cloud.harbor.service;


import com.codeonline.cloud.harbor.model.HarborUpload;
import org.springframework.web.multipart.MultipartFile;

public interface IUploadService {
    void dockerfileToImageAndPush(HarborUpload harborUpload, String harborKey);

    void loadImageAndPush(HarborUpload harborUpload,String harborKey);

    void importImageAndPush(HarborUpload harborUpload,String harborKey);

    String uploadFile(MultipartFile file) throws Exception;
}
