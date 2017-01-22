package com.hr.manager.engine;

import java.io.File;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class ProcessorEngine {

	private static final String XSLT_RESOURCE = "employee_transformer.xslt";

	String inputResource;
	String outputUrl;

	public ProcessorEngine(String inputResource, String outputUrl) {
		this.inputResource = inputResource;
		this.outputUrl = outputUrl;
	}

	public void process() {
		Transformer transformer = createTransformer();

		try {
			transformer.transform(new StreamSource(new File(getResourcePath(inputResource))),
					new StreamResult(new File(outputUrl)));
		} catch (TransformerException e) {
			throw new RuntimeException(e);
		}
	}

	private Transformer createTransformer() {
		try {
			return TransformerFactory.newInstance()
					.newTransformer(new StreamSource(new File(getResourcePath(XSLT_RESOURCE))));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private String getResourcePath(String resource) {
		return this.getClass().getResource(resource).getPath();
	}
}
