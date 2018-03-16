package websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.OriginHandshakeInterceptor;

@Configuration
@EnableWebSocket//開啟websocket
public class WebSocketConfig implements WebSocketConfigurer {
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    	registry.addHandler(new WebSocketHander(), "/").addInterceptors(new OriginHandshakeInterceptor()).setAllowedOrigins("http://localhost:8090").setAllowedOrigins("http://localhost").setAllowedOrigins("https://localhost").setAllowedOrigins("https://localhost");;
    	registry.addHandler(new WebSocketHander(), "/").addInterceptors(new HandshakeInterceptor()).setAllowedOrigins("http://127.0.0.1:8090").setAllowedOrigins("http://localhost:8090");
        registry.addHandler(new WebSocketHander(),"/echo").addInterceptors(new HandshakeInterceptor()).setAllowedOrigins("http://127.0.0.1");; //支援websocket
        registry.addHandler(new WebSocketHander(),"/sockjs/echo").addInterceptors(new HandshakeInterceptor()).withSockJS(); //不支援websocket
    }
}