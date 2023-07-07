package kh.lclass.udp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class Sender {
	public static void main(String[] args) {
		new Sender().senderUdp();
	}
	
	public void senderUdp() {
		int myPort = 5001;
		int destPort = 6001;
		String destName = "localhost";
		DatagramSocket dSock = null;
		BufferedReader br = null;
		try {
			dSock = new DatagramSocket(myPort); //매개인자 없으면 자동port 번호 할당. 지정하면 해당 포트 번호로 소켓 생성	
			br = new BufferedReader(new InputStreamReader(System.in));
			while (true) {
				System.out.println("입력>>");
				String sendMsg = br.readLine(); // console 입력받음
				if(sendMsg.equals("exit")) {
					break;
				}
				
				InetAddress destIp = null;
				try {
					destIp = InetAddress.getByName(destName);
					byte[] byteMsg = sendMsg.getBytes();
					DatagramPacket sendData = new DatagramPacket(byteMsg, byteMsg.length, destIp, destPort);
					dSock.send(sendData);
				} catch (UnknownHostException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				byte[] byteMsg = new byte[1000];
				DatagramPacket receivedData = new DatagramPacket(byteMsg, byteMsg.length);
				dSock.receive(receivedData);
				System.out.println("===전달받은 정보들 ====");
				System.out.println(byteMsg.length);
				System.out.println(receivedData.getData().length);
				System.out.println(receivedData.getLength());
				System.out.println(receivedData.getAddress()); // 전달받은 메시지의 발신IP
				System.out.println(receivedData.getPort()); // 전달받은 메시지의 발신Port

				String receivedStr = new String(receivedData.getData());
				System.out.println("수신메시지 :" + receivedStr);
			}

		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(dSock != null) dSock.close();
		}

	}
}
