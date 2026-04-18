package com.spring.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.entity.Company;
import com.spring.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GeminiAIServiceImpl implements AIService {

    @Autowired 
    private RestTemplate restTemplate;

    // This method now safely gets the key from Render
    private String getApiKey() {
        return System.getenv("GEMINI_KEY");
    }

    @Override
    public String getAiInsight(Student s, Company c, String poDecision) {
        String apiKey = getApiKey();
        
        // Handle case where API Key is missing (prevents crash)
        if (apiKey == null || apiKey.isEmpty()) {
            return "AI Analysis: Your profile looks promising for " + c.getName() + ". (API Key missing in Environment)";
        }

        String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + apiKey;

        try {
            long timestamp = System.currentTimeMillis();
            String prompt = String.format(
                "Time:%d. User:%s. Status:%s. " +
                "Analyze Student(Skills:%s, CGPA:%.2f) vs Company(%s, Needs:%s). " +
                "Instruction: If status is 'Not Evaluated', explain exactly which skill is missing. " +
                "If status is 'Shortlisted', give 1 specific interview tip for %s. " +
                "End with a unique motivation line. Do not use generic templates. Max 45 words.",
                timestamp, s.getName(), poDecision, s.getSkills(), s.getCgpa(), 
                c.getName(), c.getRequiredSkills(), c.getName()
            );

            Map<String, Object> requestBody = new HashMap<>();
            List<Map<String, Object>> contents = new ArrayList<>();
            Map<String, Object> content = new HashMap<>();
            List<Map<String, Object>> parts = new ArrayList<>();
            Map<String, Object> part = new HashMap<>();

            part.put("text", prompt);
            parts.add(part);
            content.put("parts", parts);
            contents.add(content);
            requestBody.put("contents", contents);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

            ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
            JsonNode root = new ObjectMapper().readTree(response.getBody());
            
            return root.path("candidates").get(0).path("content").path("parts").get(0).path("text").asText();

        } catch (Exception e) {
            e.printStackTrace();
            return "AI Analysis: Focus on sharpening your skills in " + c.getRequiredSkills() + " to improve your chances!";
        }
    }
}