package websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;

public class HandshakeInterceptor implements org.springframework.web.socket.server.HandshakeInterceptor {

    //進入攔截
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Map<String, Object> map) throws Exception {
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
            String clientName = (String)servletRequest.getServletRequest().getParameter("name");
            
            HttpSession session = servletRequest.getServletRequest().getSession(true);
            if (session != null) {
                //使用userName區分WebSocketHandler，向特定用戶發送
            	session.setAttribute("WEBSOCKET_USERNAME", clientName);
                map.put("WEBSOCKET_USERNAME", clientName);
                System.out.println("WEBSOCKET_USERNAME=" + map.get("WEBSOCKET_USERNAME"));
            }
        }
        return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Exception e) {

    }
    
}