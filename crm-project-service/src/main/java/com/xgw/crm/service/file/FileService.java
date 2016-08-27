package com.xgw.crm.service.file;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.xgw.crm.entity.product.UploadFile;


public interface FileService {
	 public UploadFile saveFile(HttpServletRequest request) throws IOException;
}
