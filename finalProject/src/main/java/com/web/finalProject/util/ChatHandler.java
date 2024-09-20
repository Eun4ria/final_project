package com.web.finalProject.util;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.HashSet;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler {
    // 채팅방별 세션을 관리할 필드
    private Map<String, Set<WebSocketSession>> chatRooms = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String chatRoomId = getChatRoomId(session);
        chatRooms.computeIfAbsent(chatRoomId, k -> new HashSet<>()).add(session);
        System.out.println(session.getId() + "님이 채팅방 " + chatRoomId + "에 접속했습니다.");
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String chatRoomId = getChatRoomId(session);
        Set<WebSocketSession> sessions = chatRooms.get(chatRoomId);
        if (sessions != null) {
            for (WebSocketSession ws : sessions) {
                if (ws.isOpen() && !session.getId().equals(ws.getId())) {
                    ws.sendMessage(message);
                }
            }
        }
        System.out.println(session.getId() + "에서 온 메시지: " + message.getPayload());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String chatRoomId = getChatRoomId(session);
        Set<WebSocketSession> sessions = chatRooms.get(chatRoomId);
        if (sessions != null) {
            sessions.remove(session);
            if (sessions.isEmpty()) {
                chatRooms.remove(chatRoomId);
            }
        }
        System.out.println(session.getId() + "이 채팅방 " + chatRoomId + "에서 나갔습니다.");
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.out.println(session.getId() + "에러 발생! 예외 내용: " + exception.getMessage());
    }

    private String getChatRoomId(WebSocketSession session) {
        // WebSocketSession에서 채팅방 ID를 추출하는 로직을 추가합니다.
        return (String) session.getAttributes().get("chatRoomId");
    }
}
