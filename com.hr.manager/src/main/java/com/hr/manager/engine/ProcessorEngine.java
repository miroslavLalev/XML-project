package com.hr.manager.engine;

import static java.nio.file.Files.deleteIfExists;
import static org.apache.xmlgraphics.util.MimeConstants.MIME_PDF;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.xml.sax.SAXException;

public class ProcessorEngine {

	private static final String XSLT_RESOURCE = "employee_transformer.xslt";
	private static final String TEMP_FILE = "temp.fo";

	String inputResource;
	String outputUrl;

	public ProcessorEngine(String inputResource, String outputUrl) {
		this.inputResource = inputResource;
		this.outputUrl = outputUrl;
	}

	public void process() throws IOException {
		File tempFile = new File(TEMP_FILE);
		try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(outputUrl)))) {
			Transformer transformer = createTransformer(new File(getResourcePath(XSLT_RESOURCE)));
			transformer.transform(new StreamSource(new File(getResourcePath(inputResource))),
					new StreamResult(tempFile));

			Fop fop = createFop(stream);
			transformer = TransformerFactory.newInstance().newTransformer();
			transformer.transform(new StreamSource(tempFile), new SAXResult(fop.getDefaultHandler()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			deleteIfExists(tempFile.toPath());
		}
	}

	private Fop createFop(BufferedOutputStream stream) throws FOPException, SAXException, IOException {
		return FopFactory.newInstance(new File(getResourcePath("fo.xconf"))).newFop(MIME_PDF, stream);
	}

	private Transformer createTransformer(File file) throws TransformerException {
		return TransformerFactory.newInstance().newTransformer(new StreamSource(file));
	}

	private String getResourcePath(String resource) {
		return this.getClass().getResource(resource).getPath();
	}
}
