package com.mslu.applicant.service;

import com.mslu.applicant.entity.Profile;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class FormValidationService {

//    @Value("${upload.path}")
    private String uploadPath = "D:/work/projects/applicant/src/main/resources/uploads";


    public boolean isPhotoValid (MultipartFile filePhoto) {
        if (filePhoto.getSize() > 200000) return false;

        if(StringUtils.isEmpty(filePhoto.getOriginalFilename()))
            return false;

        String fileExtension = filePhoto.getOriginalFilename().split("\\.")[1];
        if (fileExtension.equals("jpeg") || fileExtension.equals("jpg"))
            return true;

        return false;
    }

    public String savePhoto(MultipartFile filePhoto) throws IOException {
        String uuidPhoto = UUID.randomUUID().toString();
        String resultPhotoFileName = uuidPhoto + "." + filePhoto.getOriginalFilename();
        filePhoto.transferTo(new File(uploadPath + "/" + resultPhotoFileName));
        return resultPhotoFileName;
    }

    public boolean isLegalDataValid(Profile profile) {
        if(profile.getDocTypeLegal() == null) return false;
        if(profile.getDocSeriesLegal() == null) return false;
        if(profile.getDocNumberLegal() == null) return false;
        if(profile.getDocOnDateLegal() == null) return false;
        if(profile.getDocOffDateLegal() == null) return false;
        if(profile.getDocIssuedByLegal() == null) return false;

        return true;
    }

    public boolean isDisciplineSelectValid(Profile profile) {
        if(profile.getForeignLanguage() == null && profile.getForeignLanguagePoint() != null) return false;
        if(profile.getStateLanguage() == null && profile.getStateLanguagePoint() != null) return false;
        if(profile.getForeignLanguage() != null && profile.getForeignLanguagePoint() == null) return false;
        if(profile.getStateLanguage() != null && profile.getStateLanguagePoint() == null) return false;

        return true;
    }

}
