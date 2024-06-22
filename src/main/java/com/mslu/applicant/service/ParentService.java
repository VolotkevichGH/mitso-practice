package com.mslu.applicant.service;

import com.mslu.applicant.entity.references.Parent;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class ParentService {

    public Parent getParent(String lastName, String firstName, String middleName, String phone, String workPlace, String position, String address, boolean isMother, String legalRepresentative) {
        Parent parent = new Parent();

        parent.setLegalRepresentative(false);

        parent.setLastName(lastName);
        parent.setFirstName(firstName);
        parent.setMiddleName(middleName);
        parent.setPhone(phone);
        parent.setWorkPlace(workPlace);
        parent.setPosition(position);
        parent.setAddress(address);
        parent.setMother(isMother);
        parent.setFather(!isMother);

        if(isMother && legalRepresentative.contentEquals("mother"))
            parent.setLegalRepresentative(true);

        if(!isMother && legalRepresentative.contentEquals("father"))
            parent.setLegalRepresentative(true);

        return parent;
    }

    public boolean isValidParent(String lastName, String firstName, String address) {
        if(StringUtils.isEmpty(lastName) || StringUtils.isEmpty(firstName) || StringUtils.isEmpty(address))
            return false;
        return true;
    }

}
