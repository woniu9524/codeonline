package com.codeonline.cloud.harbor.service;


import com.codeonline.cloud.harbor.model.HarborUpload;

public interface IUploadService {
    void dockerfileToImageAndPush(HarborUpload harborUpload, String harborKey);

    void loadImageAndPush(HarborUpload harborUpload,String harborKey);

    void importImageAndPush(HarborUpload harborUpload,String harborKey);
}
