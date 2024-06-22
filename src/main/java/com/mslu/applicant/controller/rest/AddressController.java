package com.mslu.applicant.controller.rest;

import com.mslu.applicant.entity.User;
import com.mslu.applicant.entity.references.Area;
import com.mslu.applicant.entity.references.District;
import com.mslu.applicant.entity.references.Locality;
import com.mslu.applicant.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@RestController
public class AddressController {

    @Autowired
    public CountryRepository countryRepository;

    @Autowired
    public AreaRepository areaRepository;

    @Autowired
    public DistrictRepository districtRepository;

    @Autowired
    public TypeLocalityRepository typeLocalityRepository;

    @Autowired
    public LocalityRepository localityRepository;

    @GetMapping("/area")
    public Map<String,String> getArea(@AuthenticationPrincipal User user, @RequestParam(value = "registrationCountry", defaultValue = "0") String idCountry) {
        Iterable<Area> areas = areaRepository.findByCountry(countryRepository.findCountryById(Integer.parseInt(idCountry)));

        Map<String,String> areaResult = new HashMap<String, String>();

        for (Area area: areas) {
            areaResult.put(area.getId().toString(),area.getName());
        }
        areaResult.put("","Выберите область");

        return areaResult;
    }

    @GetMapping("/district")
    public Map<String,String> getDistrict(@AuthenticationPrincipal User user, @RequestParam(value = "areaReg", defaultValue = "0") String idArea) {
        Iterable<District> districts = districtRepository.findByAreaAndActiveTrue(areaRepository.findAreaById(Integer.parseInt(idArea)));

        Map<String,String> districtResult = new HashMap<String, String>();

        for (District district: districts) {
            districtResult.put(district.getId().toString(),district.getName());
        }
        districtResult.put("","Выберите район");

        return districtResult;
    }

    @GetMapping("/locality")
    public Map<String,String> getDistrict(@AuthenticationPrincipal User user,
                                          @RequestParam(value = "areaReg", defaultValue = "0") String idArea,
                                          @RequestParam(value = "districtReg", defaultValue = "0") String idDistrict,
                                          @RequestParam(value = "typeLocalityReg", defaultValue = "0") String idTypeLocality) {
        Iterable<Locality> localities = localityRepository.findByAreaAndDistrictAndTypeLocalityOrderByNameAsc(
                areaRepository.findAreaById(Integer.parseInt(idArea)),
                Integer.parseInt(idDistrict),
                typeLocalityRepository.findTypeLocalityById(Integer.parseInt(idTypeLocality)));

        Map<String,String> localityResult = new HashMap<String, String>();

        for (Locality locality: localities) {
            localityResult.put(locality.getId().toString(),locality.getName());
        }
        localityResult.put("","Выберите нас.пункт");

        return localityResult;
    }

    @PostMapping(value = "/upload")
    public ResponseEntity<?> upload(@RequestParam(value = "photoAbit") MultipartFile file){
        // TODO check file is not null and save
        return new ResponseEntity<>(HttpStatus.valueOf(200));
    }

}
