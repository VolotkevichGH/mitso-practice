package com.mslu.applicant.service;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.html2pdf.resolver.font.DefaultFontProvider;
import com.itextpdf.io.font.PdfEncodings;
import com.mslu.applicant.Application;
import com.mslu.applicant.entity.Profile;
import com.mslu.applicant.entity.User;
import com.mslu.applicant.entity.references.District;
import com.mslu.applicant.repos.DistrictRepository;
import com.mslu.applicant.repos.ProfileRepository;
import freemarker.cache.ClassTemplateLoader;
import freemarker.cache.MultiTemplateLoader;
import freemarker.cache.TemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;

@Service
@RequiredArgsConstructor
public class PDFGenerateService {


    private final ProfileRepository profileRepository;
    private final DistrictRepository districtRepository;

    public InputStreamResource html2PdfGenerator(String nameTemplate, User user, Model model) throws java.io.IOException, TemplateException {

        Profile profile = profileRepository.findByUser(user);

        if (!profile.isForeignCheck()) {
            if (profile.getRegistrationLocality() != null) {
                if (profile.getRegistrationLocality().getDistrict() != null) {
                    District district = districtRepository.findDistrictById(profile.getRegistrationLocality().getDistrict());
                    model.addAttribute("district", district);
                }
            }
        }


        String html;

        String output = "result-pdfDoc-" + user.getDocSeries() + user.getDocNumber() + ".pdf";

        model.addAttribute("profile", profile);


        StringWriter stringWriter = new StringWriter();

        Configuration cfg = new Configuration(Configuration.VERSION_2_3_29);

        ClassTemplateLoader ctlAbitForms = new ClassTemplateLoader(Application.class, "/templates/pdf-templates/");
        ClassTemplateLoader ctlContractForms = new ClassTemplateLoader(Application.class, "/templates/pdf-templates/contracts/");

        MultiTemplateLoader mtl = new MultiTemplateLoader(new TemplateLoader[]{ctlAbitForms, ctlContractForms});

        cfg.setTemplateLoader(mtl);


        Template tpl = cfg.getTemplate(nameTemplate);
        tpl.process(model, stringWriter);

        html = stringWriter.toString();
        try {

            ConverterProperties properties = new ConverterProperties();
            DefaultFontProvider fontProvider = new DefaultFontProvider(true, true, false);
            String pdfEncodings = PdfEncodings.UTF8;
            fontProvider.addFont("/static/fonts/times.ttf", pdfEncodings);
            fontProvider.addFont("/static/fonts/timesbd.ttf", pdfEncodings);
            fontProvider.addFont("/static/fonts/timesbi.ttf", pdfEncodings);
            fontProvider.addFont("/static/fonts/timesi.ttf", pdfEncodings);
            fontProvider.addFont("/static/fonts/arial.ttf", pdfEncodings);
            fontProvider.addFont("/static/fonts/arialbd.ttf", pdfEncodings);
            fontProvider.addFont("/static/fonts/arialbi.ttf", pdfEncodings);
            fontProvider.addFont("/static/fonts/ariali.ttf", pdfEncodings);
            fontProvider.addStandardPdfFonts();
            fontProvider.addSystemFonts();

            properties.setFontProvider(fontProvider);

            HtmlConverter.convertToPdf(html, new FileOutputStream(output));
            return new InputStreamResource(new FileInputStream(output));

        } catch (IOException e) {
            return null;
        }

    }
}