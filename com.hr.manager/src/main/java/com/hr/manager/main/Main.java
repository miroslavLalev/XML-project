package com.hr.manager.main;

import com.hr.manager.engine.ProcessorEngine;

public class Main {

	public static void main(String[] args) {
		// TODO: create xslt resource and fill test.xml correctly
		// Currently hardcoded my desktop as output file location
		ProcessorEngine engine = new ProcessorEngine("test.xml", "~/Desktop/test.pdf");
		engine.process();
	}
}
