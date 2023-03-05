package com.moegga.app.websocket;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//웹소켓 서버
public class WebSocketServer extends TextWebSocketHandler {


	//접속한 클라이언트를 저장하기 위한 속성(멤버변수)]
	//키는 웹소켓세션 아이디
	private Map<String,WebSocketSession> clients= new HashMap<String, WebSocketSession>();
	
	//클라이언트와 연결이 되었을때 호출되는 콜백 메소드]
	//-컬렉션에 연결된 클라이언트 추가
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId()+"연결 되었어요");
		clients.put(session.getId(), session);
	}
	
	//클라이언트와 연결이 끊었졌을때 호출되는 콜백 메소드]
	//-컬렉션에 저장된 클라이언트 삭제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId()+"연결이 끊어졌어요");
		clients.remove(session.getId());
	}
	
	//클라이언트로 부터 메시지를 받았을때 자동 호출되는 콜백 메소드]
	//클라이언트로부터 전송되는 모든 메시지 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"로 부터 받은 메시지:"+message.getPayload());
		//접속한 모든 클라이언트에게 session.getId()가 보낸
		//메시지 뿌려주기]
		for(WebSocketSession client:clients.values()) {
			if(!session.getId().equals(client.getId()))//자기가 보낸 메시지를 다시 받지 않도록
				client.sendMessage(message);
		}
	}
	
	//클라이언트로부터 전송되는 이미지 처리
	@Override
	
	public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		System.out.println(session.getId()+"로 부터 받은 메시지:"+message.getPayload());
		//바이너리 메시지 발송
		ByteBuffer byteBuffer = message.getPayload();
		System.out.println("byteBuffer" + byteBuffer);
		String fileName = "hOShezF.jpg";
		HttpServletRequest req = null;
		String path = req.getSession().getServletContext().getRealPath("/images");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdir();
		}
		
		File file = new File(path, fileName);
		FileOutputStream out = null;
		FileChannel outChannel = null;
		
		try {
			byteBuffer.flip(); //byteBuffer를 읽기 위해 세팅
			out = new FileOutputStream(file, true); //생성을 위해 OutputStream을 연다.
			outChannel = out.getChannel(); //채널을 열고
			byteBuffer.compact(); //파일을 복사한다.
			outChannel.write(byteBuffer); //파일을 쓴다.
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {
					out.close();
				}
				if(outChannel != null) {
					outChannel.close();
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		byteBuffer.position(0); //파일을 저장하면서 position값이 변경되었으므로 0으로 초기화한다.
		//파일쓰기가 끝나면 이미지를 발송한다.
		List<HashMap<String, Object>> rls = new ArrayList<>();
		int fileUploadIdx = 0;
		HashMap<String, Object> temp = rls.get(fileUploadIdx);
		for(String k : temp.keySet()) {
			if(k.equals("roomNumber")) {
				continue;
			}
			WebSocketSession wss = (WebSocketSession) temp.get(k);
			try {
				wss.sendMessage(new BinaryMessage(byteBuffer)); //초기화된 버퍼를 발송한다.
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	//클라이언트와 통신장애시 자동으로 호출되는 메소드]
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId()+"와 통신 장애 발생 : "+exception.getMessage());
	}
	
	
}
