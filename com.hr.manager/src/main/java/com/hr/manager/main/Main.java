package com.hr.manager.main;

import java.io.IOException;

import com.hr.manager.engine.ProcessorEngine;

public class Main {

	public static void main(String[] args) throws IOException {
		ProcessorEngine engine = new ProcessorEngine("test.xml", "test.pdf");
		engine.process();
	}
}
