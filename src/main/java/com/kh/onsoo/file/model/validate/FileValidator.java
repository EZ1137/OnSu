package com.kh.onsoo.file.model.validate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.onsoo.file.model.dto.UploadFile;

@Service
// service : biz
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		UploadFile file = (UploadFile) target;
		
		// file이 없으면
		if (file.getMpfile().getSize() == 0) {
			errors.rejectValue("mpfile", "fileNPE", "Please select a file");
		}
	}

}
