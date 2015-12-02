package com.rag.mvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.rag.form.FileUploadForm;

@Controller
@RequestMapping("/mvc")
public class FileUploadController
{
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String save(@ModelAttribute("uploadForm") FileUploadForm uploadForm, Model map) {
 
        MultipartFile multipartFile = uploadForm.getFile();
 
        String fileName = "default.txt";
 
        if (multipartFile != null) {
            fileName = multipartFile.getOriginalFilename();
        }
         
        //read and store the file as you like
 
        map.addAttribute("files", fileName);
        return "fileuploadSuccess";
    }
}