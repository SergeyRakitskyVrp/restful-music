package by.wind.restful.mvc;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Writer;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LastFmController {
	
	@Value("${lastfm.apilink}")
	private String apiLink;

	@RequestMapping("/lastfm/tracks/{query}")
	public void photos(@PathVariable("query")  String query, Writer writer) throws Exception {
		String connectToUrl = apiLink+query;
		URL url = new URL(connectToUrl);
        URLConnection conn = url.openConnection();
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String readLine = "";
        while ((readLine = br.readLine()) != null)
        {
        	writer.write(readLine);
        }
	}
}
