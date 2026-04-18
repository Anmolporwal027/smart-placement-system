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
public class AIFeedbackServiceImpl implements AIFeedbackService {

    @Autowired 
    private RestTemplate restTemplate;

    // This method safely gets the key from the environment
    private String getApiKey() {
        return System.getenv("GEMINI_KEY");
    }

    @Override
    public String getAiAdvice(Student s, Company c) {
        String apiKey = getApiKey();
        
        // Safety check: If no key is found, return a generic helpful message instead of crashing
        if (apiKey == null || apiKey.isEmpty()) {
            return "AI Coach: Focus on mastering " + c.getRequiredSkills() + " through hands-on projects to boost your selection chances.";
        }

        String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + apiKey;

        try {
            // PROMPT: Focus on Technical Growth and Preparation
            String prompt = String.format(
                "Student Name: %s, Branch: %s, Current Skills: [%s]. " +
                "Target Company: %s, Required Skills: [%s]. " +
                "Provide 3 professional career advice points: " +
                "1. A specific project idea to bridge the skill gap. " +
                "2. One advanced technical topic to study for this role. " +
                "3. A mock interview question they should prepare for. " +
                "Keep it concise and encouraging (Max 60 words).",
                s.getName(), s.getBranch(), s.getSkills(), c.getName(), c.getRequiredSkills()
            );

            // Building the JSON structure (Java 8 compatible)
            Map<String, Object> requestBody = new HashMap<>();
            List<Map<String, Object>> contentsList = new ArrayList<>();
            Map<String, Object> contentObject = new HashMap<>();
            List<Map<String, Object>> partsList = new ArrayList<>();
            Map<String, Object> textPart = new HashMap<>();

            textPart.put("text", prompt);
            partsList.add(textPart);
            contentObject.put("parts", partsList);
            contentsList.add(contentObject);
            requestBody.put("contents", contentsList);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);
            
            ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
            
            JsonNode root = new ObjectMapper().readTree(response.getBody());
            
            return root.path("candidates").get(0)
                       .path("content").path("parts").get(0)
                       .path("text").asText();

        } catch (Exception e) {
            e.printStackTrace();
            return "AI Coach: Start building a project using " + c.getRequiredSkills() + 
                   " to improve your profile for " + c.getName() + "!";
        }
    }
}