package by.wind.restful.mvc;

import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestOperations;

@Controller
public class VkController {

	private RestOperations vkRestTemplate;
	
	@Value("${vk.apilink}")
	private String apiLink;

	@RequestMapping(value = "/vk/tracks/{query}", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String tracks(@PathVariable("query") String query) throws Exception {
		ObjectNode result = vkRestTemplate
				.getForObject(apiLink+query, ObjectNode.class);
		ArrayNode data = (ArrayNode) result.get("response");
		return data.toString();
		
	}

	public void setvkRestTemplate(OAuth2RestTemplate vkRestTemplate) {
		this.vkRestTemplate = vkRestTemplate;
	}
	

}
