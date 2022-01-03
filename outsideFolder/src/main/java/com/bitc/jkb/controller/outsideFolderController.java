package com.bitc.jkb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class outsideFolderController {

		@RequestMapping("/out/outsideFoler.do")
		public String outsideFolder() throws Exception {
			return "/out/outsideFolder";
		}
	
}
