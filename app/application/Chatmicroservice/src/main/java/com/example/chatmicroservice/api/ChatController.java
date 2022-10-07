package com.example.chatmicroservice.api;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.messaging.handler.annotation.MessageMapping;
// import org.springframework.messaging.handler.annotation.Payload;
// import org.springframework.messaging.simp.SimpMessagingTemplate;
// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.chatmicroservice.model.ChatMessage;
import com.example.chatmicroservice.model.ChatNotification;
// import com.example.chatmicroservice.service.ChatMessageService;
// import com.example.chatmicroservice.service.ChatRoomService;

@RestController
@RequestMapping("/chat")
 public class ChatController {

    @Autowired private SimpMessagingTemplate messagingTemplate;
//     @Autowired private ChatMessageService chatMessageService;
//     @Autowired private ChatRoomService chatRoomService;

    @PostMapping("/chat")
    public ResponseEntity<?> processMessage(@RequestBody ChatMessage chatMessage) {
        // var chatId = chatRoomService
        //         .getChatId(chatMessage.getSenderId(), chatMessage.getRecipientId(), true);
        // chatMessage.setChatId(chatId.get());

        // ChatMessage saved = chatMessageService.save(chatMessage);
        // messagingTemplate.convertAndSendToUser(
        //         Integer.toString(chatMessage.getRecipientId()),"/queue/messages",
        //         new ChatNotification(
        //                 saved.getId(),
        //                 saved.getSenderId(),
        //                 saved.getSenderName()));
        
        return new ResponseEntity<>("okay", HttpStatus.OK);
    }


//     @GetMapping("/messages/{senderId}/{recipientId}/count")
//     public ResponseEntity<Long> countNewMessages(
//             @PathVariable int senderId,
//             @PathVariable int recipientId) {

//         return ResponseEntity
//                 .ok(chatMessageService.countNewMessages(senderId, recipientId));
//     }

//     @GetMapping("/messages/{senderId}/{recipientId}")
//     public ResponseEntity<?> findChatMessages ( @PathVariable int senderId,
//                                                 @PathVariable int recipientId) {
//         return ResponseEntity
//                 .ok(chatMessageService.findChatMessages(senderId, recipientId));
//     }

//     @GetMapping("/messages/{id}")
//     public ResponseEntity<?> findMessage ( @PathVariable int id) {
//         return ResponseEntity
//                 .ok(chatMessageService.findById(id));
//     }
 }
