package com.example.SendSmsToMobileNumber.Controllers;


import com.example.SendSmsToMobileNumber.Service.TwilioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/sms")
public class SmsController {

    @Autowired
    private TwilioService smsService;

    @PostMapping("/send")
    public ResponseEntity<?> sendSms(@RequestBody Map<String, String> request) {
        String phone = request.get("phone");
        String message = request.get("message");

        if (phone == null || message == null) {
            return ResponseEntity.badRequest().body("Phone and message are required.");
        }

        String response = smsService.sendSms(phone, message);
        return ResponseEntity.ok(Map.of("messageSid", response));
    }
}