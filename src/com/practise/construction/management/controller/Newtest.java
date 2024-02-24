package com.practise.construction.management.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class Newtest {
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam CommonsMultipartFile Image) throws IOException {
		String filename = Image.getOriginalFilename();
		System.out.println(Image.getSize());
		System.out.println("E:/Uploads" + "/" + filename);

		String filepath = "E:/Uploads";
		if (Image.isEmpty()) {
			return new ModelAndView("viewCompany", "emptyfile", "Empty file");
		} else {
			byte[] bytes = Image.getBytes();
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filepath + File.separator + filename)));
			stream.write(bytes);
			stream.flush();
			stream.close();
			return new ModelAndView("success", "filesuccess", "File successfully saved!");
		}
	}
}